import 'package:flutter/material.dart';

/// Цветовая палитра приложения BeautyMaster
/// Стиль: Glassmorphism 3.0 + Liquid Design
class AppColors {
  AppColors._();

  // Primary Colors - основные цвета приложения
  static const Color primaryMain = Color(0xFFFF6B9D);
  static const Color primaryLight = Color(0xFFFF8FB3);
  static const Color primaryDark = Color(0xFFE91E63);

  // Secondary Colors - дополнительные цвета
  static const Color secondaryMain = Color(0xFFC44FEB);
  static const Color secondaryLight = Color(0xFFD97EF0);
  static const Color secondaryDark = Color(0xFFB029E6);

  // Accent Colors - акцентные цвета
  static const Color accentMain = Color(0xFFFF5E7E);
  static const Color accentLight = Color(0xFFFF8FA3);
  static const Color accentDark = Color(0xFFE53E3E);

  // Glass Effects - эффекты стекла
  static const Color glassBackground = Color(0x1AFFFFFF); // 10% white
  static const Color glassBorder = Color(0x33FFFFFF); // 20% white
  static const Color glassBlur = Color(0x0DFFFFFF); // 5% white

  // Background Colors - цвета фона
  static const Color backgroundLight = Color(0xFFFAFAFA);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E1E1E);

  // Text Colors - цвета текста
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textDisabled = Color(0xFFBDBDBD);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Status Colors - статусные цвета
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);

  // Gradients - градиенты
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLight, primaryMain, primaryDark],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondaryLight, secondaryMain, secondaryDark],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accentLight, accentMain, accentDark],
  );

  // Glass Gradient - градиент для стеклянных эффектов
  static const LinearGradient glassGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x1AFFFFFF), // 10% white
      Color(0x0DFFFFFF), // 5% white
    ],
  );

  // Shadow Colors - цвета теней
  static const Color shadowLight = Color(0x1A000000); // 10% black
  static const Color shadowMedium = Color(0x33000000); // 20% black
  static const Color shadowDark = Color(0x4D000000); // 30% black
}
