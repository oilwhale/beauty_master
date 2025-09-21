import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/client_entity.dart';
import '../../domain/usecases/client_usecases.dart';
import '../../../../core/usecases/usecase.dart';

/// BLoC для управления списком клиентов
class ClientsBloc extends Bloc<ClientsEvent, ClientsState> {
  final GetClients _getClients;
  final CreateClient _createClient;
  final UpdateClient _updateClient;
  final DeleteClient _deleteClient;
  final GetUpcomingBirthdays _getUpcomingBirthdays;

  ClientsBloc({
    required GetClients getClients,
    required CreateClient createClient,
    required UpdateClient updateClient,
    required DeleteClient deleteClient,
    required GetUpcomingBirthdays getUpcomingBirthdays,
  })  : _getClients = getClients,
        _createClient = createClient,
        _updateClient = updateClient,
        _deleteClient = deleteClient,
        _getUpcomingBirthdays = getUpcomingBirthdays,
        super(const ClientsInitial()) {
    on<LoadClients>(_onLoadClients);
    on<RefreshClients>(_onRefreshClients);
    on<SearchClients>(_onSearchClients);
    on<LoadMoreClients>(_onLoadMoreClients);
    on<CreateClientEvent>(_onCreateClient);
    on<UpdateClientEvent>(_onUpdateClient);
    on<DeleteClientEvent>(_onDeleteClient);
    on<LoadUpcomingBirthdays>(_onLoadUpcomingBirthdays);
  }

  /// Загрузка клиентов
  Future<void> _onLoadClients(
      LoadClients event, Emitter<ClientsState> emit) async {
    emit(const ClientsLoading());

    final result = await _getClients(GetClientsParams(
      page: 1,
      limit: event.limit,
      search: event.searchQuery,
    ));

    result.fold(
      (failure) =>
          emit(ClientsError(failure.message ?? 'Ошибка загрузки клиентов')),
      (clients) => emit(ClientsLoaded(
        clients: clients,
        hasReachedMax: clients.length < event.limit,
        currentPage: 1,
        searchQuery: event.searchQuery,
      )),
    );
  }

  /// Обновление списка клиентов
  Future<void> _onRefreshClients(
      RefreshClients event, Emitter<ClientsState> emit) async {
    final currentState = state;
    String? searchQuery;

    if (currentState is ClientsLoaded) {
      searchQuery = currentState.searchQuery;
    }

    emit(const ClientsLoading());

    final result = await _getClients(GetClientsParams(
      page: 1,
      limit: 20,
      search: searchQuery,
    ));

    result.fold(
      (failure) =>
          emit(ClientsError(failure.message ?? 'Ошибка обновления клиентов')),
      (clients) => emit(ClientsLoaded(
        clients: clients,
        hasReachedMax: clients.length < 20,
        currentPage: 1,
        searchQuery: searchQuery,
      )),
    );
  }

  /// Поиск клиентов
  Future<void> _onSearchClients(
      SearchClients event, Emitter<ClientsState> emit) async {
    emit(const ClientsLoading());

    final result = await _getClients(GetClientsParams(
      page: 1,
      limit: 20,
      search: event.query.isNotEmpty ? event.query : null,
    ));

    result.fold(
      (failure) =>
          emit(ClientsError(failure.message ?? 'Ошибка поиска клиентов')),
      (clients) => emit(ClientsLoaded(
        clients: clients,
        hasReachedMax: clients.length < 20,
        currentPage: 1,
        searchQuery: event.query.isNotEmpty ? event.query : null,
      )),
    );
  }

  /// Загрузка дополнительных клиентов (пагинация)
  Future<void> _onLoadMoreClients(
      LoadMoreClients event, Emitter<ClientsState> emit) async {
    final currentState = state;
    if (currentState is! ClientsLoaded || currentState.hasReachedMax) return;

    emit(currentState.copyWith(isLoadingMore: true));

    final result = await _getClients(GetClientsParams(
      page: currentState.currentPage + 1,
      limit: 20,
      search: currentState.searchQuery,
    ));

    result.fold(
      (failure) => emit(currentState.copyWith(
        isLoadingMore: false,
        error: failure.message ?? 'Ошибка загрузки дополнительных клиентов',
      )),
      (newClients) {
        final allClients = [...currentState.clients, ...newClients];
        emit(ClientsLoaded(
          clients: allClients,
          hasReachedMax: newClients.length < 20,
          currentPage: currentState.currentPage + 1,
          searchQuery: currentState.searchQuery,
        ));
      },
    );
  }

  /// Создание клиента
  Future<void> _onCreateClient(
      CreateClientEvent event, Emitter<ClientsState> emit) async {
    final result =
        await _createClient(CreateClientParams(client: event.client));

    result.fold(
      (failure) =>
          emit(ClientsError(failure.message ?? 'Ошибка создания клиента')),
      (client) {
        // Обновляем текущий список, добавляя нового клиента в начало
        final currentState = state;
        if (currentState is ClientsLoaded) {
          final updatedClients = [client, ...currentState.clients];
          emit(currentState.copyWith(clients: updatedClients));
        } else {
          // Если состояние не ClientsLoaded, загружаем заново
          add(const LoadClients());
        }
      },
    );
  }

