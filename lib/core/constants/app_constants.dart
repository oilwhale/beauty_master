import 'package:flutter/material.dart';

/// Enterprise Design System Constants BeautyMaster 2025
/// Философия: Conscious Minimalism + Mathematical Precision + Accessibility First
/// Основа: 8pt Grid System + Perfect Fourth Typography + Intelligent Spacing
class AppConstants {
  AppConstants._();

  // =====================================================================
  // APP METADATA - Application Information
  // =====================================================================

  static const String appName = 'BeautyMaster Enterprise';
  static const String appVersion = '2.0.0';
  static const String appBuild = '2025.01';
  static const String appTagline = 'Professional Beauty CRM';

  // =====================================================================
  // 8PT GRID SYSTEM - Mathematical Foundation (Base: 8px)
  // =====================================================================

  /// Микро-единица для fine-tuning (4px)
  static const double spaceMicro = 4.0;

  /// Базовая единица всей системы (8px)
  static const double spaceBase = 8.0;

  /// Малый отступ для tight spacing (12px)
  static const double spaceSmall = 12.0;

  /// Стандартный отступ для большинства элементов (16px)
  static const double spaceMedium = 16.0;

  /// Большой отступ для section spacing (24px)
  static const double spaceLarge = 24.0;

  /// Очень большой отступ для major sections (32px)
  static const double spaceXLarge = 32.0;

  /// Максимальный отступ для page-level spacing (48px)
  static const double spaceXXLarge = 48.0;

  /// Гигантский отступ для hero sections (64px)
  static const double spaceGigantic = 64.0;

  // =====================================================================
  // PERFECT FOURTH TYPOGRAPHY SCALE (Ratio: 1.333)
  // =====================================================================

  /// Display Text - Hero headlines, landing pages (48px)
  static const double fontSizeDisplay = 48.0;
  static const double lineHeightDisplay = 52.0;

  /// H1 - Page titles, main headings (36px)
  static const double fontSizeH1 = 36.0;
  static const double lineHeightH1 = 40.0;

  /// H2 - Section titles, important headings (27px)
  static const double fontSizeH2 = 27.0;
  static const double lineHeightH2 = 32.0;

  /// H3 - Subsection titles, card headers (20px)
  static const double fontSizeH3 = 20.0;
  static const double lineHeightH3 = 28.0;

  /// H4 - Small headings, list headers (16px)
  static const double fontSizeH4 = 16.0;
  static const double lineHeightH4 = 24.0;

  /// Body Large - Primary text, important content (16px)
  static const double fontSizeBodyLarge = 16.0;
  static const double lineHeightBodyLarge = 24.0;

  /// Body - Standard text, most readable size (14px)
  static const double fontSizeBody = 14.0;
  static const double lineHeightBody = 20.0;

  /// Small - Secondary text, captions (12px)
  static const double fontSizeSmall = 12.0;
  static const double lineHeightSmall = 16.0;

  /// Micro - Labels, metadata, fine print (10px)
  static const double fontSizeMicro = 10.0;
  static const double lineHeightMicro = 12.0;

  // =====================================================================
  // FONT WEIGHTS - Semantic Weight System
  // =====================================================================

  /// Light weight для subtle information
  static const FontWeight fontWeightLight = FontWeight.w300;

  /// Regular weight для body text
  static const FontWeight fontWeightRegular = FontWeight.w400;

  /// Medium weight для emphasized text
  static const FontWeight fontWeightMedium = FontWeight.w500;

  /// SemiBold weight для titles и headers
  static const FontWeight fontWeightSemiBold = FontWeight.w600;

  /// Bold weight для strong emphasis
  static const FontWeight fontWeightBold = FontWeight.w700;

  // =====================================================================
  // BORDER RADIUS SYSTEM - Organic Roundness (8pt based)
  // =====================================================================

  /// Micro radius для small elements (4px)
  static const double radiusMicro = 4.0;

  /// Small radius для buttons, inputs (8px)
  static const double radiusSmall = 8.0;

  /// Medium radius для cards (12px)
  static const double radiusMedium = 12.0;

  /// Large radius для panels (16px)
  static const double radiusLarge = 16.0;

  /// XLarge radius для modals (20px)
  static const double radiusXLarge = 20.0;

  /// XXLarge radius для hero elements (24px)
  static const double radiusXXLarge = 24.0;

  /// Circular radius для avatars и floating buttons
  static const double radiusCircular = 999.0;

  // =====================================================================
  // ELEVATION SYSTEM - Material Design 3 + Glass
  // =====================================================================

  /// Level 0 - Surface level, no elevation
  static const double elevation0 = 0.0;

  /// Level 1 - Subtle lift для cards (1dp)
  static const double elevation1 = 1.0;

  /// Level 2 - Standard elevation для floating elements (2dp)
  static const double elevation2 = 2.0;

  /// Level 3 - Medium elevation для important elements (4dp)
  static const double elevation3 = 4.0;

