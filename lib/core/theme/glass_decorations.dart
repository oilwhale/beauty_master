import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

/// Декорации для Glassmorphism эффектов
class GlassDecorations {
  GlassDecorations._();

  /// Базовая glass декорация
  static BoxDecoration get glassBase => BoxDecoration(
    color: AppColors.glassBackground,
    borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
    border: Border.all(color: AppColors.glassBorder, width: 1),
  );

  /// Glass декорация с тенью
  static BoxDecoration get glassWithShadow => BoxDecoration(
    color: AppColors.glassBackground,
    borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
    border: Border.all(color: AppColors.glassBorder, width: 1),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowLight,
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );

  /// Glass декорация для карточек
  static BoxDecoration get glassCard => BoxDecoration(
    gradient: AppColors.glassGradient,
    borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
    border: Border.all(color: AppColors.glassBorder, width: 1),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowLight,
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  );

  /// Glass декорация для кнопок
  static BoxDecoration get glassButton => BoxDecoration(
    gradient: AppColors.primaryGradient,
    borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
    boxShadow: [
      BoxShadow(
        color: AppColors.primaryMain.withOpacity(0.3),
        blurRadius: 12,
        offset: const Offset(0, 4),
      ),
    ],
  );

  /// Glass декорация для navigation bar
  static BoxDecoration get glassNavBar => BoxDecoration(
    color: AppColors.glassBackground,
    border: Border(top: BorderSide(color: AppColors.glassBorder, width: 1)),
  );

  /// Glass декорация для app bar
  static BoxDecoration get glassAppBar =>
      const BoxDecoration(color: Colors.transparent);

  /// Glass декорация для диалогов
  static BoxDecoration get glassDialog => BoxDecoration(
    color: AppColors.glassBackground,
    borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
    border: Border.all(color: AppColors.glassBorder, width: 1),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowMedium,
        blurRadius: 20,
        offset: const Offset(0, 8),
      ),
    ],
  );

  /// Glass декорация для bottom sheet
  static BoxDecoration get glassBottomSheet => BoxDecoration(
    color: AppColors.glassBackground,
    borderRadius: const BorderRadius.vertical(
      top: Radius.circular(AppConstants.radiusLarge),
    ),
    border: Border.all(color: AppColors.glassBorder, width: 1),
  );

  /// Glass декорация для floating элементов
  static BoxDecoration get glassFloating => BoxDecoration(
    gradient: AppColors.glassGradient,
    borderRadius: BorderRadius.circular(AppConstants.radiusXLarge),
    border: Border.all(color: AppColors.glassBorder, width: 1),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowMedium,
        blurRadius: 16,
        offset: const Offset(0, 6),
      ),
    ],
  );

  /// Glass декорация для выделенных элементов
  static BoxDecoration get glassHighlight => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppColors.primaryMain.withOpacity(0.1),
        AppColors.secondaryMain.withOpacity(0.1),
      ],
    ),
    borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
    border: Border.all(color: AppColors.primaryMain.withOpacity(0.3), width: 1),
  );

  /// Glass декорация для input полей
  static BoxDecoration get glassInput => BoxDecoration(
    color: AppColors.glassBackground,
    borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
    border: Border.all(color: AppColors.glassBorder, width: 1),
  );

  /// Glass декорация для active состояния
  static BoxDecoration get glassActive => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppColors.primaryMain.withOpacity(0.2),
        AppColors.primaryLight.withOpacity(0.1),
      ],
    ),
    borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
    border: Border.all(
      color: AppColors.primaryMain.withOpacity(0.5),
      width: 1.5,
    ),
  );

  /// Кастомная glass декорация
  static BoxDecoration customGlass({
    Color? backgroundColor,
    Color? borderColor,
    double borderWidth = 1,
    double borderRadius = AppConstants.radiusLarge,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
  }) {
    return BoxDecoration(
      color: gradient == null
          ? (backgroundColor ?? AppColors.glassBackground)
          : null,
      gradient: gradient,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: borderColor ?? AppColors.glassBorder,
        width: borderWidth,
      ),
      boxShadow: boxShadow,
    );
  }

  /// Glass декорация с анимацией hover
  static BoxDecoration glassHover({bool isHovered = false}) {
    return BoxDecoration(
      color: isHovered
          ? AppColors.glassBackground.withOpacity(0.15)
          : AppColors.glassBackground,
      borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
      border: Border.all(
        color: isHovered
            ? AppColors.primaryMain.withOpacity(0.3)
            : AppColors.glassBorder,
        width: isHovered ? 1.5 : 1,
      ),
      boxShadow: isHovered
          ? [
              BoxShadow(
                color: AppColors.primaryMain.withOpacity(0.1),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ]
          : null,
    );
  }

  /// Glass декорация для статусов
  static BoxDecoration glassStatus(Color statusColor) {
    return BoxDecoration(
      color: statusColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
      border: Border.all(color: statusColor.withOpacity(0.3), width: 1),
    );
  }

  /// Glass декорация для градиентного фона
  static BoxDecoration get glassGradientBackground => const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFFF8F9FA), Color(0xFFE9ECEF)],
    ),
  );

  /// Dark theme glass декорации
  static BoxDecoration get glassBaseDark => BoxDecoration(
    color: const Color(0x1AFFFFFF),
    borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
    border: Border.all(color: const Color(0x33FFFFFF), width: 1),
  );

  static BoxDecoration get glassCardDark => BoxDecoration(
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0x1AFFFFFF), Color(0x0DFFFFFF)],
    ),
    borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
    border: Border.all(color: const Color(0x33FFFFFF), width: 1),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  );
}

/// Виджет для создания blur эффекта
class GlassBlur extends StatelessWidget {
  const GlassBlur({
    super.key,
    required this.child,
    this.blur = AppConstants.glassBlur,
  });

  final Widget child;
  final double blur;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: child,
      ),
    );
  }
}

/// Виджет для glass контейнера
class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    required this.child,
    this.decoration,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.blur = AppConstants.glassBlur,
    this.borderRadius = AppConstants.radiusLarge,
  });

  final Widget child;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final double blur;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: decoration ?? GlassDecorations.glassCard,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Padding(
            padding:
                padding ?? const EdgeInsets.all(AppConstants.paddingMedium),
            child: child,
          ),
        ),
      ),
    );
  }
}
