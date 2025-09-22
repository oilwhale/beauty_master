import 'package:flutter/material.dart';

/// Enterprise цветовая система BeautyMaster 2025
/// Философия: Conscious Minimalism + Progressive Disclosure + Selective Glassmorphism
/// Принципы: 90% White Space, Intelligent Hierarchy, Emotional Design
class AppColors {
  AppColors._();

  // =====================================================================
  // QUANTUM PURPLE - Primary Color System (Математическая прогрессия)
  // =====================================================================

  /// Quantum Mist - Самый светлый оттенок для фонов
  static const Color quantumMist = Color(0xFFF8F6FF);

  /// Quantum Fog - Для subtle разделителей и hover состояний
  static const Color quantumFog = Color(0xFFEDE8FF);

  /// Quantum Light - Для light backgrounds и disabled состояний
  static const Color quantumLight = Color(0xFFDDD5FF);

  /// Quantum Soft - Для secondary элементов и borders
  static const Color quantumSoft = Color(0xFFC4B5FF);

  /// Quantum Medium - Для interactive элементов в passive состоянии
  static const Color quantumMedium = Color(0xFFA78BFF);

  /// Quantum Core - Основной brand color, главный акцент
  static const Color quantumCore = Color(0xFF8B5CF6);

  /// Quantum Deep - Для active состояний и emphasis
  static const Color quantumDeep = Color(0xFF7C3AED);

  /// Quantum Dark - Для pressed состояний и strong emphasis
  static const Color quantumDark = Color(0xFF6D28D9);

  /// Quantum Intense - Для критически важных элементов
  static const Color quantumIntense = Color(0xFF5B21B6);

  /// Quantum Black - Максимальный контраст, для текста на светлом
  static const Color quantumBlack = Color(0xFF4C1D95);

  // =====================================================================
  // ENTERPRISE GRAYS - Neutral System (Semantic Naming)
  // =====================================================================

  /// Абсолютно чистый белый для main backgrounds
  static const Color enterpriseWhite = Color(0xFFFDFDFE);

  /// Едва заметный оттенок для subtle backgrounds
  static const Color enterpriseLight = Color(0xFFF8FAFC);

  /// Мягкий фон для cards и panels
  static const Color enterpriseSoft = Color(0xFFE2E8F0);

  /// Средний тон для borders и dividers
  static const Color enterpriseMedium = Color(0xFFCBD5E1);

  /// Нейтральный тон для secondary text и icons
  static const Color enterpriseNeutral = Color(0xFF94A3B8);

  /// Основной серый для body text
  static const Color enterpriseCore = Color(0xFF64748B);

  /// Глубокий серый для headings
  static const Color enterpriseDeep = Color(0xFF475569);

  /// Темный серый для important text
  static const Color enterpriseDark = Color(0xFF334155);

  /// Очень темный для high contrast text
  static const Color enterpriseDarker = Color(0xFF1E293B);

  /// Максимальный контраст для critical text
  static const Color enterpriseBlack = Color(0xFF0F172A);

  // =====================================================================
  // SEMANTIC COLORS - Intelligent Feedback System
  // =====================================================================

  /// Success - Emerald Intelligence (умный зеленый)
  static const Color successCore = Color(0xFF10B981);
  static const Color successLight = Color(0xFFD1FAE5);
  static const Color successDark = Color(0xFF047857);