  /// Level 4 - High elevation для modal content (8dp)
  static const double elevation4 = 8.0;

  /// Level 5 - Maximum elevation для critical alerts (12dp)
  static const double elevation5 = 12.0;

  // =====================================================================
  // COMPONENT SIZES - Consistent Sizing System
  // =====================================================================

  /// Icon размеры based on 8pt grid
  static const double iconMicro = 12.0; // 1.5 * base
  static const double iconSmall = 16.0; // 2 * base
  static const double iconMedium = 24.0; // 3 * base
  static const double iconLarge = 32.0; // 4 * base
  static const double iconXLarge = 48.0; // 6 * base

  /// Avatar размеры for profile pictures
  static const double avatarSmall = 32.0; // 4 * base
  static const double avatarMedium = 48.0; // 6 * base
  static const double avatarLarge = 64.0; // 8 * base
  static const double avatarXLarge = 96.0; // 12 * base
  static const double avatarHero = 128.0; // 16 * base

  /// Button heights для consistent touch targets
  static const double buttonHeightSmall = 32.0; // 4 * base
  static const double buttonHeightMedium = 40.0; // 5 * base
  static const double buttonHeightLarge = 48.0; // 6 * base
  static const double buttonHeightXLarge = 56.0; // 7 * base

  /// Input field heights
  static const double inputHeightSmall = 40.0; // 5 * base
  static const double inputHeightMedium = 48.0; // 6 * base
  static const double inputHeightLarge = 56.0; // 7 * base

  /// Navigation component heights
  static const double appBarHeight = 56.0; // 7 * base
  static const double bottomNavHeight = 64.0; // 8 * base
  static const double tabBarHeight = 48.0; // 6 * base
  static const double toolbarHeight = 56.0; // 7 * base

  // =====================================================================
  // ANIMATION SYSTEM - Performance Optimized Timing
  // =====================================================================

  /// Micro animations для immediate feedback (100ms)
  static const Duration animationMicro = Duration(milliseconds: 100);

  /// Fast animations для quick transitions (150ms)
  static const Duration animationFast = Duration(milliseconds: 150);

  /// Standard animations для most interactions (200ms)
  static const Duration animationStandard = Duration(milliseconds: 200);

  /// Medium animations для page transitions (300ms)
  static const Duration animationMedium = Duration(milliseconds: 300);

  /// Slow animations для complex transitions (400ms)
  static const Duration animationSlow = Duration(milliseconds: 400);

  /// Complex animations для hero transitions (500ms)
  static const Duration animationComplex = Duration(milliseconds: 500);

  // =====================================================================
  // GLASSMORPHISM CONSTANTS - Strategic Glass Properties
  // =====================================================================

  /// Navigation blur radius для navbar glass effect
  static const double glassBlurNavigation = 20.0;

  /// Modal blur radius для dialog glass effect
  static const double glassBlurModal = 24.0;

  /// Card blur radius для subtle glass cards
  static const double glassBlurCard = 16.0;

  /// Floating blur radius для FAB glass effect
  static const double glassBlurFloating = 16.0;

  /// Sidebar blur radius для drawer glass effect
  static const double glassBlurSidebar = 20.0;

  /// Glass blur для navigation
  static const double glassBlur = 20.0;

  /// Glass radius для navigation
  static const double glassRadius = 12.0;

  /// Glass opacity для navigation elements
  static const double glassOpacityNavigation = 0.8;

  /// Glass opacity для modal backgrounds
  static const double glassOpacityModal = 0.95;

  /// Glass opacity для card backgrounds
  static const double glassOpacityCard = 0.9;

  // =====================================================================
  // BREAKPOINTS - Responsive Design System
  // =====================================================================

  /// Mobile breakpoint (до 600px)
  static const double breakpointMobile = 600.0;

  /// Tablet breakpoint (600px - 1024px)
  static const double breakpointTablet = 1024.0;

  /// Desktop breakpoint (1024px - 1440px)
  static const double breakpointDesktop = 1440.0;

  /// Large desktop breakpoint (свыше 1440px)
  static const double breakpointLargeDesktop = 1920.0;

  // =====================================================================
  // CONTENT CONSTRAINTS - Readable Line Lengths
  // =====================================================================

  /// Максимальная ширина для читаемого текста (65 символов)
  static const double maxContentWidth = 640.0;

  /// Максимальная ширина для форм
  static const double maxFormWidth = 480.0;

  /// Максимальная ширина для карточек
  static const double maxCardWidth = 400.0;

  // =====================================================================
  // DATABASE & STORAGE - Technical Constants
  // =====================================================================

  static const String databaseName = 'beauty_master_enterprise.db';
  static const int databaseVersion = 2;

  // SharedPreferences keys
  static const String keyThemeMode = 'theme_mode';
  static const String keyUserName = 'user_name';
  static const String keyUserPhoto = 'user_photo';
  static const String keyFirstLaunch = 'first_launch';
  static const String keyWorkingHours = 'working_hours';
  static const String keyOnboardingCompleted = 'onboarding_completed';

