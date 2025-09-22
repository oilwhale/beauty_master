import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

/// Enterprise Theme System BeautyMaster 2.0
/// Философия: Conscious Minimalism + Progressive Disclosure + Selective Glassmorphism
/// Принципы: 90% White Space + Mathematical Precision + Emotional Intelligence
class AppTheme {
  AppTheme._();

  // =====================================================================
  // LIGHT THEME - Primary Enterprise Theme
  // =====================================================================

  static ThemeData get lightTheme {
    return ThemeData(
      // Material Design 3 + Enterprise customizations
      useMaterial3: true,
      brightness: Brightness.light,

      // Enterprise color scheme
      colorScheme: _lightColorScheme,

      // Typography system with Perfect Fourth scale
      textTheme: _textTheme,

      // System UI customization
      appBarTheme: _lightAppBarTheme,

      // Navigation components
      bottomNavigationBarTheme: _lightBottomNavigationBarTheme,
      navigationBarTheme: _lightNavigationBarTheme,

      // Interactive components
      elevatedButtonTheme: _lightElevatedButtonTheme,
      outlinedButtonTheme: _lightOutlinedButtonTheme,
      textButtonTheme: _lightTextButtonTheme,
      iconButtonTheme: _lightIconButtonTheme,
      floatingActionButtonTheme: _lightFloatingActionButtonTheme,

      // Input components
      inputDecorationTheme: _lightInputDecorationTheme,

      // Surface components
      cardTheme: _lightCardTheme,
      dialogTheme: _lightDialogTheme,
      bottomSheetTheme: _lightBottomSheetTheme,

      // Data display components
      chipTheme: _lightChipTheme,
      listTileTheme: _lightListTileTheme,
      dividerTheme: _lightDividerTheme,

      // Feedback components
      snackBarTheme: _lightSnackBarTheme,
      progressIndicatorTheme: _lightProgressIndicatorTheme,

      // Selection components
      switchTheme: _lightSwitchTheme,
      radioTheme: _lightRadioTheme,
      checkboxTheme: _lightCheckboxTheme,
      sliderTheme: _lightSliderTheme,

      // Tab components
      tabBarTheme: _lightTabBarTheme,

      // Scaffold and backgrounds
      scaffoldBackgroundColor: AppColors.surface0,
      canvasColor: AppColors.surface1,

      // Interaction feedback
      splashColor: AppColors.statePressed,
      highlightColor: AppColors.stateHover,
      hoverColor: AppColors.stateHover,
      focusColor: AppColors.stateFocus,

      // Visual density for Enterprise feel
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  // =====================================================================
  // DARK THEME - Alternative Enterprise Theme
  // =====================================================================

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: _darkColorScheme,
      textTheme: _textTheme,

      // Dark theme component overrides
      appBarTheme: _darkAppBarTheme,
      bottomNavigationBarTheme: _darkBottomNavigationBarTheme,
      elevatedButtonTheme: _darkElevatedButtonTheme,
      cardTheme: _darkCardTheme,

      scaffoldBackgroundColor: AppColors.enterpriseBlack,
      canvasColor: AppColors.enterpriseDarker,

      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  // =====================================================================
  // COLOR SCHEMES - Enterprise Color Systems
  // =====================================================================

  static const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,

    // Primary colors
    primary: AppColors.quantumCore,
    onPrimary: AppColors.textInverse,
    primaryContainer: AppColors.quantumLight,
    onPrimaryContainer: AppColors.quantumBlack,

    // Secondary colors
    secondary: AppColors.quantumMedium,
    onSecondary: AppColors.textInverse,
    secondaryContainer: AppColors.quantumFog,
    onSecondaryContainer: AppColors.quantumDeep,

    // Tertiary colors
    tertiary: AppColors.premiumSky,
    onTertiary: AppColors.textInverse,
    tertiaryContainer: AppColors.infoLight,
    onTertiaryContainer: AppColors.infoDark,

    // Error colors
    error: AppColors.errorCore,
    onError: AppColors.textInverse,
    errorContainer: AppColors.errorLight,
    onErrorContainer: AppColors.errorDark,

    // Surface colors with elevation hierarchy
    surface: AppColors.surface0,
    onSurface: AppColors.textPrimary,
    surfaceContainerHighest: AppColors.surface3,
    surfaceContainerHigh: AppColors.surface2,
    surfaceContainer: AppColors.surface1,
    surfaceContainerLow: AppColors.surface0,
    surfaceContainerLowest: AppColors.enterpriseWhite,

    // Background
    background: AppColors.surface0, // Deprecated but kept for compatibility
    onBackground: AppColors.textPrimary, // Deprecated but kept

    // Variants
    onSurfaceVariant: AppColors.textSecondary,
    outline: AppColors.borderDefault,
    outlineVariant: AppColors.borderSubtle,

    // Inverse colors
    inverseSurface: AppColors.enterpriseBlack,
    onInverseSurface: AppColors.textInverse,
    inversePrimary: AppColors.quantumLight,

    // Shadows and overlays
    shadow: AppColors.shadowMedium,
    scrim: AppColors.enterpriseBlack,
  );

  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.quantumLight,
    onPrimary: AppColors.quantumBlack,
    secondary: AppColors.quantumFog,
    onSecondary: AppColors.quantumDeep,
    surface: AppColors.enterpriseBlack,
    onSurface: AppColors.textInverse,
    error: AppColors.errorCore,
    onError: AppColors.textInverse,
    background: AppColors.enterpriseBlack, // Deprecated
    onBackground: AppColors.textInverse, // Deprecated
  );

