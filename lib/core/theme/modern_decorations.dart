import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

/// Enterprise-уровень декорации BeautyMaster 2025
/// Стиль: Elegant Minimalism + Glassmorphism
class ModernDecorations {
  ModernDecorations._();

  // ===== GLASSMORPHISM BASE - базовые glassmorphism элементы =====

  /// Базовая glassmorphism декорация
  static BoxDecoration get glassBase => BoxDecoration(
        color: AppColors.glassBackground,
        borderRadius: BorderRadius.circular(AppConstants.glassRadius),
        border: Border.all(
          color: AppColors.glassBorder,
          width: AppConstants.glassBorderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.glassShadow,
            offset: const Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      );

  /// Легкая glassmorphism декорация
  static BoxDecoration get glassLight => BoxDecoration(
        color: AppColors.glassBackground.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppConstants.glassRadiusSmall),
        border: Border.all(
          color: AppColors.glassBorder.withValues(alpha: 0.5),
          width: AppConstants.glassBorderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.glassShadow,
            offset: const Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      );

  /// Тяжелая glassmorphism декорация
  static BoxDecoration get glassHeavy => BoxDecoration(
        color: AppColors.glassBackground.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(AppConstants.glassRadiusLarge),
        border: Border.all(
          color: AppColors.glassBorder,
          width: AppConstants.glassBorderWidthThick,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.glassShadow,
            offset: const Offset(0, 8),
            blurRadius: 40,
            spreadRadius: 0,
          ),
        ],
      );

  // ===== ELEGANT SHAPES - элегантные формы =====

