import 'package:equatable/equatable.dart';

/// Сущность клиента в домене
class ClientEntity extends Equatable {
  final int? id;
  final String name;
  final String? phone;
  final String? email;
  final DateTime? birthday;
  final ClientStatus status;
  final String? notes;
  final String? photoPath;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ClientEntity({
    this.id,
    required this.name,
    this.phone,
    this.email,
    this.birthday,
    this.status = ClientStatus.regular,
    this.notes,
    this.photoPath,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Возраст клиента
  int? get age {
    if (birthday == null) return null;
    final now = DateTime.now();
    int age = now.year - birthday!.year;
    if (now.month < birthday!.month ||
        (now.month == birthday!.month && now.day < birthday!.day)) {
      age--;
    }
    return age;
  }

  /// Дни до дня рождения
  int? get daysUntilBirthday {
    if (birthday == null) return null;
    final now = DateTime.now();
    final thisYearBirthday = DateTime(now.year, birthday!.month, birthday!.day);

    if (thisYearBirthday.isBefore(now)) {
      // День рождения уже прошел в этом году
      final nextYearBirthday =
          DateTime(now.year + 1, birthday!.month, birthday!.day);
      return nextYearBirthday.difference(now).inDays;
    } else {
      // День рождения еще будет в этом году
      return thisYearBirthday.difference(now).inDays;
    }
  }

  /// Инициалы клиента
  String get initials {
    final parts = name.trim().split(' ');
    if (parts.isEmpty) return '';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  /// Копирование с изменениями
  ClientEntity copyWith({
    int? id,
    String? name,
    String? phone,
    String? email,
    DateTime? birthday,
    ClientStatus? status,
    String? notes,
    String? photoPath,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ClientEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      birthday: birthday ?? this.birthday,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      photoPath: photoPath ?? this.photoPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        email,
        birthday,
        status,
        notes,
        photoPath,
        createdAt,
        updatedAt,
      ];
}

/// Статус клиента
enum ClientStatus {
  newClient,
  regular,
  vip;

  /// Локализованное название
  String get displayName {
    switch (this) {
      case ClientStatus.newClient:
        return 'Новый';
      case ClientStatus.regular:
        return 'Постоянный';
      case ClientStatus.vip:
        return 'VIP';
    }
  }

  /// Цвет статуса
  int get colorValue {
    switch (this) {
      case ClientStatus.newClient:
        return 0xFF4CAF50; // Зеленый
      case ClientStatus.regular:
        return 0xFF2196F3; // Синий
      case ClientStatus.vip:
        return 0xFFFF6B9D; // Розовый (primary)
    }
  }

  /// Преобразование из строки
  static ClientStatus fromString(String value) {
    switch (value) {
      case 'new':
        return ClientStatus.newClient;
      case 'regular':
        return ClientStatus.regular;
      case 'vip':
        return ClientStatus.vip;
      default:
        return ClientStatus.regular;
    }
  }

  /// Преобразование в строку
  String toShortString() {
    switch (this) {
      case ClientStatus.newClient:
        return 'new';
      case ClientStatus.regular:
        return 'regular';
      case ClientStatus.vip:
        return 'vip';
    }
  }
}
