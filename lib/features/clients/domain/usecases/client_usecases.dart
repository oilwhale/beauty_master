import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/client_entity.dart';
import '../repositories/client_repository.dart';

/// Получить список клиентов
@injectable
class GetClients extends UseCase<List<ClientEntity>, GetClientsParams> {
  final ClientRepository repository;

  GetClients(this.repository);

  @override
  Future<Either<Failure, List<ClientEntity>>> call(GetClientsParams params) {
    return repository.getClients(
      searchQuery: params.searchQuery,
      page: params.page,
      limit: params.limit,
    );
  }
}

/// Параметры для получения клиентов
class GetClientsParams extends PaginationParams {
  const GetClientsParams({
    super.page = 1,
    super.limit = 20,
    super.search,
  });

  String? get searchQuery => search;
}

/// Получить клиента по ID
@injectable
class GetClientById extends UseCase<ClientEntity, IdParams> {
  final ClientRepository repository;

  GetClientById(this.repository);

  @override
  Future<Either<Failure, ClientEntity>> call(IdParams params) {
    return repository.getClientById(params.id);
  }
}

/// Создать клиента
@injectable
class CreateClient extends UseCase<ClientEntity, CreateClientParams> {
  final ClientRepository repository;

  CreateClient(this.repository);

  @override
  Future<Either<Failure, ClientEntity>> call(CreateClientParams params) {
    return repository.createClient(params.client);
  }
}

/// Параметры для создания клиента
class CreateClientParams {
  final ClientEntity client;

  const CreateClientParams({required this.client});
}

/// Обновить клиента
@injectable
class UpdateClient extends UseCase<ClientEntity, UpdateClientParams> {
  final ClientRepository repository;

  UpdateClient(this.repository);

  @override
  Future<Either<Failure, ClientEntity>> call(UpdateClientParams params) {
    return repository.updateClient(params.client);
  }
}

/// Параметры для обновления клиента
class UpdateClientParams {
  final ClientEntity client;

  const UpdateClientParams({required this.client});
}

/// Удалить клиента
@injectable
class DeleteClient extends UseCase<void, IdParams> {
  final ClientRepository repository;

  DeleteClient(this.repository);

  @override
  Future<Either<Failure, void>> call(IdParams params) {
    return repository.deleteClient(params.id);
  }
}

/// Получить клиентов с ближайшими днями рождения
@injectable
class GetUpcomingBirthdays
    extends UseCase<List<ClientEntity>, GetUpcomingBirthdaysParams> {
  final ClientRepository repository;

  GetUpcomingBirthdays(this.repository);

  @override
  Future<Either<Failure, List<ClientEntity>>> call(
      GetUpcomingBirthdaysParams params) {
    return repository.getUpcomingBirthdays(params.days);
  }
}

/// Параметры для получения клиентов с днями рождения
class GetUpcomingBirthdaysParams {
  final int days;

  const GetUpcomingBirthdaysParams({this.days = 30});
}