  // =====================================================================
  // BUSINESS LOGIC CONSTANTS - Domain Specific
  // =====================================================================

  /// Client status types
  static const String clientStatusNew = 'new';
  static const String clientStatusRegular = 'regular';
  static const String clientStatusVIP = 'vip';

  /// Appointment status types
  static const String appointmentStatusScheduled = 'scheduled';
  static const String appointmentStatusConfirmed = 'confirmed';
  static const String appointmentStatusInProgress = 'in_progress';
  static const String appointmentStatusCompleted = 'completed';
  static const String appointmentStatusCancelled = 'cancelled';
  static const String appointmentStatusNoShow = 'no_show';

  /// Transaction types
  static const String transactionTypeIncome = 'income';
  static const String transactionTypeExpense = 'expense';
  static const String transactionTypeRefund = 'refund';

  /// Payment methods
  static const String paymentMethodCash = 'cash';
  static const String paymentMethodCard = 'card';
  static const String paymentMethodTransfer = 'transfer';
  static const String paymentMethodCrypto = 'crypto';

  /// Photo types for work gallery
  static const String photoTypeBefore = 'before';
  static const String photoTypeAfter = 'after';
  static const String photoTypeProcess = 'process';
  static const String photoTypeProfile = 'profile';

  // =====================================================================
  // VALIDATION RULES - Data Integrity
  // =====================================================================

  /// Phone number constraints
  static const int phoneMinLength = 10;
  static const int phoneMaxLength = 15;

  /// Name constraints
  static const int nameMinLength = 2;
  static const int nameMaxLength = 50;

  /// Price constraints
  static const double priceMin = 0.0;
  static const double priceMax = 999999.99;

  /// Note constraints
  static const int notesMaxLength = 1000;

  /// Service duration constraints (в минутах)
  static const int serviceDurationMin = 15;
  static const int serviceDurationMax = 480; // 8 часов

  // =====================================================================
  // PAGINATION & PERFORMANCE - Data Loading
  // =====================================================================

  /// Default page size для lists
  static const int defaultPageSize = 20;

  /// Maximum page size для prevent performance issues
  static const int maxPageSize = 100;

  /// Search debounce delay для live search
  static const Duration searchDebounceDelay = Duration(milliseconds: 300);

  /// Auto-save delay для forms
  static const Duration autoSaveDelay = Duration(milliseconds: 2000);

  // =====================================================================
  // DATE & TIME FORMATS - Localization Ready
  // =====================================================================

  static const String dateFormat = 'dd.MM.yyyy';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'dd.MM.yyyy HH:mm';
  static const String monthYearFormat = 'MMMM yyyy';
  static const String dayMonthFormat = 'dd MMMM';

  // =====================================================================
  // WORKING HOURS & SCHEDULE - Business Logic
  // =====================================================================

  /// Default working hours
  static const String defaultStartTime = '09:00';
  static const String defaultEndTime = '18:00';
  static const List<int> defaultWorkingDays = [1, 2, 3, 4, 5]; // Пн-Пт

  /// Break time settings
  static const String defaultLunchStart = '13:00';
  static const String defaultLunchEnd = '14:00';

  /// Appointment settings
  static const int defaultAppointmentDuration = 60; // минут
  static const int minAppointmentDuration = 15; // минут
  static const int maxAppointmentDuration = 480; // 8 часов

  // =====================================================================
  // NOTIFICATION & REMINDER SYSTEM
  // =====================================================================

  /// Reminder timings
  static const Duration reminderBefore1Hour = Duration(hours: 1);
  static const Duration reminderBefore24Hours = Duration(hours: 24);
  static const Duration birthdayReminderBefore = Duration(days: 7);

  /// Notification categories
  static const String notificationCategoryAppointment = 'appointment';
  static const String notificationCategoryBirthday = 'birthday';
  static const String notificationCategoryPromo = 'promo';
  static const String notificationCategorySystem = 'system';

  // =====================================================================
  // UTILITY METHODS - Helper Functions
  // =====================================================================

  /// Проверяет является ли экран mobile размером
  static bool isMobile(double width) => width < breakpointMobile;

  /// Проверяет является ли экран tablet размером
  static bool isTablet(double width) =>
      width >= breakpointMobile && width < breakpointTablet;

  /// Проверяет является ли экран desktop размером
  static bool isDesktop(double width) => width >= breakpointTablet;

  /// Возвращает адаптивный размер based on screen width
  static double getAdaptiveSize({
    required double mobile,
    required double tablet,
    required double desktop,
    required double screenWidth,
  }) {
    if (isMobile(screenWidth)) return mobile;
    if (isTablet(screenWidth)) return tablet;
    return desktop;
  }

  /// Возвращает количество колонок для grid based on screen width
  static int getGridColumns(double screenWidth) {
    if (isMobile(screenWidth)) return 1;
    if (isTablet(screenWidth)) return 2;
    return 3;
  }
}
