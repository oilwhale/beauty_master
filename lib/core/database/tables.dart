import 'package:drift/drift.dart';

/// Таблица клиентов
@DataClassName('Client')
class Clients extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 2, max: 50)();
  TextColumn get phone => text().nullable().withLength(min: 10, max: 15)();
  TextColumn get email => text().nullable()();
  DateTimeColumn get birthday => dateTime().nullable()();
  TextColumn get status => text().withDefault(const Constant('regular'))();
  TextColumn get notes => text().nullable()();
  TextColumn get photoPath => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

/// Таблица услуг
@DataClassName('Service')
class Services extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 2, max: 100)();
  TextColumn get category => text().nullable()();
  RealColumn get priceMin => real().nullable()();
  RealColumn get priceMax => real().nullable()();
  IntColumn get durationMinutes => integer()();
  TextColumn get color => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

/// Таблица записей
@DataClassName('Appointment')
class Appointments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clientId => integer().references(Clients, #id)();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
  TextColumn get status => text().withDefault(const Constant('scheduled'))();
  RealColumn get totalPrice => real().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

/// Связывающая таблица для услуг в записи (many-to-many)
@DataClassName('AppointmentService')
class AppointmentServices extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get appointmentId => integer().references(Appointments, #id)();
  IntColumn get serviceId => integer().references(Services, #id)();
  RealColumn get price => real()();
}

/// Таблица финансовых операций
@DataClassName('Transaction')
class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text()(); // income, expense
  RealColumn get amount => real()();
  TextColumn get category => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get paymentMethod => text()(); // cash, card, transfer
  IntColumn get appointmentId =>
      integer().nullable().references(Appointments, #id)();
  TextColumn get receiptPhoto => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

/// Таблица фотографий работ
@DataClassName('Photo')
class Photos extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get clientId => integer().nullable().references(Clients, #id)();
  IntColumn get appointmentId =>
      integer().nullable().references(Appointments, #id)();
  TextColumn get filePath => text()();
  TextColumn get description => text().nullable()();
  TextColumn get type => text()(); // before, after, process
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

/// Таблица настроек приложения
@DataClassName('AppSetting')
class AppSettings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}
