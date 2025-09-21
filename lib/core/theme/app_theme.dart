import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

/// Тема приложения BeautyMaster
/// Стиль: Glassmorphism 3.0 + Liquid Design
class AppTheme {
  AppTheme._();

  /// Светлая тема
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: _lightColorScheme,

      // Шрифт - используем системный
      // fontFamily: null, // Системный шрифт

      // AppBar
      appBarTheme: _appBarTheme(true),

      // BottomNavigationBar
      bottomNavigationBarTheme: _bottomNavigationBarTheme(true),

      // Card
      cardTheme: _cardTheme(true),

      // ElevatedButton
      elevatedButtonTheme: _elevatedButtonTheme(true),

      // OutlinedButton
      outlinedButtonTheme: _outlinedButtonTheme(true),

      // TextButton
      textButtonTheme: _textButtonTheme(true),

      // FloatingActionButton
      floatingActionButtonTheme: _floatingActionButtonTheme(true),

      // InputDecoration
      inputDecorationTheme: _inputDecorationTheme(true),

      // Chip
      chipTheme: _chipTheme(true),

      // Dialog
      dialogTheme: _dialogTheme(true),

      // BottomSheet
      bottomSheetTheme: _bottomSheetTheme(true),

      // Scaffold
      scaffoldBackgroundColor: AppColors.backgroundLight,

      // Divider
      dividerTheme: _dividerTheme(true),

      // ListTile
      listTileTheme: _listTileTheme(true),

      // Switch
      switchTheme: _switchTheme(true),

      // Slider
      sliderTheme: _sliderTheme(true),

      // ProgressIndicator
      progressIndicatorTheme: _progressIndicatorTheme(true),

      // SnackBar
      snackBarTheme: _snackBarTheme(true),

