import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/client_entity.dart';

/// Интерфейс репозитория клиентов
abstract class ClientRepository {
  /// Получить всех клиентов с пагинацией и поиском
  Future<Either<Failure, List<ClientEntity>>> getClients({
    String? searchQuery,
    int page = 1,
    int limit = 20,
  });

  /// Получить клиента по ID
  Future<Either<Failure, ClientEntity>> getClientById(int id);

  /// Создать клиента
  Future<Either<Failure, ClientEntity>> createClient(ClientEntity client);

  /// Обновить клиента
  Future<Either<Failure, ClientEntity>> updateClient(ClientEntity client);

  /// Удалить клиента
  Future<Either<Failure, void>> deleteClient(int id);

  /// Получить клиентов с днями рождения в ближайшие дни
  Future<Either<Failure, List<ClientEntity>>> getUpcomingBirthdays(int days);

  /// Получить количество клиентов
  Future<Either<Failure, int>> getClientsCount();

  /// Получить статистику по клиентам
  Future<Either<Failure, ClientStatistics>> getClientStatistics();
}

/// Статистика по клиентам
class ClientStatistics {
  final int totalClients;
  final int newClients;
  final int regularClients;
  final int vipClients;
  final int clientsWithBirthdays;

  const ClientStatistics({
    required this.totalClients,
    required this.newClients,
    required this.regularClients,
    required this.vipClients,
    required this.clientsWithBirthdays,
  });
}
