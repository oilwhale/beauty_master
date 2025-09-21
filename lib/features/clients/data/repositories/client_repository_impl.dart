import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/client_entity.dart';
import '../../domain/repositories/client_repository.dart';
import '../datasources/client_local_datasource.dart';
import '../models/client_model.dart';

@Injectable(as: ClientRepository)
class ClientRepositoryImpl implements ClientRepository {
  final ClientLocalDataSource localDataSource;

  ClientRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<ClientEntity>>> getClients({
    String? searchQuery,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final clients = await localDataSource.getClients(
        searchQuery: searchQuery,
        page: page,
        limit: limit,
      );
      return Right(clients);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(AppFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, ClientEntity>> getClientById(int id) async {
    try {
      final client = await localDataSource.getClientById(id);
      return Right(client);
    } on DataNotFoundException catch (e) {
      return Left(ClientNotFoundFailure(message: e.message, code: e.code));
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(AppFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, ClientEntity>> createClient(
      ClientEntity client) async {
    try {
      // Валидация
      final validation = _validateClient(client);
      if (validation != null) {
        return Left(validation);
      }

      final clientModel = ClientModel.fromEntity(client);
      final createdClient = await localDataSource.createClient(clientModel);
      return Right(createdClient);
    } on ValidationException catch (e) {
      return Left(ValidationFailure(message: e.message, code: e.code));
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(AppFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, ClientEntity>> updateClient(
      ClientEntity client) async {
    try {
      if (client.id == null) {
        return const Left(
            ValidationFailure(message: 'Client ID is required for update'));
      }

      // Валидация
      final validation = _validateClient(client);
      if (validation != null) {
        return Left(validation);
      }

      final clientModel = ClientModel.fromEntity(client);
      final updatedClient = await localDataSource.updateClient(clientModel);
      return Right(updatedClient);
    } on DataNotFoundException catch (e) {
      return Left(ClientNotFoundFailure(message: e.message, code: e.code));
    } on ValidationException catch (e) {
      return Left(ValidationFailure(message: e.message, code: e.code));
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(AppFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteClient(int id) async {
    try {
      await localDataSource.deleteClient(id);
      return const Right(null);
    } on DataNotFoundException catch (e) {
      return Left(ClientNotFoundFailure(message: e.message, code: e.code));
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(AppFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<ClientEntity>>> getUpcomingBirthdays(
      int days) async {
    try {
      final clients = await localDataSource.getUpcomingBirthdays(days);
      return Right(clients);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(AppFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, int>> getClientsCount() async {
    try {
      final count = await localDataSource.getClientsCount();
      return Right(count);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(AppFailure(message: 'Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, ClientStatistics>> getClientStatistics() async {
    try {
      // Получаем всех клиентов для подсчета статистики
      final allClients = await localDataSource.getClients(limit: 10000);

      final total = allClients.length;
      final newClients =
          allClients.where((c) => c.status == ClientStatus.newClient).length;
      final regularClients =
          allClients.where((c) => c.status == ClientStatus.regular).length;
      final vipClients =
          allClients.where((c) => c.status == ClientStatus.vip).length;
      final clientsWithBirthdays =
          allClients.where((c) => c.birthday != null).length;

      final statistics = ClientStatistics(
        totalClients: total,
        newClients: newClients,
        regularClients: regularClients,
        vipClients: vipClients,
        clientsWithBirthdays: clientsWithBirthdays,
      );

      return Right(statistics);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(message: e.message, code: e.code));
    } catch (e) {
      return Left(AppFailure(message: 'Unexpected error: $e'));
    }
  }

  /// Валидация клиента
  ValidationFailure? _validateClient(ClientEntity client) {
    if (client.name.trim().isEmpty) {
      return const ValidationFailure(
          message: 'Имя клиента не может быть пустым');
    }

    if (client.name.trim().length < 2) {
      return const ValidationFailure(
          message: 'Имя клиента должно содержать минимум 2 символа');
    }

    if (client.phone != null && client.phone!.isNotEmpty) {
      final phoneDigits = client.phone!.replaceAll(RegExp(r'[^\d]'), '');
      if (phoneDigits.length < 10 || phoneDigits.length > 15) {
        return const ValidationFailure(message: 'Некорректный номер телефона');
      }
    }

    if (client.email != null && client.email!.isNotEmpty) {
      final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
      if (!emailRegex.hasMatch(client.email!)) {
        return const ValidationFailure(message: 'Некорректный email адрес');
      }
    }

    if (client.birthday != null) {
      final now = DateTime.now();
      if (client.birthday!.isAfter(now)) {
        return const ValidationFailure(
            message: 'Дата рождения не может быть в будущем');
      }

      final age = now.year - client.birthday!.year;
      if (age > 150) {
        return const ValidationFailure(message: 'Некорректная дата рождения');
      }
    }

    return null;
  }
}