      // TabBar
      tabBarTheme: _tabBarTheme(true),
    );
  }

  /// Темная тема
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: _darkColorScheme,

      // Шрифт
      fontFamily: 'Montserrat',

      // AppBar
      appBarTheme: _appBarTheme(false),

      // BottomNavigationBar
      bottomNavigationBarTheme: _bottomNavigationBarTheme(false),

      // Card
      cardTheme: _cardTheme(false),

      // ElevatedButton
      elevatedButtonTheme: _elevatedButtonTheme(false),

      // OutlinedButton
      outlinedButtonTheme: _outlinedButtonTheme(false),

      // TextButton
      textButtonTheme: _textButtonTheme(false),

      // FloatingActionButton
      floatingActionButtonTheme: _floatingActionButtonTheme(false),

      // InputDecoration
      inputDecorationTheme: _inputDecorationTheme(false),

      // Chip
      chipTheme: _chipTheme(false),

      // Dialog
      dialogTheme: _dialogTheme(false),

      // BottomSheet
      bottomSheetTheme: _bottomSheetTheme(false),

      // Scaffold
      scaffoldBackgroundColor: AppColors.backgroundDark,

      // Divider
      dividerTheme: _dividerTheme(false),

      // ListTile
      listTileTheme: _listTileTheme(false),

      // Switch
      switchTheme: _switchTheme(false),

      // Slider
      sliderTheme: _sliderTheme(false),

      // ProgressIndicator
      progressIndicatorTheme: _progressIndicatorTheme(false),

      // SnackBar
      snackBarTheme: _snackBarTheme(false),

      // TabBar
      tabBarTheme: _tabBarTheme(false),
    );
  }

  /// Светлая цветовая схема
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
    background: AppColors.backgroundLight,
    onBackground: AppColors.textPrimary,
    surface: AppColors.surfaceLight,
    onSurface: AppColors.textPrimary,
    surfaceVariant: AppColors.glassBackground,
    onSurfaceVariant: AppColors.textSecondary,
    outline: AppColors.glassBorder,
    shadow: AppColors.shadowLight,
  );

  /// Темная цветовая схема
  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primaryMain,
    onPrimary: AppColors.textOnPrimary,
    secondary: AppColors.secondaryMain,
    onSecondary: AppColors.textOnPrimary,
    tertiary: AppColors.accentMain,
    onTertiary: AppColors.textOnPrimary,
    error: AppColors.error,
    onError: AppColors.textOnPrimary,
    background: AppColors.backgroundDark,
    onBackground: Colors.white,
    surface: AppColors.surfaceDark,
    onSurface: Colors.white,
    surfaceVariant: AppColors.glassBackground,
    onSurfaceVariant: Colors.white70,
    outline: AppColors.glassBorder,
    shadow: AppColors.shadowDark,
  );

  /// Тема AppBar
  static AppBarTheme _appBarTheme(bool isLight) {
    return AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle:
          isLight ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(
        color: isLight ? AppColors.textPrimary : Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: 'Montserrat',
      ),
      iconTheme: IconThemeData(
        color: isLight ? AppColors.textPrimary : Colors.white,
      ),
      actionsIconTheme: IconThemeData(
        color: isLight ? AppColors.textPrimary : Colors.white,
      ),
    );
  }

  /// Тема BottomNavigationBar
  static BottomNavigationBarThemeData _bottomNavigationBarTheme(bool isLight) {
    return BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryMain,
      unselectedItemColor: isLight ? AppColors.textSecondary : Colors.white54,
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontFamily: 'Montserrat',
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat',
      ),
    );
  }

  /// Тема Card
  static CardThemeData _cardTheme(bool isLight) {
    return CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        side: BorderSide(
          color: AppColors.glassBorder,
          width: 1,
        ),
      ),
      color: isLight ? AppColors.glassBackground : AppColors.glassBackground,
      margin: const EdgeInsets.all(AppConstants.paddingSmall),
    );
  }

  /// Тема ElevatedButton
  static ElevatedButtonThemeData _elevatedButtonTheme(bool isLight) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryMain,
        foregroundColor: AppColors.textOnPrimary,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        ),
        minimumSize: const Size(double.infinity, AppConstants.buttonHeight),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }

  /// Тема OutlinedButton
  static OutlinedButtonThemeData _outlinedButtonTheme(bool isLight) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryMain,
        side: const BorderSide(
          color: AppColors.primaryMain,
          width: 1.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        ),
        minimumSize: const Size(double.infinity, AppConstants.buttonHeight),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }

  /// Тема TextButton
  static TextButtonThemeData _textButtonTheme(bool isLight) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryMain,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }

  /// Тема FloatingActionButton
  static FloatingActionButtonThemeData _floatingActionButtonTheme(
      bool isLight) {
    return FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryMain,
      foregroundColor: AppColors.textOnPrimary,
      elevation: AppConstants.shadowElevationMedium,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
      ),
    );
  }

  /// Тема InputDecoration
  static InputDecorationTheme _inputDecorationTheme(bool isLight) {
    return InputDecorationTheme(
      filled: true,
      fillColor:
          isLight ? AppColors.glassBackground : AppColors.glassBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        borderSide: const BorderSide(
          color: AppColors.glassBorder,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        borderSide: const BorderSide(
          color: AppColors.glassBorder,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        borderSide: const BorderSide(
          color: AppColors.primaryMain,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        borderSide: const BorderSide(
          color: AppColors.error,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingMedium,
        vertical: AppConstants.paddingMedium,
      ),
      hintStyle: TextStyle(
        color: isLight ? AppColors.textSecondary : Colors.white54,
        fontFamily: 'Montserrat',
      ),
      labelStyle: TextStyle(
        color: isLight ? AppColors.textSecondary : Colors.white54,
        fontFamily: 'Montserrat',
      ),
    );
  }

  /// Остальные темы будут созданы в следующем блоке
  static ChipThemeData _chipTheme(bool isLight) {
    return ChipThemeData(
      backgroundColor: AppColors.glassBackground,
      selectedColor: AppColors.primaryMain,
      labelStyle: TextStyle(
        color: isLight ? AppColors.textPrimary : Colors.white,
        fontFamily: 'Montserrat',
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
      ),
    );
  }

  static DialogThemeData _dialogTheme(bool isLight) {
    return DialogThemeData(
      backgroundColor: isLight ? AppColors.surfaceLight : AppColors.surfaceDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
      ),
      elevation: AppConstants.shadowElevationHigh,
    );
  }

  static BottomSheetThemeData _bottomSheetTheme(bool isLight) {
    return BottomSheetThemeData(
      backgroundColor: isLight ? AppColors.surfaceLight : AppColors.surfaceDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppConstants.radiusLarge),
        ),
      ),
      elevation: AppConstants.shadowElevationHigh,
    );
  }

  static DividerThemeData _dividerTheme(bool isLight) {
    return DividerThemeData(
      color: AppColors.glassBorder,
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
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
      ),
    );
  }

  static SwitchThemeData _switchTheme(bool isLight) {
    return SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primaryMain;
        }
        return AppColors.textSecondary;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primaryLight;
        }
        return AppColors.glassBorder;
      }),
    );
  }

  static SliderThemeData _sliderTheme(bool isLight) {
    return SliderThemeData(
      activeTrackColor: AppColors.primaryMain,
      inactiveTrackColor: AppColors.glassBorder,
      thumbColor: AppColors.primaryMain,
      overlayColor: AppColors.primaryLight.withOpacity(0.2),
    );
  }

  static ProgressIndicatorThemeData _progressIndicatorTheme(bool isLight) {
    return const ProgressIndicatorThemeData(
      color: AppColors.primaryMain,
      // backgroundColor удален как устаревший параметр
    );
  }

  static SnackBarThemeData _snackBarTheme(bool isLight) {
    return SnackBarThemeData(
      backgroundColor: isLight ? AppColors.textPrimary : AppColors.surfaceDark,
      contentTextStyle: TextStyle(
        color: isLight ? Colors.white : Colors.white,
        fontFamily: 'Montserrat',
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
      ),
      behavior: SnackBarBehavior.floating,
    );
  }

  static TabBarThemeData _tabBarTheme(bool isLight) {
    return TabBarThemeData(
      labelColor: AppColors.primaryMain,
      unselectedLabelColor: isLight ? AppColors.textSecondary : Colors.white54,
      indicatorColor: AppColors.primaryMain,
      labelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: 'Montserrat',
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat',
      ),
    );
  }
}
