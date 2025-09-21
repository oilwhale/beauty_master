import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/di/injection.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Настройка статусбара
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  // Инициализация зависимостей
  await configureDependencies();

  runApp(const BeautyMasterApp());
}

class BeautyMasterApp extends StatelessWidget {
  const BeautyMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BeautyMaster',
      debugShowCheckedModeBanner: false,

      // Применяем нашу тему
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      // Временная заглушка - позже заменим на navigation
      home: const DemoScreen(),
    );
  }
}

/// Демо экран для проверки темы
class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BeautyMaster Demo'),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BeautyMaster',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Glassmorphism тема загружена!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