  // =====================================================================
  // TYPOGRAPHY THEME - Perfect Fourth Scale + Enterprise Readability
  // =====================================================================

  static TextTheme get _textTheme {
    return TextTheme(
      // Display styles for hero content
      displayLarge: TextStyle(
        fontSize: AppConstants.fontSizeDisplay,
        height: AppConstants.lineHeightDisplay / AppConstants.fontSizeDisplay,
        fontWeight: AppConstants.fontWeightBold,
        letterSpacing: -0.5,
        color: AppColors.textPrimary,
      ),

      displayMedium: TextStyle(
        fontSize: AppConstants.fontSizeH1,
        height: AppConstants.lineHeightH1 / AppConstants.fontSizeH1,
        fontWeight: AppConstants.fontWeightBold,
        letterSpacing: -0.3,
        color: AppColors.textPrimary,
      ),

      displaySmall: TextStyle(
        fontSize: AppConstants.fontSizeH2,
        height: AppConstants.lineHeightH2 / AppConstants.fontSizeH2,
        fontWeight: AppConstants.fontWeightSemiBold,
        letterSpacing: -0.2,
        color: AppColors.textPrimary,
      ),

      // Headline styles for page structure
      headlineLarge: TextStyle(
        fontSize: AppConstants.fontSizeH1,
        height: AppConstants.lineHeightH1 / AppConstants.fontSizeH1,
        fontWeight: AppConstants.fontWeightSemiBold,
        color: AppColors.textPrimary,
      ),

      headlineMedium: TextStyle(
        fontSize: AppConstants.fontSizeH2,
        height: AppConstants.lineHeightH2 / AppConstants.fontSizeH2,
        fontWeight: AppConstants.fontWeightSemiBold,
        color: AppColors.textPrimary,
      ),

      headlineSmall: TextStyle(
        fontSize: AppConstants.fontSizeH3,
        height: AppConstants.lineHeightH3 / AppConstants.fontSizeH3,
        fontWeight: AppConstants.fontWeightSemiBold,
        color: AppColors.textPrimary,
      ),

      // Title styles for component headers
      titleLarge: TextStyle(
        fontSize: AppConstants.fontSizeH3,
        height: AppConstants.lineHeightH3 / AppConstants.fontSizeH3,
        fontWeight: AppConstants.fontWeightMedium,
        color: AppColors.textPrimary,
      ),

      titleMedium: TextStyle(
        fontSize: AppConstants.fontSizeH4,
        height: AppConstants.lineHeightH4 / AppConstants.fontSizeH4,
        fontWeight: AppConstants.fontWeightMedium,
        letterSpacing: 0.1,
        color: AppColors.textPrimary,
      ),

      titleSmall: TextStyle(
        fontSize: AppConstants.fontSizeBody,
        height: AppConstants.lineHeightBody / AppConstants.fontSizeBody,
        fontWeight: AppConstants.fontWeightMedium,
        letterSpacing: 0.1,
        color: AppColors.textSecondary,
      ),

      // Body styles for content
      bodyLarge: TextStyle(
        fontSize: AppConstants.fontSizeBodyLarge,
        height:
            AppConstants.lineHeightBodyLarge / AppConstants.fontSizeBodyLarge,
        fontWeight: AppConstants.fontWeightRegular,
        color: AppColors.textPrimary,
      ),

      bodyMedium: TextStyle(
        fontSize: AppConstants.fontSizeBody,
        height: AppConstants.lineHeightBody / AppConstants.fontSizeBody,
        fontWeight: AppConstants.fontWeightRegular,
        color: AppColors.textPrimary,
      ),

      bodySmall: TextStyle(
        fontSize: AppConstants.fontSizeSmall,
        height: AppConstants.lineHeightSmall / AppConstants.fontSizeSmall,
        fontWeight: AppConstants.fontWeightRegular,
        color: AppColors.textSecondary,
      ),

      // Label styles for UI elements
      labelLarge: TextStyle(
        fontSize: AppConstants.fontSizeBody,
        height: AppConstants.lineHeightBody / AppConstants.fontSizeBody,
        fontWeight: AppConstants.fontWeightMedium,
        letterSpacing: 0.1,
        color: AppColors.textPrimary,
      ),

      labelMedium: TextStyle(
        fontSize: AppConstants.fontSizeSmall,
        height: AppConstants.lineHeightSmall / AppConstants.fontSizeSmall,
        fontWeight: AppConstants.fontWeightMedium,
        letterSpacing: 0.5,
        color: AppColors.textSecondary,
      ),

      labelSmall: TextStyle(
        fontSize: AppConstants.fontSizeMicro,
        height: AppConstants.lineHeightMicro / AppConstants.fontSizeMicro,
        fontWeight: AppConstants.fontWeightMedium,
        letterSpacing: 0.5,
        color: AppColors.textTertiary,
      ),
    );
  }

