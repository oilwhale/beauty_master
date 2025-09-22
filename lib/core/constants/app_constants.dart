/// Константы приложения BeautyMaster
class AppConstants {
  AppConstants._();

  // Информация о приложении
  static const String appName = 'BeautyMaster';
  static const String appVersion = '1.0.0';
  static const String appBuild = '1';

  // База данных
  static const String databaseName = 'beauty_master.db';
  static const int databaseVersion = 1;

  // Размеры и отступы
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;

  // Радиусы скругления
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;
  static const double radiusXLarge = 24.0;

  // Размеры иконок
  static const double iconSmall = 16.0;
  static const double iconMedium = 24.0;
  static const double iconLarge = 32.0;
  static const double iconXLarge = 48.0;

  // Размеры аватаров
  static const double avatarSmall = 32.0;
  static const double avatarMedium = 48.0;
  static const double avatarLarge = 64.0;
  static const double avatarXLarge = 96.0;

  // Анимации
  static const Duration animationFast = Duration(milliseconds: 150);
  static const Duration animationMedium = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  // Glassmorphism эффекты
  static const double glassBlur = 20.0;
  static const double glassBlurLight = 10.0;
  static const double glassBlurHeavy = 40.0;
  static const double glassOpacity = 0.1;
  static const double glassOpacityLight = 0.05;
  static const double glassOpacityHeavy = 0.2;
  static const double glassBorderOpacity = 0.2;
  static const double glassBorderOpacityLight = 0.1;
  static const double glassBorderOpacityHeavy = 0.3;

  // Тени
  static const double shadowElevationLow = 2.0;
  static const double shadowElevationMedium = 4.0;
  static const double shadowElevationHigh = 8.0;
  static const double shadowElevationXHigh = 16.0;

  // Glassmorphism специфичные константы
  static const double glassBorderWidth = 1.0;
  static const double glassBorderWidthThick = 2.0;
  static const double glassRadius = 16.0;
  static const double glassRadiusSmall = 8.0;
  static const double glassRadiusLarge = 24.0;
  static const double glassRadiusXLarge = 32.0;

  // Высота элементов
  static const double buttonHeight = 48.0;
  static const double inputHeight = 56.0;
  static const double appBarHeight = 56.0;
  static const double bottomNavHeight = 60.0;

  // Ключи для SharedPreferences
  static const String keyThemeMode = 'theme_mode';
  static const String keyUserName = 'user_name';
  static const String keyUserPhoto = 'user_photo';
  static const String keyFirstLaunch = 'first_launch';
  static const String keyWorkingHours = 'working_hours';

  // Статусы записей
  static const String appointmentStatusScheduled = 'scheduled';
  static const String appointmentStatusConfirmed = 'confirmed';
  static const String appointmentStatusCompleted = 'completed';
  static const String appointmentStatusCancelled = 'cancelled';

  // Статусы клиентов
  static const String clientStatusNew = 'new';
  static const String clientStatusRegular = 'regular';
  static const String clientStatusVIP = 'vip';

  // Типы транзакций
  static const String transactionTypeIncome = 'income';
  static const String transactionTypeExpense = 'expense';

  // Способы оплаты
  static const String paymentMethodCash = 'cash';
  static const String paymentMethodCard = 'card';
  static const String paymentMethodTransfer = 'transfer';

  // Типы фотографий
  static const String photoTypeBefore = 'before';
  static const String photoTypeAfter = 'after';
  static const String photoTypeProcess = 'process';

  // Валидация
  static const int phoneMinLength = 10;
  static const int phoneMaxLength = 15;
  static const int nameMinLength = 2;
  static const int nameMaxLength = 50;
  static const double priceMin = 0.0;
  static const double priceMax = 999999.99;

  // Пагинация
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Форматы дат
  static const String dateFormat = 'dd.MM.yyyy';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'dd.MM.yyyy HH:mm';
  static const String monthYearFormat = 'MMMM yyyy';

  // Рабочие часы по умолчанию
  static const String defaultStartTime = '09:00';
  static const String defaultEndTime = '18:00';
  static const List<int> defaultWorkingDays = [1, 2, 3, 4, 5]; // Пн-Пт

  // Уведомления
  static const Duration reminderBefore = Duration(hours: 1);
  static const Duration birthdayReminderBefore = Duration(days: 7);
}
