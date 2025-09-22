import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

/// Enterprise-уровень тема приложения BeautyMaster 2025
/// Стиль: Elegant Minimalism + Glassmorphism
class AppTheme {
  AppTheme._();

  /// Светлая тема (основная)
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: _lightColorScheme,

      // Системный шрифт с улучшенной типографикой
      fontFamily: null, // Используем системный

      // AppBar с прозрачностью
      appBarTheme: _appBarTheme(true),

      // BottomNavigationBar с liquid эффектами
      bottomNavigationBarTheme: _bottomNavigationBarTheme(true),

      // Card с неоморфизмом
      cardTheme: _cardTheme(true),

      // ElevatedButton с liquid дизайном
      elevatedButtonTheme: _elevatedButtonTheme(true),

      // OutlinedButton с organic формами
      outlinedButtonTheme: _outlinedButtonTheme(true),

      // TextButton минималистичный
      textButtonTheme: _textButtonTheme(true),

      // FloatingActionButton с breathing эффектом
      floatingActionButtonTheme: _floatingActionButtonTheme(true),

      // InputDecoration с неоморфными полями
      inputDecorationTheme: _inputDecorationTheme(true),

      // Chip с пастельными тонами
      chipTheme: _chipTheme(true),

      // Dialog с liquid формами
      dialogTheme: _dialogTheme(true),

      // BottomSheet с organic краями
      bottomSheetTheme: _bottomSheetTheme(true),

      // Scaffold с градиентным фоном
      scaffoldBackgroundColor: AppColors.backgroundMain,

      // Divider минималистичный
      dividerTheme: _dividerTheme(true),

      // ListTile с breathing эффектами
      listTileTheme: _listTileTheme(true),

      // Switch с liquid анимациями
      switchTheme: _switchTheme(true),

      // Slider с organic формами
      sliderTheme: _sliderTheme(true),

      // ProgressIndicator с градиентами
      progressIndicatorTheme: _progressIndicatorTheme(true),

      // SnackBar с неоморфизмом
      snackBarTheme: _snackBarTheme(true),

      // TabBar с liquid эффектами
      tabBarTheme: _tabBarTheme(true),

