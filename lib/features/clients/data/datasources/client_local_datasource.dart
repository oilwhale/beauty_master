import 'package:injectable/injectable.dart';
import 'package:drift/drift.dart';
import '../../../../core/database/database.dart';
import '../../../../core/error/exceptions.dart';
import '../models/client_model.dart';

/// Локальный источник данных для клиентов
abstract class ClientLocalDataSource {
  Future<List<ClientModel>> getClients({
    String? searchQuery,
    int page = 1,
    int limit = 20,
  });

  Future<ClientModel> getClientById(int id);
  Future<ClientModel> createClient(ClientModel client);
  Future<ClientModel> updateClient(ClientModel client);
  Future<void> deleteClient(int id);
  Future<List<ClientModel>> getUpcomingBirthdays(int days);
  Future<int> getClientsCount();
}

@Injectable(as: ClientLocalDataSource)
class ClientLocalDataSourceImpl implements ClientLocalDataSource {
  final AppDatabase database;

  ClientLocalDataSourceImpl(this.database);

  @override
  Future<List<ClientModel>> getClients({
    String? searchQuery,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final offset = (page - 1) * limit;
      final clients = await database.getClientsWithSearch(
        searchQuery: searchQuery,
        limit: limit,
        offset: offset,
      );
      return clients.map((c) => ClientModel.fromDrift(c)).toList();
    } catch (e) {
      throw DatabaseException(message: 'Failed to get clients: $e');
    }
  }

  @override
  Future<ClientModel> getClientById(int id) async {
    try {
      final client = await database.getClientById(id);
      if (client == null) {
        throw DataNotFoundException(message: 'Client with id $id not found');
      }
      return ClientModel.fromDrift(client);
    } catch (e) {
      if (e is DataNotFoundException) rethrow;
      throw DatabaseException(message: 'Failed to get client: $e');
    }
  }

  @override
  Future<ClientModel> createClient(ClientModel client) async {
    try {
      final clientCompanion = ClientsCompanion.insert(
        name: client.name,
        phone: Value(client.phone),
        email: Value(client.email),
        birthday: Value(client.birthday),
        status: Value(client.status.toShortString()),
        notes: Value(client.notes),
        photoPath: Value(client.photoPath),
      );

      final id = await database.createClient(clientCompanion);
      final createdClient = await database.getClientById(id);

      if (createdClient == null) {
        throw DatabaseException(message: 'Failed to retrieve created client');
      }

      return ClientModel.fromDrift(createdClient);
    } catch (e) {
      throw DatabaseException(message: 'Failed to create client: $e');
    }
  }

  @override
  Future<ClientModel> updateClient(ClientModel client) async {
    try {
      if (client.id == null) {
        throw ValidationException(message: 'Cannot update client without id');
      }

      final driftClient = Client(
        id: client.id!,
        name: client.name,
        phone: client.phone,
        email: client.email,
        birthday: client.birthday,
        status: client.status.toShortString(),
        notes: client.notes,
        photoPath: client.photoPath,
        createdAt: client.createdAt,
        updatedAt: DateTime.now(),
      );

      final success = await database.updateClient(driftClient);
      if (!success) {
        throw DatabaseException(message: 'Failed to update client');
      }

      final updatedClient = await database.getClientById(client.id!);
      if (updatedClient == null) {
        throw DatabaseException(message: 'Failed to retrieve updated client');
      }

      return ClientModel.fromDrift(updatedClient);
    } catch (e) {
      if (e is ValidationException) rethrow;
      throw DatabaseException(message: 'Failed to update client: $e');
    }
  }

  @override
  Future<void> deleteClient(int id) async {
    try {
      final deletedCount = await database.deleteClient(id);
      if (deletedCount == 0) {
        throw DataNotFoundException(message: 'Client with id $id not found');
      }
    } catch (e) {
      if (e is DataNotFoundException) rethrow;
      throw DatabaseException(message: 'Failed to delete client: $e');
    }
  }

  @override
  Future<List<ClientModel>> getUpcomingBirthdays(int days) async {
    try {
      final clients = await database.getClientsBirthdaysNext(days);
      return clients
          .where((c) => c.birthday != null)
          .map((c) => ClientModel.fromDrift(c))
          .where((model) =>
              model.daysUntilBirthday != null &&
              model.daysUntilBirthday! <= days)
          .toList();
    } catch (e) {
      throw DatabaseException(message: 'Failed to get upcoming birthdays: $e');
    }
  }

  @override
  Future<int> getClientsCount() async {
    try {
      final clients = await database.getAllClients();
      return clients.length;
    } catch (e) {
      throw DatabaseException(message: 'Failed to get clients count: $e');
    }
  }
}
