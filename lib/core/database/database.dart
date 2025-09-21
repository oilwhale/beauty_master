import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import '../constants/app_constants.dart';
import 'tables.dart';

part 'database.g.dart';

/// Основной класс базы данных BeautyMaster
@DriftDatabase(tables: [
  Clients,
  Services,
  Appointments,
  AppointmentServices,
  Transactions,
  Photos,
  AppSettings,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => AppConstants.databaseVersion;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        await _insertDefaultData();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Здесь будут миграции при обновлении схемы
        if (from < 2) {
          // Пример миграции для версии 2
          // await m.addColumn(clients, clients.newColumn);
        }
      },
      beforeOpen: (details) async {
        // Включить поддержку foreign keys
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  /// Вставка данных по умолчанию
  Future<void> _insertDefaultData() async {
    // Добавляем базовые категории услуг
    await batch((batch) {
      batch.insertAll(services, [
        ServicesCompanion.insert(
          name: 'Стрижка женская',
          category: const Value('Стрижки'),
          priceMin: const Value(1500.0),
          priceMax: const Value(3000.0),
          durationMinutes: 60,
          color: const Value('#FF6B9D'),
        ),
        ServicesCompanion.insert(
          name: 'Окрашивание',
          category: const Value('Окрашивание'),
          priceMin: const Value(3000.0),
          priceMax: const Value(8000.0),
          durationMinutes: 180,
          color: const Value('#C44FEB'),
        ),
        ServicesCompanion.insert(
          name: 'Маникюр',
          category: const Value('Ногтевой сервис'),
          priceMin: const Value(1000.0),
          priceMax: const Value(2500.0),
          durationMinutes: 90,
          color: const Value('#FF5E7E'),
        ),
        ServicesCompanion.insert(
          name: 'Укладка',
          category: const Value('Укладки'),
          priceMin: const Value(800.0),
          priceMax: const Value(2000.0),
          durationMinutes: 45,
          color: const Value('#4CAF50'),
        ),
      ]);
    });

    // Добавляем начальные настройки
    await batch((batch) {
      batch.insertAll(appSettings, [
        AppSettingsCompanion.insert(
          key: AppConstants.keyUserName,
          value: 'Мастер',
        ),
        AppSettingsCompanion.insert(
          key: AppConstants.keyWorkingHours,
          value: '{"start":"09:00","end":"18:00","days":[1,2,3,4,5]}',
        ),
        AppSettingsCompanion.insert(
          key: AppConstants.keyThemeMode,
          value: 'system',
        ),
      ]);
    });
  }

  // =================== CLIENTS QUERIES ===================

  /// Получить всех клиентов
  Future<List<Client>> getAllClients() => select(clients).get();

  /// Получить клиентов с пагинацией и поиском
  Future<List<Client>> getClientsWithSearch({
    String? searchQuery,
    int limit = 20,
    int offset = 0,
  }) {
    final query = select(clients);

    if (searchQuery != null && searchQuery.isNotEmpty) {
      query.where(
          (c) => c.name.contains(searchQuery) | c.phone.contains(searchQuery));
    }

    query.limit(limit, offset: offset);
    query.orderBy([(c) => OrderingTerm.desc(c.createdAt)]);

    return query.get();
  }

  /// Получить клиента по ID
  Future<Client?> getClientById(int id) {
    return (select(clients)..where((c) => c.id.equals(id))).getSingleOrNull();
  }

  /// Создать клиента
  Future<int> createClient(ClientsCompanion client) {
    return into(clients).insert(client);
  }

  /// Обновить клиента
  Future<bool> updateClient(Client client) {
    return update(clients).replace(client);
  }

  /// Удалить клиента
  Future<int> deleteClient(int id) {
    return (delete(clients)..where((c) => c.id.equals(id))).go();
  }

  /// Получить клиентов с днями рождения в ближайшие дни
  Future<List<Client>> getClientsBirthdaysNext(int days) {
    final now = DateTime.now();
    final endDate = now.add(Duration(days: days));

    return (select(clients)
          ..where((c) => c.birthday.isNotNull())
          ..orderBy([(c) => OrderingTerm.asc(c.birthday)]))
        .get();
  }

  // =================== SERVICES QUERIES ===================

  /// Получить все активные услуги
  Future<List<Service>> getActiveServices() {
    return (select(services)..where((s) => s.isActive.equals(true))).get();
  }

  /// Получить услуги по категории
  Future<List<Service>> getServicesByCategory(String category) {
    return (select(services)
          ..where((s) => s.category.equals(category) & s.isActive.equals(true)))
        .get();
  }

  /// Создать услугу
  Future<int> createService(ServicesCompanion service) {
    return into(services).insert(service);
  }

  /// Обновить услугу
  Future<bool> updateService(Service service) {
    return update(services).replace(service);
  }

  /// Удалить услугу
  Future<int> deleteService(int id) {
    return (delete(services)..where((s) => s.id.equals(id))).go();
  }

  // =================== APPOINTMENTS QUERIES ===================

  /// Получить записи на дату
  Future<List<Appointment>> getAppointmentsByDate(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(appointments)
          ..where((a) =>
              a.date.isBiggerOrEqualValue(startOfDay) &
              a.date.isSmallerThanValue(endOfDay))
          ..orderBy([(a) => OrderingTerm.asc(a.startTime)]))
        .get();
  }

  /// Получить записи в диапазоне дат
  Future<List<Appointment>> getAppointmentsByRange(
    DateTime startDate,
    DateTime endDate,
  ) {
    return (select(appointments)
          ..where((a) =>
              a.date.isBiggerOrEqualValue(startDate) &
              a.date.isSmallerOrEqualValue(endDate))
          ..orderBy([(a) => OrderingTerm.asc(a.date)]))
        .get();
  }

  /// Создать запись
  Future<int> createAppointment(AppointmentsCompanion appointment) {
    return into(appointments).insert(appointment);
  }

  /// Обновить запись
  Future<bool> updateAppointment(Appointment appointment) {
    return update(appointments).replace(appointment);
  }

  /// Удалить запись
  Future<int> deleteAppointment(int id) {
    return (delete(appointments)..where((a) => a.id.equals(id))).go();
  }

  // =================== TRANSACTIONS QUERIES ===================

  /// Получить транзакции за период
  Future<List<Transaction>> getTransactionsByPeriod(
    DateTime startDate,
    DateTime endDate,
  ) {
    return (select(transactions)
          ..where((t) =>
              t.createdAt.isBiggerOrEqualValue(startDate) &
              t.createdAt.isSmallerOrEqualValue(endDate))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .get();
  }

  /// Создать транзакцию
  Future<int> createTransaction(TransactionsCompanion transaction) {
    return into(transactions).insert(transaction);
  }

  // =================== SETTINGS QUERIES ===================

  /// Получить настройку
  Future<String?> getSetting(String key) async {
    final result = await (select(appSettings)..where((s) => s.key.equals(key)))
        .getSingleOrNull();
    return result?.value;
  }

  /// Установить настройку
  Future<void> setSetting(String key, String value) async {
    await into(appSettings).insertOnConflictUpdate(
      AppSettingsCompanion.insert(key: key, value: value),
    );
  }

  // =================== ANALYTICS QUERIES ===================

  /// Получить статистику за период
  Future<Map<String, dynamic>> getAnalytics(
    DateTime startDate,
    DateTime endDate,
  ) async {
    // Доходы
    final incomeResult = await customSelect(
      'SELECT SUM(amount) as total FROM transactions '
      'WHERE type = ? AND created_at BETWEEN ? AND ?',
      variables: [
        Variable.withString('income'),
        Variable.withDateTime(startDate),
        Variable.withDateTime(endDate),
      ],
    ).getSingle();

    // Расходы
    final expenseResult = await customSelect(
      'SELECT SUM(amount) as total FROM transactions '
      'WHERE type = ? AND created_at BETWEEN ? AND ?',
      variables: [
        Variable.withString('expense'),
        Variable.withDateTime(startDate),
        Variable.withDateTime(endDate),
      ],
    ).getSingle();

    // Количество записей
    final appointmentsResult = await customSelect(
      'SELECT COUNT(*) as count FROM appointments '
      'WHERE date BETWEEN ? AND ?',
      variables: [
        Variable.withDateTime(startDate),
        Variable.withDateTime(endDate),
      ],
    ).getSingle();

    return {
      'income': incomeResult.read<double?>('total') ?? 0.0,
      'expenses': expenseResult.read<double?>('total') ?? 0.0,
      'appointments': appointmentsResult.read<int>('count'),
    };
  }
}

/// Открытие соединения с базой данных
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, AppConstants.databaseName));

    // Убедимся, что SQLite3 загружен на мобильных платформах
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