  // =====================================================================
  // APP BAR THEMES - Navigation Header Styling
  // =====================================================================

  static AppBarTheme get _lightAppBarTheme {
    return AppBarTheme(
      backgroundColor: AppColors.navigationGlass,
      foregroundColor: AppColors.textPrimary,
      elevation: AppConstants.elevation0,
      scrolledUnderElevation: AppConstants.elevation1,
      shadowColor: AppColors.shadowMicro,
      surfaceTintColor: Colors.transparent,

      // System UI overlay
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),

      // Typography
      titleTextStyle: TextStyle(
        fontSize: AppConstants.fontSizeH3,
        fontWeight: AppConstants.fontWeightSemiBold,
        color: AppColors.textPrimary,
      ),

      // Icons
      iconTheme: IconThemeData(
        color: AppColors.textPrimary,
        size: AppConstants.iconMedium,
      ),

      actionsIconTheme: IconThemeData(
        color: AppColors.textSecondary,
        size: AppConstants.iconMedium,
      ),

      // Sizing
      toolbarHeight: AppConstants.appBarHeight,
      centerTitle: false,
    );
  }

  static AppBarTheme get _darkAppBarTheme {
    return _lightAppBarTheme.copyWith(
      backgroundColor: AppColors.enterpriseBlack.withValues(alpha: 0.9),
      foregroundColor: AppColors.textInverse,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  // =====================================================================
  // NAVIGATION THEMES - Bottom Navigation & Navigation Rail
  // =====================================================================

  static BottomNavigationBarThemeData get _lightBottomNavigationBarTheme {
    return BottomNavigationBarThemeData(
      backgroundColor: AppColors.navigationGlass,
      elevation: AppConstants.elevation2,
      type: BottomNavigationBarType.fixed,

      // Selected state
      selectedItemColor: AppColors.quantumCore,
      selectedLabelStyle: TextStyle(
        fontSize: AppConstants.fontSizeSmall,
        fontWeight: AppConstants.fontWeightSemiBold,
        letterSpacing: 0.5,
      ),
      selectedIconTheme: IconThemeData(
        size: AppConstants.iconMedium,
        color: AppColors.quantumCore,
      ),

      // Unselected state
      unselectedItemColor: AppColors.textTertiary,
      unselectedLabelStyle: TextStyle(
        fontSize: AppConstants.fontSizeSmall,
        fontWeight: AppConstants.fontWeightRegular,
        letterSpacing: 0.5,
      ),
      unselectedIconTheme: IconThemeData(
        size: AppConstants.iconMedium,
        color: AppColors.textTertiary,
      ),

      // Behavior
      showSelectedLabels: true,
      showUnselectedLabels: true,
      enableFeedback: true,
    );
  }

  static BottomNavigationBarThemeData get _darkBottomNavigationBarTheme {
    return _lightBottomNavigationBarTheme.copyWith(
      backgroundColor: AppColors.enterpriseBlack.withValues(alpha: 0.9),
      unselectedItemColor: AppColors.enterpriseNeutral,
    );
  }

  static NavigationBarThemeData get _lightNavigationBarTheme {
    return NavigationBarThemeData(
      backgroundColor: AppColors.navigationGlass,
      elevation: AppConstants.elevation2,
      height: AppConstants.bottomNavHeight,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(
            size: AppConstants.iconMedium,
            color: AppColors.quantumCore,
          );
        }
        return IconThemeData(
          size: AppConstants.iconMedium,
          color: AppColors.textTertiary,
        );
      }),
    );
  }

  // =====================================================================
  // BUTTON THEMES - Interactive Elements
  // =====================================================================

  static ElevatedButtonThemeData get _lightElevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // Colors
        backgroundColor: AppColors.quantumCore,
        foregroundColor: AppColors.textInverse,
        disabledBackgroundColor: AppColors.stateDisabled,
        disabledForegroundColor: AppColors.textDisabled,

        // Elevation
        elevation: AppConstants.elevation2,

        // Shape
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        ),

        // Sizing
        minimumSize: Size.fromHeight(AppConstants.buttonHeightLarge),
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.spaceMedium,
          vertical: AppConstants.spaceSmall,
        ),

        // Typography
        textStyle: TextStyle(
          fontSize: AppConstants.fontSizeBody,
          fontWeight: AppConstants.fontWeightSemiBold,
          letterSpacing: 0.1,
        ),

        // Animation
        animationDuration: AppConstants.animationFast,
      ),
    );
  }

  static ElevatedButtonThemeData get _darkElevatedButtonTheme {
    return _lightElevatedButtonTheme;
  }

  static OutlinedButtonThemeData get _lightOutlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.quantumCore,
        disabledForegroundColor: AppColors.textDisabled,
        side: BorderSide(
          color: AppColors.quantumCore,
          width: 1.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        ),
        minimumSize: Size.fromHeight(AppConstants.buttonHeightLarge),
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.spaceMedium,
          vertical: AppConstants.spaceSmall,
        ),
        textStyle: TextStyle(
          fontSize: AppConstants.fontSizeBody,
          fontWeight: AppConstants.fontWeightSemiBold,
          letterSpacing: 0.1,
        ),
      ),
    );
  }

  static TextButtonThemeData get _lightTextButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.quantumCore,
        disabledForegroundColor: AppColors.textDisabled,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.spaceMedium,
          vertical: AppConstants.spaceSmall,
        ),
        textStyle: TextStyle(
          fontSize: AppConstants.fontSizeBody,
          fontWeight: AppConstants.fontWeightMedium,
          letterSpacing: 0.1,
        ),
      ),
    );
  }

  static IconButtonThemeData get _lightIconButtonTheme {
    return IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: AppColors.textSecondary,
        backgroundColor: Colors.transparent,
        disabledForegroundColor: AppColors.textDisabled,
        iconSize: AppConstants.iconMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        ),
        padding: EdgeInsets.all(AppConstants.spaceSmall),
      ),
    );
  }

  static FloatingActionButtonThemeData get _lightFloatingActionButtonTheme {
    return FloatingActionButtonThemeData(
      backgroundColor: AppColors.floatingGlass,
      foregroundColor: AppColors.textInverse,
      elevation: AppConstants.elevation3,
      focusElevation: AppConstants.elevation4,
      hoverElevation: AppConstants.elevation4,
      highlightElevation: AppConstants.elevation2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusXLarge),
      ),
      iconSize: AppConstants.iconLarge,
    );
  }

  // =====================================================================
  // INPUT THEMES - Form Elements
  // =====================================================================

  static InputDecorationTheme get _lightInputDecorationTheme {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface1,

      // Content padding
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppConstants.spaceMedium,
        vertical: AppConstants.spaceMedium,
      ),

      // Borders
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        borderSide: BorderSide(
          color: AppColors.borderDefault,
          width: 1.0,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        borderSide: BorderSide(
          color: AppColors.borderSubtle,
          width: 1.0,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        borderSide: BorderSide(
          color: AppColors.quantumCore,
          width: 2.0,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        borderSide: BorderSide(
          color: AppColors.errorCore,
          width: 1.0,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        borderSide: BorderSide(
          color: AppColors.errorCore,
          width: 2.0,
        ),
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        borderSide: BorderSide(
          color: AppColors.stateDisabled,
          width: 1.0,
        ),
      ),

      // Text styles
      hintStyle: TextStyle(
        fontSize: AppConstants.fontSizeBody,
        fontWeight: AppConstants.fontWeightRegular,
        color: AppColors.textQuaternary,
      ),

      labelStyle: TextStyle(
        fontSize: AppConstants.fontSizeBody,
        fontWeight: AppConstants.fontWeightMedium,
        color: AppColors.textSecondary,
      ),

      floatingLabelStyle: TextStyle(
        fontSize: AppConstants.fontSizeSmall,
        fontWeight: AppConstants.fontWeightMedium,
        color: AppColors.quantumCore,
      ),

      errorStyle: TextStyle(
        fontSize: AppConstants.fontSizeSmall,
        fontWeight: AppConstants.fontWeightRegular,
        color: AppColors.errorCore,
      ),

      helperStyle: TextStyle(
        fontSize: AppConstants.fontSizeSmall,
        fontWeight: AppConstants.fontWeightRegular,
        color: AppColors.textTertiary,
      ),

      // Icons
      prefixIconColor: AppColors.textTertiary,
      suffixIconColor: AppColors.textTertiary,
    );
  }

  // =====================================================================
  // SURFACE THEMES - Cards, Dialogs, Sheets
  // =====================================================================

  static CardThemeData get _lightCardTheme {
    return CardThemeData(
      color: AppColors.surface1,
      shadowColor: AppColors.shadowSmall,
      surfaceTintColor: Colors.transparent,
      elevation: AppConstants.elevation1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        side: BorderSide(
          color: AppColors.borderSubtle,
          width: 0.5,
        ),
      ),
      margin: EdgeInsets.all(AppConstants.spaceSmall),
      clipBehavior: Clip.antiAlias,
    );
  }

  static CardThemeData get _darkCardTheme {
    return _lightCardTheme.copyWith(
      color: AppColors.enterpriseDarker,
    );
  }

  static DialogThemeData get _lightDialogTheme {
    return DialogThemeData(
      backgroundColor: AppColors.modalGlass,
      surfaceTintColor: Colors.transparent,
      elevation: AppConstants.elevation4,
      shadowColor: AppColors.shadowLarge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusXLarge),
      ),
      titleTextStyle: TextStyle(
        fontSize: AppConstants.fontSizeH3,
        fontWeight: AppConstants.fontWeightSemiBold,
        color: AppColors.textPrimary,
      ),
      contentTextStyle: TextStyle(
        fontSize: AppConstants.fontSizeBody,
        fontWeight: AppConstants.fontWeightRegular,
        color: AppColors.textSecondary,
        height: 1.5,
      ),
      insetPadding: EdgeInsets.all(AppConstants.spaceLarge),
    );
  }

  static BottomSheetThemeData get _lightBottomSheetTheme {
    return BottomSheetThemeData(
      backgroundColor: AppColors.modalGlass,
      surfaceTintColor: Colors.transparent,
      elevation: AppConstants.elevation4,
      shadowColor: AppColors.shadowLarge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppConstants.radiusXLarge),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      showDragHandle: true,
      dragHandleColor: AppColors.borderMedium,
    );
  }

  // =====================================================================
  // DATA DISPLAY THEMES - Lists, Chips, Dividers
  // =====================================================================

  static ChipThemeData get _lightChipTheme {
    return ChipThemeData(
      backgroundColor: AppColors.surface2,
      selectedColor: AppColors.quantumLight,
      disabledColor: AppColors.stateDisabled,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusXLarge),
      ),
      labelStyle: TextStyle(
        fontSize: AppConstants.fontSizeSmall,
        fontWeight: AppConstants.fontWeightMedium,
        color: AppColors.textPrimary,
      ),
      secondaryLabelStyle: TextStyle(
        fontSize: AppConstants.fontSizeSmall,
        fontWeight: AppConstants.fontWeightRegular,
        color: AppColors.textSecondary,
      ),
      iconTheme: IconThemeData(
        size: AppConstants.iconSmall,
        color: AppColors.textSecondary,
      ),
    );
  }

  static ListTileThemeData get _lightListTileTheme {
    return ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppConstants.spaceMedium,
        vertical: AppConstants.spaceSmall,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
      ),
      tileColor: Colors.transparent,
      selectedTileColor: AppColors.stateSelected,
      titleTextStyle: TextStyle(
        fontSize: AppConstants.fontSizeBody,
        fontWeight: AppConstants.fontWeightMedium,
        color: AppColors.textPrimary,
      ),
      subtitleTextStyle: TextStyle(
        fontSize: AppConstants.fontSizeSmall,
        fontWeight: AppConstants.fontWeightRegular,
        color: AppColors.textSecondary,
      ),
      leadingAndTrailingTextStyle: TextStyle(
        fontSize: AppConstants.fontSizeSmall,
        fontWeight: AppConstants.fontWeightMedium,
        color: AppColors.textTertiary,
      ),
      iconColor: AppColors.textSecondary,
      textColor: AppColors.textPrimary,
    );
  }

  static DividerThemeData get _lightDividerTheme {
    return DividerThemeData(
      color: AppColors.borderSubtle,
      thickness: 1.0,
      space: AppConstants.spaceMedium,
      indent: 0,
      endIndent: 0,
    );
  }

  // =====================================================================
  // FEEDBACK THEMES - Snackbars, Progress Indicators
  // =====================================================================

  static SnackBarThemeData get _lightSnackBarTheme {
    return SnackBarThemeData(
      backgroundColor: AppColors.enterpriseBlack,
      contentTextStyle: TextStyle(
        fontSize: AppConstants.fontSizeBody,
        fontWeight: AppConstants.fontWeightRegular,
        color: AppColors.textInverse,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: AppConstants.elevation3,
      actionTextColor: AppColors.quantumLight,
      disabledActionTextColor: AppColors.textQuaternary,
      insetPadding: EdgeInsets.all(AppConstants.spaceMedium),
    );
  }

  static ProgressIndicatorThemeData get _lightProgressIndicatorTheme {
    return ProgressIndicatorThemeData(
      color: AppColors.quantumCore,
      linearTrackColor: AppColors.quantumFog,
      circularTrackColor: AppColors.quantumFog,
      refreshBackgroundColor: AppColors.surface1,
    );
  }

  // =====================================================================
  // SELECTION THEMES - Switches, Radio, Checkbox, Slider
  // =====================================================================

  static SwitchThemeData get _lightSwitchTheme {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.quantumCore;
        }
        if (states.contains(WidgetState.disabled)) {
          return AppColors.textDisabled;
        }
        return AppColors.surface1;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.quantumLight;
        }
        if (states.contains(WidgetState.disabled)) {
          return AppColors.stateDisabled;
        }
        return AppColors.borderMedium;
      }),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return AppColors.statePressed;
        }
        if (states.contains(WidgetState.hovered)) {
          return AppColors.stateHover;
        }
        if (states.contains(WidgetState.focused)) {
          return AppColors.stateFocus;
        }
        return Colors.transparent;
      }),
    );
  }

  static RadioThemeData get _lightRadioTheme {
    return RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.quantumCore;
        }
        if (states.contains(WidgetState.disabled)) {
          return AppColors.textDisabled;
        }
        return AppColors.borderMedium;
      }),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return AppColors.statePressed;
        }
        if (states.contains(WidgetState.hovered)) {
          return AppColors.stateHover;
        }
        if (states.contains(WidgetState.focused)) {
          return AppColors.stateFocus;
        }
        return Colors.transparent;
      }),
    );
  }

  static CheckboxThemeData get _lightCheckboxTheme {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.quantumCore;
        }
        if (states.contains(WidgetState.disabled)) {
          return AppColors.textDisabled;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(AppColors.textInverse),
      side: BorderSide(
        color: AppColors.borderMedium,
        width: 2.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusMicro),
      ),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return AppColors.statePressed;
        }
        if (states.contains(WidgetState.hovered)) {
          return AppColors.stateHover;
        }
        if (states.contains(WidgetState.focused)) {
          return AppColors.stateFocus;
        }
        return Colors.transparent;
      }),
    );
  }

  static SliderThemeData get _lightSliderTheme {
    return SliderThemeData(
      // Track colors
      activeTrackColor: AppColors.quantumCore,
      inactiveTrackColor: AppColors.quantumFog,
      disabledActiveTrackColor: AppColors.textDisabled,
      disabledInactiveTrackColor: AppColors.stateDisabled,

      // Thumb styling
      thumbColor: AppColors.quantumCore,
      disabledThumbColor: AppColors.textDisabled,
      thumbShape: RoundSliderThumbShape(
        enabledThumbRadius: AppConstants.spaceSmall,
      ),

      // Overlay colors
      overlayColor: AppColors.stateHover,
      overlayShape: RoundSliderOverlayShape(
        overlayRadius: AppConstants.spaceMedium,
      ),

      // Value indicator
      valueIndicatorColor: AppColors.quantumCore,
      valueIndicatorTextStyle: TextStyle(
        fontSize: AppConstants.fontSizeSmall,
        fontWeight: AppConstants.fontWeightMedium,
        color: AppColors.textInverse,
      ),

      // Track sizing
      trackHeight: 4.0,
      trackShape: RoundedRectSliderTrackShape(),
    );
  }

  // =====================================================================
  // TAB THEMES - Tab Navigation
  // =====================================================================

  static TabBarThemeData get _lightTabBarTheme {
    return TabBarThemeData(
      labelColor: AppColors.quantumCore,
      unselectedLabelColor: AppColors.textTertiary,
      labelStyle: TextStyle(
        fontSize: AppConstants.fontSizeBody,
        fontWeight: AppConstants.fontWeightSemiBold,
        letterSpacing: 0.1,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: AppConstants.fontSizeBody,
        fontWeight: AppConstants.fontWeightRegular,
        letterSpacing: 0.1,
      ),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: AppColors.quantumCore,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(AppConstants.radiusMicro),
      ),
      indicatorColor: AppColors.quantumCore,
      indicatorSize: TabBarIndicatorSize.label,
      dividerColor: AppColors.borderSubtle,
      dividerHeight: 1.0,
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return AppColors.statePressed;
        }
        if (states.contains(WidgetState.hovered)) {
          return AppColors.stateHover;
        }
        return Colors.transparent;
      }),
      splashFactory: NoSplash.splashFactory,
      tabAlignment: TabAlignment.fill,
    );
  }

  // =====================================================================
  // UTILITY METHODS - Theme Helpers
  // =====================================================================

  /// Returns appropriate theme based on system settings
  static ThemeData getAdaptiveTheme(Brightness brightness) {
    switch (brightness) {
      case Brightness.light:
        return lightTheme;
      case Brightness.dark:
        return darkTheme;
    }
  }

  /// Returns text color that contrasts well with given background
  static Color getContrastingTextColor(Color backgroundColor) {
    return AppColors.getTextColorForBackground(backgroundColor);
  }

  /// Creates a custom button style with glassmorphism effect
  static ButtonStyle getGlassButtonStyle({
    Color? backgroundColor,
    Color? foregroundColor,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? AppColors.cardGlass,
      foregroundColor: foregroundColor ?? AppColors.textPrimary,
      elevation: AppConstants.elevation2,
      shadowColor: AppColors.shadowBrand,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppConstants.radiusMedium,
        ),
        side: BorderSide(
          color: AppColors.borderSubtle,
          width: 1.0,
        ),
      ),
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: AppConstants.spaceMedium,
            vertical: AppConstants.spaceSmall,
          ),
      overlayColor: AppColors.stateHover,
    );
  }

  /// Creates a custom card decoration with glassmorphism
  static BoxDecoration getGlassCardDecoration({
    Color? backgroundColor,
    double? borderRadius,
    bool hasBorder = true,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? AppColors.cardGlass,
      borderRadius: BorderRadius.circular(
        borderRadius ?? AppConstants.radiusLarge,
      ),
      border: hasBorder
          ? Border.all(
              color: AppColors.borderSubtle,
              width: 1.0,
            )
          : null,
      boxShadow: [
        BoxShadow(
          color: AppColors.shadowSmall,
          offset: Offset(0, AppConstants.elevation2),
          blurRadius: AppConstants.spaceSmall,
          spreadRadius: 0,
        ),
      ],
    );
  }

  /// Creates responsive padding based on screen size
  static EdgeInsetsGeometry getResponsivePadding(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (AppConstants.isMobile(screenWidth)) {
      return EdgeInsets.all(AppConstants.spaceMedium);
    } else if (AppConstants.isTablet(screenWidth)) {
      return EdgeInsets.all(AppConstants.spaceLarge);
    } else {
      return EdgeInsets.all(AppConstants.spaceXLarge);
    }
  }

  /// Creates adaptive elevation based on platform
  static double getAdaptiveElevation(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return AppConstants.elevation1; // Lower elevation for iOS
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return AppConstants.elevation2; // Standard Material elevation
    }
  }

  /// Creates a theme extension for custom properties
  static T? getThemeExtension<T extends ThemeExtension<T>>(
    BuildContext context,
  ) {
    return Theme.of(context).extension<T>();
  }

  /// Validates color contrast for accessibility
  static bool validateColorContrast(Color foreground, Color background) {
    return AppColors.hasAccessibleContrast(foreground, background);
  }

  /// Creates a custom text theme with brand typography
  static TextTheme createBrandTextTheme({
    String? fontFamily,
    Color? primaryColor,
    Color? secondaryColor,
  }) {
    return _textTheme.copyWith(
      displayLarge: _textTheme.displayLarge?.copyWith(
        fontFamily: fontFamily,
        color: primaryColor,
      ),
      headlineLarge: _textTheme.headlineLarge?.copyWith(
        fontFamily: fontFamily,
        color: primaryColor,
      ),
      bodyLarge: _textTheme.bodyLarge?.copyWith(
        fontFamily: fontFamily,
        color: secondaryColor,
      ),
      // Add more overrides as needed
    );
  }
}
