import 'package:json_annotation/json_annotation.dart';

import '../../../../core/database/database.dart';
import '../../domain/entities/client_entity.dart';

part 'client_model.g.dart';

/// Модель клиента для data layer
@JsonSerializable()
class ClientModel extends ClientEntity {
  const ClientModel({
    super.id,
    required super.name,
    super.phone,
    super.email,
    super.birthday,
    super.status = ClientStatus.regular,
    super.notes,
    super.photoPath,
    required super.createdAt,
    required super.updatedAt,
  });

  /// Создание из JSON
  factory ClientModel.fromJson(Map<String, dynamic> json) =>
      _$ClientModelFromJson(json);

  /// Конвертация в JSON
  Map<String, dynamic> toJson() => _$ClientModelToJson(this);

  /// Создание из Drift Client
  factory ClientModel.fromDrift(Client client) {
    return ClientModel(
      id: client.id,
      name: client.name,
      phone: client.phone,
      email: client.email,
      birthday: client.birthday,
      status: ClientStatus.fromString(client.status),
      notes: client.notes,
      photoPath: client.photoPath,
      createdAt: client.createdAt,
      updatedAt: client.updatedAt,
    );
  }

  /// Конвертация в Drift Client
  Client toDrift() {
    return Client(
      id: id ?? 0,
      name: name,
      phone: phone,
      email: email,
      birthday: birthday,
      status: status.toShortString(),
      notes: notes,
      photoPath: photoPath,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Создание модели из entity
  factory ClientModel.fromEntity(ClientEntity entity) {
    return ClientModel(
      id: entity.id,
      name: entity.name,
      phone: entity.phone,
      email: entity.email,
      birthday: entity.birthday,
      status: entity.status,
      notes: entity.notes,
      photoPath: entity.photoPath,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Копирование с изменениями
  @override
  ClientModel copyWith({
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
    return ClientModel(
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
}
