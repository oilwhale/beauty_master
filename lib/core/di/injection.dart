import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/database.dart';

/// Глобальный экземпляр GetIt для Dependency Injection
final GetIt getIt = GetIt.instance;

/// Инициализация всех зависимостей
Future<void> configureDependencies() async {
  // База данных
  getIt.registerSingleton<AppDatabase>(AppDatabase());

  // Сетевой клиент
  getIt.registerSingleton<Dio>(_createDio());

  // Локальное хранилище
  final sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPrefs);

  // Безопасное хранилище
  getIt.registerSingleton<FlutterSecureStorage>(
    const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
        preferencesKeyPrefix: 'beauty_master_',
      ),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock_this_device,
      ),
    ),
  );
}

/// Создание настроенного HTTP клиента
Dio _createDio() {
  final dio = Dio();

  // Базовые настройки
  dio.options = BaseOptions(
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );

  // Интерцепторы для логирования в debug режиме
  if (kDebugMode) {
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: false,
        error: true,
      ),
    );
  }

  // Интерцептор для обработки ошибок
  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (error, handler) {
        // Здесь можно добавить кастомную обработку ошибок
        handler.next(error);
      },
    ),
  );

  return dio;
}

/// Очистка всех зависимостей (для тестов)
Future<void> resetDependencies() async {
  await getIt.reset();
}
