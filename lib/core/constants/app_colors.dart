import 'package:flutter/material.dart';

/// Ультрасовременная цветовая палитра BeautyMaster 2025
/// Стиль: Neomorphic Pastels + Liquid Motion
class AppColors {
  AppColors._();

  // ===== PRIMARY PASTELS - основные пастельные =====
  static const Color primaryMain = Color(0xFFE6E6FA); // Лаванда
  static const Color primaryLight = Color(0xFFF0F0FF); // Светлая лаванда
  static const Color primaryDark = Color(0xFFD1C4E9); // Темная лаванда
  static const Color primaryAccent = Color(0xFFB39DDB); // Акцентная лаванда

  // ===== SECONDARY VIOLETS - вторичные фиолетовые =====
  static const Color secondaryMain = Color(0xFFF0E6FF); // Светло-фиолетовый
  static const Color secondaryLight =
      Color(0xFFF8F0FF); // Очень светлый фиолетовый
  static const Color secondaryDark = Color(0xFFE1BEE7); // Умеренный фиолетовый
  static const Color secondaryAccent =
      Color(0xFFCE93D8); // Акцентный фиолетовый

  // ===== ACCENT PEACHY - акцентные персиковые =====
  static const Color accentMain = Color(0xFFFFE4E1); // Персиковый
  static const Color accentLight = Color(0xFFFFF0F0); // Светлый персиковый
  static const Color accentDark = Color(0xFFFFCDD2); // Розово-персиковый
  static const Color accentWarm = Color(0xFFF8BBD9); // Теплый розовый

  // ===== NEUTRAL WHITES - нейтральные белые =====
  static const Color backgroundMain = Color(0xFFFAFAFF); // Призрачно-белый
  static const Color backgroundSecondary = Color(0xFFF8F8FF); // Почти белый
  static const Color surfaceMain = Color(0xFFFFFFFF); // Чистый белый
  static const Color surfaceElevated = Color(0xFFFCFCFF); // Приподнятый белый
  static const Color surfaceVariant = Color(0xFFF5F5FF); // Вариант поверхности

  // ===== TEXT COLORS - цвета текста =====
  static const Color textPrimary = Color(0xFF2D1B3D); // Темно-фиолетовый
  static const Color textSecondary = Color(0xFF6B4C7A); // Средний фиолетовый
  static const Color textTertiary = Color(0xFF9B7CB0); // Светлый фиолетовый
  static const Color textMuted = Color(0xFFB8A9C9); // Приглушенный
  static const Color textOnPrimary = Color(0xFFFFFFFF); // Белый на цветном

  // ===== NEOMORPHIC SHADOWS - неоморфные тени =====
  static const Color shadowLight =
      Color(0x0A8B5FBF); // Светлая тень (лавандовая)
  static const Color shadowMedium = Color(0x1A8B5FBF); // Средняя тень
  static const Color shadowDark = Color(0x2D8B5FBF); // Темная тень
  static const Color shadowInner = Color(0x0D000000); // Внутренняя тень
  static const Color highlightNeomorphic = Color(0x80FFFFFF); // Неоморфный блик

  // ===== STATUS COLORS - статусные цвета в пастельных тонах =====
  static const Color success = Color(0xFFE8F5E8); // Пастельный зеленый
  static const Color successAccent = Color(0xFF81C784); // Акцент зеленого
  static const Color warning = Color(0xFFFFF3E0); // Пастельный оранжевый
  static const Color warningAccent = Color(0xFFFFB74D); // Акцент оранжевого
  static const Color error = Color(0xFFFFEBEE); // Пастельный красный
  static const Color errorAccent = Color(0xFFE57373); // Акцент красного
  static const Color info = Color(0xFFE3F2FD); // Пастельный синий
  static const Color infoAccent = Color(0xFF64B5F6); // Акцент синего

  // ===== LIQUID GRADIENTS - жидкие градиенты =====
  static const LinearGradient liquidPrimary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFE6E6FA), // Лаванда
      Color(0xFFF0E6FF), // Светло-фиолетовый
      Color(0xFFFFE4E1), // Персиковый
    ],
    stops: [0.0, 0.6, 1.0],
  );

  static const LinearGradient liquidSecondary = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xFFF8F0FF), // Очень светлый фиолетовый
      Color(0xFFE6E6FA), // Лаванда
      Color(0xFFF0F0FF), // Светлая лаванда
    ],
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient liquidAccent = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFFE4E1), // Персиковый
      Color(0xFFFFF0F0), // Светлый персиковый
      Color(0xFFFFCDD2), // Розово-персиковый
    ],
    stops: [0.0, 0.4, 1.0],
  );

  static const LinearGradient liquidNeutral = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFAFAFF), // Призрачно-белый
      Color(0xFFFFFFFF), // Чистый белый
      Color(0xFFF8F8FF), // Почти белый
    ],
    stops: [0.0, 0.5, 1.0],
  );

  // ===== BREATHING GRADIENTS - "дышащие" градиенты для анимаций =====
  static const LinearGradient breathingPrimary = LinearGradient(
    begin: Alignment(-1.0, -1.0),
    end: Alignment(1.0, 1.0),
    colors: [
      Color(0xFFE6E6FA),
      Color(0xFFF0E6FF),
      Color(0xFFE6E6FA),
    ],
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient breathingSecondary = LinearGradient(
    begin: Alignment(-1.0, 1.0),
    end: Alignment(1.0, -1.0),
    colors: [
      Color(0xFFFFE4E1),
      Color(0xFFF0E6FF),
      Color(0xFFFFE4E1),
    ],
    stops: [0.0, 0.5, 1.0],
  );

  // ===== INTERACTIVE STATES - интерактивные состояния =====
  static const Color hover = Color(0x1AE6E6FA); // Ховер эффект
  static const Color pressed = Color(0x2DE6E6FA); // Нажатие
  static const Color focused = Color(0x40E6E6FA); // Фокус
  static const Color disabled = Color(0xFFF5F5F5); // Отключено
  static const Color ripple = Color(0x1AB39DDB); // Эффект ряби

  // ===== ORGANIC TINTS - органические оттенки =====
  static const Color organicPink = Color(0xFFF8E8F5); // Органический розовый
  static const Color organicLavender =
      Color(0xFFF0E8F8); // Органическая лаванда
  static const Color organicMint = Color(0xFFE8F8F0); // Органическая мята
  static const Color organicPeach = Color(0xFFF8F0E8); // Органический персик

  // ===== DEPTH LAYERS - слои глубины для неоморфизма =====
  static const Color depthBackground = Color(0xFFF8F8FF); // Фон глубины
  static const Color depthSurface1 = Color(0xFFFCFCFF); // Поверхность 1
  static const Color depthSurface2 = Color(0xFFFFFFFF); // Поверхность 2
  static const Color depthSurface3 = Color(0xFFFAFAFF); // Поверхность 3

  // ===== UTILITY METHODS - утилитарные методы =====

  /// Создает адаптивный цвет для темной темы
  static Color adaptive(Color lightColor, Color darkColor, bool isDark) {
    return isDark ? darkColor : lightColor;
  }

  /// Создает цвет с прозрачностью
  static Color withOpacity(Color color, double opacity) {
    return color.withValues(alpha: opacity);
  }

  /// Создает более светлую версию цвета
  static Color lighten(Color color, [double amount = 0.1]) {
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  /// Создает более темную версию цвета
  static Color darken(Color color, [double amount = 0.1]) {
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }
}