      // Расширения для специальных элементов
      extensions: [
        _customButtonTheme(),
        _customContainerTheme(),
      ],
    );
  }

  /// Темная тема (дополнительная)
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: _darkColorScheme,
      fontFamily: null,

      // Все те же компоненты, но с темными тонами
      appBarTheme: _appBarTheme(false),
      bottomNavigationBarTheme: _bottomNavigationBarTheme(false),
      cardTheme: _cardTheme(false),
      elevatedButtonTheme: _elevatedButtonTheme(false),
      outlinedButtonTheme: _outlinedButtonTheme(false),
      textButtonTheme: _textButtonTheme(false),
      floatingActionButtonTheme: _floatingActionButtonTheme(false),
      inputDecorationTheme: _inputDecorationTheme(false),
      chipTheme: _chipTheme(false),
      dialogTheme: _dialogTheme(false),
      bottomSheetTheme: _bottomSheetTheme(false),
      scaffoldBackgroundColor: AppColors.backgroundSecondary,
      dividerTheme: _dividerTheme(false),
      listTileTheme: _listTileTheme(false),
      switchTheme: _switchTheme(false),
      sliderTheme: _sliderTheme(false),
      progressIndicatorTheme: _progressIndicatorTheme(false),
      snackBarTheme: _snackBarTheme(false),
      tabBarTheme: _tabBarTheme(false),
    );
  }

  // ===== COLOR SCHEMES - цветовые схемы =====

  /// Светлая цветовая схема - Enterprise стиль
  static const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primaryMain,
    onPrimary: AppColors.textOnPrimary,
    secondary: AppColors.secondaryMain,
    onSecondary: AppColors.textOnPrimary,
    tertiary: AppColors.accentMain,
    onTertiary: AppColors.textOnPrimary,
    error: AppColors.error,
    onError: AppColors.textOnPrimary,
    surface: AppColors.surfaceMain,
    onSurface: AppColors.textPrimary,
    surfaceContainerHighest: AppColors.surfaceElevated,
    onSurfaceVariant: AppColors.textSecondary,
    outline: AppColors.glassBorder,
    shadow: AppColors.shadowMedium,
    inverseSurface: AppColors.textPrimary,
    onInverseSurface: AppColors.surfaceMain,
  );

  /// Темная цветовая схема - Enterprise стиль
  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primaryLight,
    onPrimary: AppColors.textOnDark,
    secondary: AppColors.secondaryLight,
    onSecondary: AppColors.textOnDark,
    tertiary: AppColors.accentLight,
    onTertiary: AppColors.textOnDark,
    error: AppColors.error,
    onError: AppColors.textOnPrimary,
    surface: AppColors.primaryDark,
    onSurface: AppColors.textOnDark,
    surfaceContainerHighest: AppColors.primaryMain,
    onSurfaceVariant: AppColors.textMuted,
    outline: AppColors.glassBorder,
    shadow: AppColors.shadowDark,
    inverseSurface: AppColors.surfaceMain,
    onInverseSurface: AppColors.textPrimary,
  );

  // ===== COMPONENT THEMES - темы компонентов =====

  /// Тема AppBar - Enterprise стиль
  static AppBarTheme _appBarTheme(bool isLight) {
    return AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle:
          isLight ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(
        color: isLight ? AppColors.textPrimary : AppColors.textOnDark,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
      ),
      iconTheme: IconThemeData(
        color: isLight ? AppColors.textPrimary : AppColors.textOnDark,
        size: AppConstants.iconMedium,
      ),
      actionsIconTheme: IconThemeData(
        color: isLight ? AppColors.textSecondary : AppColors.textMuted,
        size: AppConstants.iconMedium,
      ),
    );
  }

  /// Тема BottomNavigationBar - Enterprise стиль
  static BottomNavigationBarThemeData _bottomNavigationBarTheme(bool isLight) {
    return BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.accentMain,
      unselectedItemColor:
          isLight ? AppColors.textTertiary : AppColors.textMuted,
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.1,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );
  }

  /// Тема Card - Enterprise стиль
  static CardThemeData _cardTheme(bool isLight) {
    return CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.glassRadius),
      ),
      color: isLight ? AppColors.surfaceMain : AppColors.primaryDark,
      margin: const EdgeInsets.all(AppConstants.paddingSmall),
      shadowColor: AppColors.shadowSubtle,
    );
  }

  /// Тема ElevatedButton - Enterprise стиль
  static ElevatedButtonThemeData _elevatedButtonTheme(bool isLight) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentMain,
        foregroundColor: AppColors.textOnPrimary,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.glassRadius),
        ),
        minimumSize: const Size(double.infinity, 48),
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.paddingLarge,
          vertical: AppConstants.paddingMedium,
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
        ),
      ).copyWith(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return AppColors.accentDark;
          }
          if (states.contains(WidgetState.hovered)) {
            return AppColors.accentLight;
          }
          return AppColors.accentMain;
        }),
      ),
    );
  }

  /// Тема OutlinedButton - Enterprise стиль
  static OutlinedButtonThemeData _outlinedButtonTheme(bool isLight) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.accentMain,
        side: BorderSide(
          color: AppColors.glassBorder,
          width: AppConstants.glassBorderWidth,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.glassRadius),
        ),
        minimumSize: const Size(double.infinity, 48),
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.paddingLarge,
          vertical: AppConstants.paddingMedium,
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
        ),
      ),
    );
  }

  /// Тема TextButton - Enterprise стиль
  static TextButtonThemeData _textButtonTheme(bool isLight) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.accentMain,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.glassRadius),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.paddingMedium,
          vertical: AppConstants.paddingSmall,
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
      ),
    );
  }

  /// Тема FloatingActionButton - Enterprise стиль
  static FloatingActionButtonThemeData _floatingActionButtonTheme(
      bool isLight) {
    return FloatingActionButtonThemeData(
      backgroundColor: AppColors.accentMain,
      foregroundColor: AppColors.textOnPrimary,
      elevation: 4,
      focusElevation: 8,
      hoverElevation: 6,
      highlightElevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      iconSize: AppConstants.iconLarge,
    );
  }

  /// Тема InputDecoration - Enterprise стиль
  static InputDecorationTheme _inputDecorationTheme(bool isLight) {
    return InputDecorationTheme(
      filled: true,
      fillColor: isLight ? AppColors.surfaceMain : AppColors.primaryDark,

      // Границы
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.glassRadius),
        borderSide: BorderSide(
          color: AppColors.glassBorder,
          width: AppConstants.glassBorderWidth,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.glassRadius),
        borderSide: BorderSide(
          color: AppColors.glassBorder,
          width: AppConstants.glassBorderWidth,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.glassRadius),
        borderSide: BorderSide(
          color: AppColors.accentMain,
          width: AppConstants.glassBorderWidthThick,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.glassRadius),
        borderSide: BorderSide(
          color: AppColors.error,
          width: AppConstants.glassBorderWidth,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.glassRadius),
        borderSide: BorderSide(
          color: AppColors.error,
          width: AppConstants.glassBorderWidthThick,
        ),
      ),

      // Отступы и стили
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingLarge,
        vertical: AppConstants.paddingMedium,
      ),
      hintStyle: TextStyle(
        color: isLight ? AppColors.textTertiary : AppColors.textMuted,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      labelStyle: TextStyle(
        color: isLight ? AppColors.textSecondary : AppColors.textMuted,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      floatingLabelStyle: TextStyle(
        color: AppColors.accentMain,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  /// Тема Chip с пастельными тонами
  static ChipThemeData _chipTheme(bool isLight) {
    return ChipThemeData(
      // backgroundColor: AppColors.surfaceElevated, // Убираем устаревшее поле
      selectedColor: AppColors.primaryLight,
      disabledColor: AppColors.disabled,
      labelStyle: TextStyle(
        color: isLight ? AppColors.textPrimary : AppColors.surfaceMain,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      secondaryLabelStyle: TextStyle(
        color: AppColors.textSecondary,
        fontSize: 13,
        fontWeight: FontWeight.w400,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      side: BorderSide.none,
      // padding: удаляем, используем современные поля
    );
  }

  /// Остальные темы компонентов...
  static DialogThemeData _dialogTheme(bool isLight) {
    return DialogThemeData(
      backgroundColor:
          isLight ? AppColors.surfaceMain : const Color(0xFF2D1B3D),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 16,
      shadowColor: AppColors.shadowMedium,
    );
  }

  static BottomSheetThemeData _bottomSheetTheme(bool isLight) {
    return BottomSheetThemeData(
      backgroundColor:
          isLight ? AppColors.surfaceMain : const Color(0xFF2D1B3D),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      elevation: 16,
      shadowColor: AppColors.shadowMedium,
    );
  }

  static DividerThemeData _dividerTheme(bool isLight) {
    return DividerThemeData(
      color: AppColors.primaryLight.withValues(alpha: 0.2),
      thickness: 1,
      space: AppConstants.paddingMedium,
    );
  }

  static ListTileThemeData _listTileTheme(bool isLight) {
    return ListTileThemeData(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingMedium,
        vertical: AppConstants.paddingSmall,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      tileColor: Colors.transparent,
    );
  }

  static SwitchThemeData _switchTheme(bool isLight) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryMain;
        }
        return AppColors.textTertiary;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryLight;
        }
        return AppColors.surfaceVariant;
      }),
    );
  }

  static SliderThemeData _sliderTheme(bool isLight) {
    return SliderThemeData(
      activeTrackColor: AppColors.primaryMain,
      inactiveTrackColor: AppColors.primaryLight.withValues(alpha: 0.3),
      thumbColor: AppColors.primaryMain,
      overlayColor: AppColors.primaryLight.withValues(alpha: 0.2),
      trackHeight: 4,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
    );
  }

  static ProgressIndicatorThemeData _progressIndicatorTheme(bool isLight) {
    return const ProgressIndicatorThemeData(
      color: AppColors.primaryMain,
      linearTrackColor: AppColors.primaryLight,
      circularTrackColor: AppColors.primaryLight,
    );
  }

  static SnackBarThemeData _snackBarTheme(bool isLight) {
    return SnackBarThemeData(
      backgroundColor: isLight ? AppColors.textPrimary : AppColors.surfaceMain,
      contentTextStyle: TextStyle(
        color: isLight ? AppColors.surfaceMain : AppColors.textPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 8,
    );
  }

  static TabBarThemeData _tabBarTheme(bool isLight) {
    return TabBarThemeData(
      labelColor: AppColors.primaryMain,
      unselectedLabelColor:
          isLight ? AppColors.textTertiary : AppColors.textMuted,
      indicatorColor: AppColors.primaryMain,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.1,
      ),
    );
  }

  // ===== CUSTOM EXTENSIONS - кастомные расширения =====

  static ThemeExtension _customButtonTheme() {
    return const _CustomButtonTheme();
  }

  static ThemeExtension _customContainerTheme() {
    return const _CustomContainerTheme();
  }
}

// Кастомные расширения темы для специальных элементов
class _CustomButtonTheme extends ThemeExtension<_CustomButtonTheme> {
  const _CustomButtonTheme();

  @override
  _CustomButtonTheme copyWith() => const _CustomButtonTheme();

  @override
  _CustomButtonTheme lerp(ThemeExtension<_CustomButtonTheme>? other, double t) {
    return const _CustomButtonTheme();
  }
}

class _CustomContainerTheme extends ThemeExtension<_CustomContainerTheme> {
  const _CustomContainerTheme();

  @override
  _CustomContainerTheme copyWith() => const _CustomContainerTheme();

  @override
  _CustomContainerTheme lerp(
      ThemeExtension<_CustomContainerTheme>? other, double t) {
    return const _CustomContainerTheme();
  }
}
