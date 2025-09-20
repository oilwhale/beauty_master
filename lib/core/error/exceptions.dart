/// Базовый класс для всех исключений приложения
abstract class AppException implements Exception {
  const AppException({this.message, this.code});

  final String? message;
  final String? code;

  @override
  String toString() {
    return '$runtimeType: ${message ?? 'Unknown error'}${code != null ? ' (Code: $code)' : ''}';
  }
}

/// Исключения сервера
class ServerException extends AppException {
  const ServerException({super.message = 'Server error occurred', super.code});
}

/// Исключения сети
class NetworkException extends AppException {
  const NetworkException({
    super.message = 'Network error occurred',
    super.code,
  });
}

/// Исключения базы данных
class DatabaseException extends AppException {
  const DatabaseException({
    super.message = 'Database error occurred',
    super.code,
  });
}

/// Исключения кэша
class CacheException extends AppException {
  const CacheException({super.message = 'Cache error occurred', super.code});
}

/// Исключения валидации
class ValidationException extends AppException {
  const ValidationException({
    super.message = 'Validation error occurred',
    super.code,
  });
}

/// Исключения авторизации
class AuthException extends AppException {
  const AuthException({
    super.message = 'Authentication error occurred',
    super.code,
  });
}

/// Исключения разрешений
class PermissionException extends AppException {
  const PermissionException({super.message = 'Permission denied', super.code});
}

/// Исключения файловой системы
class FileSystemException extends AppException {
  const FileSystemException({
    super.message = 'File system error occurred',
    super.code,
  });
}

/// Исключения парсинга/сериализации
class SerializationException extends AppException {
  const SerializationException({
    super.message = 'Serialization error occurred',
    super.code,
  });
}

/// Таймаут исключения
class TimeoutException extends AppException {
  const TimeoutException({super.message = 'Operation timed out', super.code});
}

/// Исключения для отсутствующих данных
class DataNotFoundException extends AppException {
  const DataNotFoundException({super.message = 'Data not found', super.code});
}

/// Исключения конфликта данных
class DataConflictException extends AppException {
  const DataConflictException({
    super.message = 'Data conflict occurred',
    super.code,
  });
}
