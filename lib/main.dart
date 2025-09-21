import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/di/injection.dart';
import 'core/theme/app_theme.dart';
import 'main_navigation.dart';

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

      // Основная навигация
      home: const MainNavigation(),
    );
  }
}