  /// Обновление клиента
  Future<void> _onUpdateClient(
      UpdateClientEvent event, Emitter<ClientsState> emit) async {
    final result =
        await _updateClient(UpdateClientParams(client: event.client));

    result.fold(
      (failure) =>
          emit(ClientsError(failure.message ?? 'Ошибка обновления клиента')),
      (updatedClient) {
        // Обновляем клиента в текущем списке
        final currentState = state;
        if (currentState is ClientsLoaded) {
          final updatedClients = currentState.clients
              .map((client) =>
                  client.id == updatedClient.id ? updatedClient : client)
              .toList();
          emit(currentState.copyWith(clients: updatedClients));
        } else {
          // Если состояние не ClientsLoaded, загружаем заново
          add(const LoadClients());
        }
      },
    );
  }

  /// Удаление клиента
  Future<void> _onDeleteClient(
      DeleteClientEvent event, Emitter<ClientsState> emit) async {
    final result = await _deleteClient(IdParams(id: event.clientId));

    result.fold(
      (failure) =>
          emit(ClientsError(failure.message ?? 'Ошибка удаления клиента')),
      (_) {
        // Удаляем клиента из текущего списка
        final currentState = state;
        if (currentState is ClientsLoaded) {
          final updatedClients = currentState.clients
              .where((client) => client.id != event.clientId)
              .toList();
          emit(currentState.copyWith(clients: updatedClients));
        } else {
          // Если состояние не ClientsLoaded, загружаем заново
          add(const LoadClients());
        }
      },
    );
  }

  /// Загрузка клиентов с ближайшими днями рождения
  Future<void> _onLoadUpcomingBirthdays(
      LoadUpcomingBirthdays event, Emitter<ClientsState> emit) async {
    final result = await _getUpcomingBirthdays(
        GetUpcomingBirthdaysParams(days: event.days));

    result.fold(
      (failure) => emit(
          ClientsError(failure.message ?? 'Ошибка загрузки дней рождения')),
      (clients) => emit(UpcomingBirthdaysLoaded(clients: clients)),
    );
  }
}

// СОБЫТИЯ
abstract class ClientsEvent extends Equatable {
  const ClientsEvent();

  @override
  List<Object?> get props => [];
}

/// Загрузить клиентов
class LoadClients extends ClientsEvent {
  final String? searchQuery;
  final int limit;

  const LoadClients({this.searchQuery, this.limit = 20});

  @override
  List<Object?> get props => [searchQuery, limit];
}

/// Обновить список клиентов
class RefreshClients extends ClientsEvent {
  const RefreshClients();
}

/// Поиск клиентов
class SearchClients extends ClientsEvent {
  final String query;

  const SearchClients(this.query);

  @override
  List<Object> get props => [query];
}

/// Загрузить больше клиентов (пагинация)
class LoadMoreClients extends ClientsEvent {
  const LoadMoreClients();
}

/// Создать клиента
class CreateClientEvent extends ClientsEvent {
  final ClientEntity client;

  const CreateClientEvent(this.client);

  @override
  List<Object> get props => [client];
}

/// Обновить клиента
class UpdateClientEvent extends ClientsEvent {
  final ClientEntity client;

  const UpdateClientEvent(this.client);

  @override
  List<Object> get props => [client];
}

/// Удалить клиента
class DeleteClientEvent extends ClientsEvent {
  final int clientId;

  const DeleteClientEvent(this.clientId);

  @override
  List<Object> get props => [clientId];
}

/// Загрузить ближайшие дни рождения
class LoadUpcomingBirthdays extends ClientsEvent {
  final int days;

  const LoadUpcomingBirthdays({this.days = 30});

  @override
  List<Object> get props => [days];
}

// СОСТОЯНИЯ
abstract class ClientsState extends Equatable {
  const ClientsState();

  @override
  List<Object?> get props => [];
}

/// Начальное состояние
class ClientsInitial extends ClientsState {
  const ClientsInitial();
}

/// Загрузка клиентов
class ClientsLoading extends ClientsState {
  const ClientsLoading();
}

/// Клиенты загружены
class ClientsLoaded extends ClientsState {
  final List<ClientEntity> clients;
  final bool hasReachedMax;
  final int currentPage;
  final String? searchQuery;
  final bool isLoadingMore;
  final String? error;

  const ClientsLoaded({
    required this.clients,
    required this.hasReachedMax,
    required this.currentPage,
    this.searchQuery,
    this.isLoadingMore = false,
    this.error,
  });

  ClientsLoaded copyWith({
    List<ClientEntity>? clients,
    bool? hasReachedMax,
    int? currentPage,
    String? searchQuery,
    bool? isLoadingMore,
    String? error,
  }) {
    return ClientsLoaded(
      clients: clients ?? this.clients,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
      searchQuery: searchQuery ?? this.searchQuery,
      isLoadingMore: isLoadingMore ?? false,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        clients,
        hasReachedMax,
        currentPage,
        searchQuery,
        isLoadingMore,
        error,
      ];
}

/// Ошибка загрузки клиентов
class ClientsError extends ClientsState {
  final String message;

  const ClientsError(this.message);

  @override
  List<Object> get props => [message];
}

/// Ближайшие дни рождения загружены
class UpcomingBirthdaysLoaded extends ClientsState {
  final List<ClientEntity> clients;

  const UpcomingBirthdaysLoaded({required this.clients});

  @override
  List<Object> get props => [clients];
}