  /// Элегантная карточка
  static BoxDecoration get elegantCard => BoxDecoration(
        color: AppColors.surfaceMain,
        borderRadius: BorderRadius.circular(AppConstants.glassRadius),
        border: Border.all(
          color: AppColors.glassBorder,
          width: AppConstants.glassBorderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowSubtle,
            offset: const Offset(0, 2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      );

  /// Элегантная кнопка
  static BoxDecoration get elegantButton => BoxDecoration(
        gradient: AppColors.elegantAccent,
        borderRadius: BorderRadius.circular(AppConstants.glassRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.accentMain.withValues(alpha: 0.3),
            offset: const Offset(0, 4),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      );

  /// Элегантное input поле
  static BoxDecoration get elegantInput => BoxDecoration(
        color: AppColors.surfaceMain,
        borderRadius: BorderRadius.circular(AppConstants.glassRadius),
        border: Border.all(
          color: AppColors.glassBorder,
          width: AppConstants.glassBorderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowSubtle,
            offset: const Offset(0, 1),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      );

  // ===== GLASSMORPHISM SHAPES - glassmorphism формы =====

  /// Glassmorphism карточка клиента
  static BoxDecoration get glassClientCard => BoxDecoration(
        color: AppColors.glassBackground,
        borderRadius: BorderRadius.circular(AppConstants.glassRadius),
        border: Border.all(
          color: AppColors.glassBorder,
          width: AppConstants.glassBorderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.glassShadow,
            offset: const Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      );

  /// Glassmorphism форма для аватара
  static BoxDecoration get glassAvatar => BoxDecoration(
        color: AppColors.glassBackground,
        borderRadius: BorderRadius.circular(AppConstants.glassRadiusLarge),
        border: Border.all(
          color: AppColors.glassBorder,
          width: AppConstants.glassBorderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.glassShadow,
            offset: const Offset(0, 2),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      );

  // ===== FLOATING ELEMENTS - плавающие элементы =====

  /// Floating action button
  static BoxDecoration get floatingButton => BoxDecoration(
        gradient: AppColors.elegantAccent,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppColors.accentMain.withValues(alpha: 0.3),
            offset: const Offset(0, 8),
            blurRadius: 24,
            spreadRadius: 0,
          ),
        ],
      );

  /// Floating card
  static BoxDecoration get floatingCard => BoxDecoration(
        color: AppColors.glassBackground,
        borderRadius: BorderRadius.circular(AppConstants.glassRadius),
        border: Border.all(
          color: AppColors.glassBorder,
          width: AppConstants.glassBorderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.glassShadow,
            offset: const Offset(0, 8),
            blurRadius: 32,
            spreadRadius: 0,
          ),
        ],
      );

  // ===== NAVIGATION - навигация =====

  /// Bottom navigation bar
  static BoxDecoration get bottomNavigation => BoxDecoration(
        color: AppColors.glassBackground,
        border: Border(
          top: BorderSide(
            color: AppColors.glassBorder,
            width: AppConstants.glassBorderWidth,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.glassShadow,
            offset: const Offset(0, -4),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      );

  /// Navigation item active
  static BoxDecoration get navItemActive => BoxDecoration(
        gradient: AppColors.elegantAccent,
        borderRadius: BorderRadius.circular(AppConstants.glassRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.accentMain.withValues(alpha: 0.3),
            offset: const Offset(0, 4),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      );

  /// Navigation item inactive
  static BoxDecoration get navItemInactive => BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(AppConstants.glassRadius),
      );

  // ===== STATUS ELEMENTS - статусные элементы =====

  /// Success badge
  static BoxDecoration successBadge({double radius = 12}) => BoxDecoration(
        color: AppColors.successAccent,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: AppColors.success.withValues(alpha: 0.3),
            offset: const Offset(0, 2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      );

  /// Warning badge
  static BoxDecoration warningBadge({double radius = 12}) => BoxDecoration(
        color: AppColors.warningAccent,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: AppColors.warning.withValues(alpha: 0.3),
            offset: const Offset(0, 2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      );

  /// Error badge
  static BoxDecoration errorBadge({double radius = 12}) => BoxDecoration(
        color: AppColors.errorAccent,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: AppColors.error.withValues(alpha: 0.3),
            offset: const Offset(0, 2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      );

  // ===== INTERACTIVE STATES - интерактивные состояния =====

  /// Hover effect
  static BoxDecoration hover(BoxDecoration base) => base.copyWith(
        boxShadow: [
          ...base.boxShadow ?? [],
          BoxShadow(
            color: AppColors.hover,
            offset: const Offset(0, 2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      );

  /// Pressed effect
  static BoxDecoration pressed(BoxDecoration base) => base.copyWith(
        boxShadow: [
          BoxShadow(
            color: AppColors.pressed,
            offset: const Offset(0, 1),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      );

  /// Focused effect
  static BoxDecoration focused(BoxDecoration base) => base.copyWith(
        border: Border.all(
          color: AppColors.accentMain.withValues(alpha: 0.6),
          width: AppConstants.glassBorderWidthThick,
        ),
        boxShadow: [
          ...base.boxShadow ?? [],
          BoxShadow(
            color: AppColors.focused,
            offset: const Offset(0, 0),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      );

  // ===== CUSTOM DECORATIONS - кастомные декорации =====

  /// Кастомная glassmorphism декорация
  static BoxDecoration customGlass({
    Color? color,
    double borderRadius = AppConstants.glassRadius,
    double opacity = 0.1,
    double blurIntensity = 1.0,
  }) {
    return BoxDecoration(
      color: (color ?? AppColors.glassBackground).withValues(alpha: opacity),
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: AppColors.glassBorder,
        width: AppConstants.glassBorderWidth,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.glassShadow,
          offset: const Offset(0, 4),
          blurRadius: 20 * blurIntensity,
          spreadRadius: 0,
        ),
      ],
    );
  }

  /// Кастомная элегантная декорация
  static BoxDecoration customElegant({
    Color? color,
    double borderRadius = AppConstants.glassRadius,
    Gradient? gradient,
    double shadowIntensity = 1.0,
  }) {
    return BoxDecoration(
      color: gradient == null ? (color ?? AppColors.surfaceMain) : null,
      gradient: gradient,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: AppColors.glassBorder,
        width: AppConstants.glassBorderWidth,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.shadowSubtle,
          offset: const Offset(0, 2),
          blurRadius: 8 * shadowIntensity,
          spreadRadius: 0,
        ),
      ],
    );
  }

  // ===== GLASS DECORATIONS - стеклянные эффекты (для совместимости) =====

  /// Glass навигационная панель
  static BoxDecoration get glassNavBar => bottomNavigation;

  /// Glass базовая декорация
  static BoxDecoration get glassBaseDecoration => glassBase;

  /// Glass input поле
  static BoxDecoration get glassInput => elegantInput;

  /// Glass карточка
  static BoxDecoration get glassCard => elegantCard;
}

/// Алиас для совместимости с существующим кодом
typedef GlassDecorations = ModernDecorations;

/// Виджет для создания glassmorphism контейнера
class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    required this.child,
    this.decoration,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.borderRadius = AppConstants.glassRadius,
    this.opacity = 0.1,
    this.blurIntensity = 1.0,
  });

  final Widget child;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final double borderRadius;
  final double opacity;
  final double blurIntensity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: decoration ??
          ModernDecorations.customGlass(
            borderRadius: borderRadius,
            opacity: opacity,
            blurIntensity: blurIntensity,
          ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(AppConstants.paddingMedium),
        child: child,
      ),
    );
  }
}

/// Виджет для создания элегантного контейнера
class ElegantContainer extends StatelessWidget {
  const ElegantContainer({
    super.key,
    required this.child,
    this.gradient,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.borderRadius = AppConstants.glassRadius,
    this.shadowIntensity = 1.0,
  });

  final Widget child;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final double borderRadius;
  final double shadowIntensity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: ModernDecorations.customElegant(
        gradient: gradient,
        borderRadius: borderRadius,
        shadowIntensity: shadowIntensity,
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(AppConstants.paddingMedium),
        child: child,
      ),
    );
  }
}
