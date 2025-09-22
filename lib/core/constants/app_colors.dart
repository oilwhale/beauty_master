import 'package:flutter/material.dart';

/// Enterprise-уровень цветовая палитра BeautyMaster 2025
/// Стиль: Elegant Minimalism + Glassmorphism
class AppColors {
  AppColors._();

  // ===== PRIMARY COLORS - основные цвета =====
  static const Color primaryMain = Color(0xFF1A1D29); // Deep Navy Blue
  static const Color primaryLight = Color(0xFF2D3142); // Lighter Navy
  static const Color primaryDark = Color(0xFF0F1117); // Darker Navy
  static const Color primaryAccent = Color(0xFF8B5CF6); // Elegant Purple

  // ===== SECONDARY COLORS - вторичные цвета =====
  static const Color secondaryMain = Color(0xFF6B7280); // Soft Gray
  static const Color secondaryLight = Color(0xFF9CA3AF); // Light Gray
  static const Color secondaryDark = Color(0xFF4B5563); // Dark Gray
  static const Color secondaryAccent = Color(0xFF3B82F6); // Blue Accent

  // ===== ACCENT COLORS - акцентные цвета =====
  static const Color accentMain = Color(0xFF8B5CF6); // Elegant Purple
  static const Color accentLight = Color(0xFFA78BFA); // Light Purple
  static const Color accentDark = Color(0xFF7C3AED); // Dark Purple
  static const Color accentWarm = Color(0xFFF59E0B); // Warm Orange

  // ===== NEUTRAL COLORS - нейтральные цвета =====
  static const Color backgroundMain = Color(0xFFFAFAFA); // Off White
  static const Color backgroundSecondary = Color(0xFFF3F4F6); // Light Gray
  static const Color surfaceMain = Color(0xFFFFFFFF); // Pure White
  static const Color surfaceElevated = Color(0xFFF9FAFB); // Elevated White
  static const Color surfaceVariant = Color(0xFFF1F5F9); // Variant Surface

  // ===== TEXT COLORS - цвета текста =====
  static const Color textPrimary = Color(0xFF111827); // Dark Gray
  static const Color textSecondary = Color(0xFF6B7280); // Medium Gray
  static const Color textTertiary = Color(0xFF9CA3AF); // Light Gray
  static const Color textMuted = Color(0xFFD1D5DB); // Muted Gray
  static const Color textOnPrimary = Color(0xFFFFFFFF); // White on colored
  static const Color textOnDark = Color(0xFFF9FAFB); // Light text on dark

  // ===== GLASSMORPHISM COLORS - цвета для glassmorphism =====
  static const Color glassBackground = Color(0x1AFFFFFF); // Glass background
  static const Color glassBorder = Color(0x33FFFFFF); // Glass border
  static const Color glassShadow = Color(0x0A000000); // Glass shadow
  static const Color glassOverlay = Color(0x0DFFFFFF); // Glass overlay

  // ===== SHADOWS - тени =====
  static const Color shadowLight = Color(0x0A000000); // Light shadow
  static const Color shadowMedium = Color(0x1A000000); // Medium shadow
  static const Color shadowDark = Color(0x33000000); // Dark shadow
  static const Color shadowSubtle = Color(0x05000000); // Subtle shadow

  // ===== STATUS COLORS - статусные цвета =====
  static const Color success = Color(0xFF10B981); // Success Green
  static const Color successAccent = Color(0xFFD1FAE5); // Success Light
  static const Color warning = Color(0xFFF59E0B); // Warning Orange
  static const Color warningAccent = Color(0xFFFEF3C7); // Warning Light
  static const Color error = Color(0xFFEF4444); // Error Red
  static const Color errorAccent = Color(0xFFFEE2E2); // Error Light
  static const Color info = Color(0xFF3B82F6); // Info Blue
  static const Color infoAccent = Color(0xFFDBEAFE); // Info Light

  // ===== GLASSMORPHISM GRADIENTS - glassmorphism градиенты =====
  static const LinearGradient glassPrimary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x1A8B5CF6), // Purple glass
      Color(0x0D8B5CF6), // Lighter purple glass
    ],
    stops: [0.0, 1.0],
  );

  static const LinearGradient glassSecondary = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0x1A3B82F6), // Blue glass
      Color(0x0D3B82F6), // Lighter blue glass
    ],
    stops: [0.0, 1.0],
  );

  static const LinearGradient glassAccent = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0x1AF59E0B), // Orange glass
      Color(0x0DF59E0B), // Lighter orange glass
    ],
    stops: [0.0, 1.0],
  );

  static const LinearGradient glassNeutral = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0x1AFFFFFF), // White glass
      Color(0x0DFFFFFF), // Lighter white glass
    ],
    stops: [0.0, 1.0],
  );

  // ===== ELEGANT GRADIENTS - элегантные градиенты =====
  static const LinearGradient elegantPrimary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1A1D29), // Deep Navy
      Color(0xFF2D3142), // Lighter Navy
    ],
    stops: [0.0, 1.0],
  );

  static const LinearGradient elegantAccent = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF8B5CF6), // Purple
      Color(0xFFA78BFA), // Light Purple
    ],
    stops: [0.0, 1.0],
  );

  // ===== INTERACTIVE STATES - интерактивные состояния =====
  static const Color hover = Color(0x0A8B5CF6); // Hover effect
  static const Color pressed = Color(0x1A8B5CF6); // Pressed state
  static const Color focused = Color(0x1A8B5CF6); // Focused state
  static const Color disabled = Color(0xFFE5E7EB); // Disabled
  static const Color ripple = Color(0x1A8B5CF6); // Ripple effect

  // ===== GLASSMORPHISM STATES - состояния glassmorphism =====
  static const Color glassHover = Color(0x1AFFFFFF); // Glass hover
  static const Color glassPressed = Color(0x2AFFFFFF); // Glass pressed
  static const Color glassFocused = Color(0x33FFFFFF); // Glass focused

  // ===== ELEVATION LAYERS - слои для глубины =====
  static const Color elevation1 = Color(0xFFF9FAFB); // Elevation 1
  static const Color elevation2 = Color(0xFFF3F4F6); // Elevation 2
  static const Color elevation3 = Color(0xFFE5E7EB); // Elevation 3
  static const Color elevation4 = Color(0xFFD1D5DB); // Elevation 4

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