  /// Warning - Amber Awareness (внимательный оранжевый)
  static const Color warningCore = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFEF3C7);
  static const Color warningDark = Color(0xFFD97706);

  /// Error - Ruby Alert (тревожный красный)
  static const Color errorCore = Color(0xFFEF4444);
  static const Color errorLight = Color(0xFFFEE2E2);
  static const Color errorDark = Color(0xFFDC2626);

  /// Info - Cyan Intelligence (информативный циан)
  static const Color infoCore = Color(0xFF06B6D4);
  static const Color infoLight = Color(0xFFCFFAFE);
  static const Color infoDark = Color(0xFF0891B2);

  // =====================================================================
  // PREMIUM ACCENTS - Luxury Touch Points
  // =====================================================================

  /// Premium Gold - для VIP элементов и highlights
  static const Color premiumGold = Color(0xFFF59E0B);

  /// Premium Rose - для emotional connections
  static const Color premiumRose = Color(0xFFF43F5E);

  /// Premium Emerald - для success и achievements
  static const Color premiumEmerald = Color(0xFF10B981);

  /// Premium Sky - для information и trust
  static const Color premiumSky = Color(0xFF0EA5E9);

  // =====================================================================
  // GLASSMORPHISM SYSTEM - Strategic Glass Elements
  // =====================================================================

  /// Navigation Glass - для навигационных элементов
  static const Color navigationGlass = Color(0xCCFFFFFF); // 80% white

  /// Modal Glass - для модальных окон и overlays
  static const Color modalGlass = Color(0xF2FFFFFF); // 95% white

  /// Floating Glass - для floating action buttons
  static const Color floatingGlass = Color(0xE68B5CF6); // 90% quantum core

  /// Card Glass - для стеклянных карточек
  static const Color cardGlass = Color(0xE6FFFFFF); // 90% white

  /// Sidebar Glass - для боковых панелей
  static const Color sidebarGlass = Color(0xF9FFFFFF); // 97% white

  // =====================================================================
  // SURFACE SYSTEM - Elevation Hierarchy (Material Design 3)
  // =====================================================================

  /// Surface Level 0 - Page background
  static const Color surface0 = enterpriseWhite;

  /// Surface Level 1 - Cards, panels, basic containers
  static const Color surface1 = enterpriseLight;

  /// Surface Level 2 - Elevated cards, dropdowns
  static const Color surface2 = enterpriseSoft;

  /// Surface Level 3 - Modals, dialogs, floating elements
  static const Color surface3 = Color(0xFFF1F5F9);

  /// Surface Level 4 - Tooltips, critical alerts
  static const Color surface4 = Color(0xFFE2E8F0);

  /// Surface Level 5 - Maximum elevation elements
  static const Color surface5 = Color(0xFFCBD5E1);

  // =====================================================================
  // TEXT HIERARCHY - Conscious Readability System
  // =====================================================================

  /// Primary Text - Максимальная читаемость (WCAG AAA)
  static const Color textPrimary = enterpriseBlack;

  /// Secondary Text - Важная но не критичная информация
  static const Color textSecondary = enterpriseDeep;

  /// Tertiary Text - Дополнительная информация
  static const Color textTertiary = enterpriseCore;

  /// Quaternary Text - Metadata, timestamps, subtle info
  static const Color textQuaternary = enterpriseNeutral;

  /// Disabled Text - Неактивные элементы
  static const Color textDisabled = enterpriseMedium;

  /// Inverse Text - Текст на темном фоне
  static const Color textInverse = enterpriseWhite;

  /// Accent Text - Акцентный текст (ссылки, highlights)
  static const Color textAccent = quantumCore;

  /// Primary Main - Основной цвет
  static const Color primaryMain = quantumCore;

  /// Secondary Main - Вторичный цвет
  static const Color secondaryMain = quantumMedium;

  /// Accent Main - Акцентный цвет
  static const Color accentMain = quantumCore;

  /// Text On Primary - Текст на основном цвете
  static const Color textOnPrimary = textInverse;

  /// Elegant Accent - Элегантный акцент
  static const LinearGradient elegantAccent = gradientPrimary;

  /// Error - Цвет ошибки
  static const Color error = errorCore;

  /// Success - Цвет успеха
  static const Color success = successCore;

  /// Warning - Цвет предупреждения
  static const Color warning = warningCore;

  /// Info - Информационный цвет
  static const Color info = infoCore;

  // =====================================================================
  // INTERACTIVE STATES - Micro-interaction Colors
  // =====================================================================

  /// Hover State - Едва заметное изменение
  static const Color stateHover = Color(0x0A8B5CF6); // 4% quantum core

  /// Focus State - Четкий индикатор фокуса
  static const Color stateFocus = Color(0x1A8B5CF6); // 10% quantum core

  /// Pressed State - Immediate feedback
  static const Color statePressed = Color(0x1F8B5CF6); // 12% quantum core

  /// Selected State - Persistent selection
  static const Color stateSelected = Color(0x0F8B5CF6); // 6% quantum core

  /// Disabled State - Clearly inactive
  static const Color stateDisabled = Color(0x40CBD5E1); // 25% enterprise medium

  // =====================================================================
  // BORDER SYSTEM - Intelligent Boundaries
  // =====================================================================

  /// Subtle Border - Едва заметные разделители
  static const Color borderSubtle = Color(0xFFE2E8F0);

  /// Default Border - Стандартные границы
  static const Color borderDefault = Color(0xFFCBD5E1);

  /// Medium Border - Заметные границы для важных элементов
  static const Color borderMedium = Color(0xFF94A3B8);

  /// Strong Border - Четкие границы для критичных элементов
  static const Color borderStrong = Color(0xFF64748B);

  /// Focus Border - Границы в состоянии фокуса
  static const Color borderFocus = quantumCore;

  /// Error Border - Границы для ошибок
  static const Color borderError = errorCore;

  // =====================================================================
  // SHADOW SYSTEM - Depth Perception Colors
  // =====================================================================

  /// Micro Shadow - Для subtle depth (1-2dp elevation)
  static const Color shadowMicro = Color(0x051E293B); // 2% enterprise black

  /// Small Shadow - Для small cards (2-4dp elevation)
  static const Color shadowSmall = Color(0x0A1E293B); // 4% enterprise black

  /// Medium Shadow - Для standard elevation (4-8dp elevation)
  static const Color shadowMedium = Color(0x0F1E293B); // 6% enterprise black

  /// Large Shadow - Для high elevation (8-16dp elevation)
  static const Color shadowLarge = Color(0x141E293B); // 8% enterprise black

  /// XLarge Shadow - Для floating elements (16-24dp elevation)
  static const Color shadowXLarge = Color(0x1A1E293B); // 10% enterprise black

  /// Brand Shadow - Цветная тень для brand elements
  static const Color shadowBrand = Color(0x1A8B5CF6); // 10% quantum core

  // =====================================================================
  // GRADIENT SYSTEM - Enterprise Gradients
  // =====================================================================

  /// Primary Brand Gradient - Основной градиент бренда
  static const LinearGradient gradientPrimary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [quantumCore, quantumDeep],
  );

  /// Subtle Background Gradient - Едва заметный фоновый градиент
  static const LinearGradient gradientSubtle = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [enterpriseWhite, enterpriseLight],
  );

  /// Glass Gradient - Для стеклянных элементов
  static const LinearGradient gradientGlass = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFFFFF),
      Color(0xF2FFFFFF),
    ],
  );

  /// Success Gradient - Для success состояний
  static const LinearGradient gradientSuccess = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [successCore, successDark],
  );

  // =====================================================================
  // UTILITY METHODS - Smart Color Functions
  // =====================================================================

  /// Создает адаптивный цвет в зависимости от темы
  static Color adaptive({
    required Color light,
    required Color dark,
    required bool isDarkMode,
  }) {
    return isDarkMode ? dark : light;
  }

  /// Создает цвет с заданной прозрачностью
  static Color withAlpha(Color color, double alpha) {
    return color.withValues(alpha: alpha.clamp(0.0, 1.0));
  }

  /// Получает правильный цвет текста для фона
  static Color getTextColorForBackground(Color backgroundColor) {
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? textPrimary : textInverse;
  }

  /// Создает hover вариант цвета
  static Color getHoverColor(Color baseColor) {
    final hsl = HSLColor.fromColor(baseColor);
    return hsl
        .withLightness(
          (hsl.lightness + 0.05).clamp(0.0, 1.0),
        )
        .toColor();
  }

  /// Создает pressed вариант цвета
  static Color getPressedColor(Color baseColor) {
    final hsl = HSLColor.fromColor(baseColor);
    return hsl
        .withLightness(
          (hsl.lightness - 0.05).clamp(0.0, 1.0),
        )
        .toColor();
  }

  /// Проверяет accessibility контраст
  static bool hasAccessibleContrast(Color foreground, Color background) {
    final foregroundLuminance = foreground.computeLuminance();
    final backgroundLuminance = background.computeLuminance();

    final ratio = (foregroundLuminance + 0.05) / (backgroundLuminance + 0.05);
    return ratio >= 4.5; // WCAG AA standard
  }
}
