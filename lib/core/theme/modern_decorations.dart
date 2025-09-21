import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

/// Ультрасовременные декорации BeautyMaster 2025
/// Стиль: Neomorphic + Liquid Motion + Organic Shapes
class ModernDecorations {
  ModernDecorations._();

  // ===== NEOMORPHIC BASE - базовые неоморфные элементы =====

  /// Базовая неоморфная декорация
  static BoxDecoration get neomorphicBase => BoxDecoration(
        color: AppColors.surfaceMain,
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        boxShadow: [
          // Светлая тень (блик)
          BoxShadow(
            color: AppColors.highlightNeomorphic,
            offset: const Offset(-6, -6),
            blurRadius: 12,
            spreadRadius: 0,
          ),
          // Темная тень (глубина)
          BoxShadow(
            color: AppColors.shadowMedium,
            offset: const Offset(6, 6),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      );

  /// Вдавленная неоморфная декорация
  static BoxDecoration get neomorphicInset => BoxDecoration(
        color: AppColors.surfaceMain,
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        boxShadow: [
          // Внутренняя тень сверху-слева
          BoxShadow(
            color: AppColors.shadowInner,
            offset: const Offset(4, 4),
            blurRadius: 8,
            spreadRadius: -2,
          ),
          // Внутренний блик снизу-справа
          BoxShadow(
            color: AppColors.highlightNeomorphic,
            offset: const Offset(-2, -2),
            blurRadius: 6,
            spreadRadius: -1,
          ),
        ],
      );

  /// Приподнятая неоморфная декорация
  static BoxDecoration get neomorphicElevated => BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        boxShadow: [
          // Большая светлая тень
          BoxShadow(
            color: AppColors.highlightNeomorphic,
            offset: const Offset(-8, -8),
            blurRadius: 16,
            spreadRadius: 0,
          ),
          // Большая темная тень
          BoxShadow(
            color: AppColors.shadowDark,
            offset: const Offset(8, 8),
            blurRadius: 16,
            spreadRadius: 0,
          ),
        ],
      );

  // ===== LIQUID SHAPES - жидкие формы =====

  /// Liquid карточка с градиентом
  static BoxDecoration get liquidCard => BoxDecoration(
        gradient: AppColors.liquidNeutral,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.primaryLight.withValues(alpha: 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            offset: const Offset(0, 4),
            blurRadius: 12,
            spreadRadius: -2,
          ),
        ],
      );

  /// Liquid кнопка
  static BoxDecoration get liquidButton => BoxDecoration(
        gradient: AppColors.liquidPrimary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryMain.withValues(alpha: 0.3),
            offset: const Offset(0, 6),
            blurRadius: 20,
            spreadRadius: -5,
          ),
        ],
      );

  /// Liquid input поле
  static BoxDecoration get liquidInput => BoxDecoration(
        color: AppColors.surfaceMain,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primaryLight.withValues(alpha: 0.4),
          width: 1.5,
        ),
        boxShadow: [
          // Внутренняя тень
          BoxShadow(
            color: AppColors.shadowInner,
            offset: const Offset(2, 2),
            blurRadius: 6,
            spreadRadius: -2,
          ),
        ],
      );

  // ===== ORGANIC SHAPES - органические формы =====

  /// Органическая карточка клиента
  static BoxDecoration get organicClientCard => BoxDecoration(
        gradient: AppColors.liquidSecondary,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(24),
          topRight: const Radius.circular(8),
          bottomLeft: const Radius.circular(8),
          bottomRight: const Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            offset: const Offset(0, 2),
            blurRadius: 8,
            spreadRadius: -1,
          ),
        ],
      );

  /// Органическая форма для аватара
  static BoxDecoration get organicAvatar => BoxDecoration(
        gradient: AppColors.liquidAccent,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(8),
          bottomLeft: const Radius.circular(12),
          bottomRight: const Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.accentMain.withValues(alpha: 0.3),
            offset: const Offset(0, 3),
            blurRadius: 8,
            spreadRadius: -2,
          ),
        ],
      );

  // ===== FLOATING ELEMENTS - плавающие элементы =====

  /// Floating action button
  static BoxDecoration get floatingButton => BoxDecoration(
        gradient: AppColors.breathingPrimary,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          // Большая мягкая тень
          BoxShadow(
            color: AppColors.primaryMain.withValues(alpha: 0.3),
            offset: const Offset(0, 8),
            blurRadius: 24,
            spreadRadius: -8,
          ),
          // Внутренний блик
          BoxShadow(
            color: AppColors.highlightNeomorphic,
            offset: const Offset(-2, -2),
            blurRadius: 6,
            spreadRadius: -2,
          ),
        ],
      );

  /// Floating card
  static BoxDecoration get floatingCard => BoxDecoration(
        color: AppColors.surfaceMain,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          // Основная тень
          BoxShadow(
            color: AppColors.shadowMedium,
            offset: const Offset(0, 8),
            blurRadius: 32,
            spreadRadius: -8,
          ),
          // Световой блик
          BoxShadow(
            color: AppColors.highlightNeomorphic,
            offset: const Offset(0, -1),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      );

  // ===== NAVIGATION - навигация =====

  /// Bottom navigation bar
  static BoxDecoration get bottomNavigation => BoxDecoration(
        color: AppColors.surfaceMain.withValues(alpha: 0.95),
        border: Border(
          top: BorderSide(
            color: AppColors.primaryLight.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            offset: const Offset(0, -4),
            blurRadius: 20,
            spreadRadius: -5,
          ),
        ],
      );

  /// Navigation item active
  static BoxDecoration get navItemActive => BoxDecoration(
        gradient: AppColors.liquidPrimary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryMain.withValues(alpha: 0.4),
            offset: const Offset(0, 4),
            blurRadius: 12,
            spreadRadius: -3,
          ),
        ],
      );

  /// Navigation item inactive
  static BoxDecoration get navItemInactive => BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      );

  // ===== STATUS ELEMENTS - статусные элементы =====

  /// Success badge
  static BoxDecoration successBadge({double radius = 12}) => BoxDecoration(
        color: AppColors.success,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: AppColors.successAccent.withValues(alpha: 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.successAccent.withValues(alpha: 0.2),
            offset: const Offset(0, 2),
            blurRadius: 6,
            spreadRadius: -1,
          ),
        ],
      );

  /// Warning badge
  static BoxDecoration warningBadge({double radius = 12}) => BoxDecoration(
        color: AppColors.warning,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: AppColors.warningAccent.withValues(alpha: 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.warningAccent.withValues(alpha: 0.2),
            offset: const Offset(0, 2),
            blurRadius: 6,
            spreadRadius: -1,
          ),
        ],
      );

  /// Error badge
  static BoxDecoration errorBadge({double radius = 12}) => BoxDecoration(
        color: AppColors.error,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: AppColors.errorAccent.withValues(alpha: 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.errorAccent.withValues(alpha: 0.2),
            offset: const Offset(0, 2),
            blurRadius: 6,
            spreadRadius: -1,
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
            offset: const Offset(2, 2),
            blurRadius: 4,
            spreadRadius: -1,
          ),
        ],
      );

  /// Focused effect
  static BoxDecoration focused(BoxDecoration base) => base.copyWith(
        border: Border.all(
          color: AppColors.primaryMain.withValues(alpha: 0.6),
          width: 2,
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

  /// Кастомная неоморфная декорация
  static BoxDecoration customNeomorphic({
    Color? color,
    double borderRadius = AppConstants.radiusLarge,
    bool isInset = false,
    double shadowIntensity = 1.0,
  }) {
    final baseColor = color ?? AppColors.surfaceMain;

    if (isInset) {
      return BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color:
                AppColors.shadowInner.withValues(alpha: 0.15 * shadowIntensity),
            offset: const Offset(4, 4),
            blurRadius: 8 * shadowIntensity,
            spreadRadius: -2,
          ),
          BoxShadow(
            color: AppColors.highlightNeomorphic
                .withValues(alpha: 0.8 * shadowIntensity),
            offset: const Offset(-2, -2),
            blurRadius: 6 * shadowIntensity,
            spreadRadius: -1,
          ),
        ],
      );
    }

    return BoxDecoration(
      color: baseColor,
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: [
        BoxShadow(
          color: AppColors.highlightNeomorphic
              .withValues(alpha: 0.8 * shadowIntensity),
          offset: Offset(-6 * shadowIntensity, -6 * shadowIntensity),
          blurRadius: 12 * shadowIntensity,
          spreadRadius: 0,
        ),
        BoxShadow(
          color:
              AppColors.shadowMedium.withValues(alpha: 0.3 * shadowIntensity),
          offset: Offset(6 * shadowIntensity, 6 * shadowIntensity),
          blurRadius: 12 * shadowIntensity,
          spreadRadius: 0,
        ),
      ],
    );
  }

  /// Кастомная liquid декорация
  static BoxDecoration customLiquid({
    Gradient? gradient,
    double borderRadius = 24,
    Color? borderColor,
    double shadowBlur = 12,
  }) {
    return BoxDecoration(
      gradient: gradient ?? AppColors.liquidNeutral,
      borderRadius: BorderRadius.circular(borderRadius),
      border: borderColor != null
          ? Border.all(color: borderColor.withValues(alpha: 0.3), width: 1)
          : null,
      boxShadow: [
        BoxShadow(
          color: AppColors.shadowLight,
          offset: const Offset(0, 4),
          blurRadius: shadowBlur,
          spreadRadius: -2,
        ),
      ],
    );
  }

  // ===== GLASS DECORATIONS - стеклянные эффекты (для совместимости) =====

  /// Glass навигационная панель
  static BoxDecoration get glassNavBar => bottomNavigation;

  /// Glass базовая декорация
  static BoxDecoration get glassBase => neomorphicBase;

  /// Glass input поле
  static BoxDecoration get glassInput => liquidInput;

  /// Glass карточка
  static BoxDecoration get glassCard => floatingCard;
}

/// Алиас для совместимости с существующим кодом
typedef GlassDecorations = ModernDecorations;

/// Виджет для создания неоморфного контейнера
class NeomorphicContainer extends StatelessWidget {
  const NeomorphicContainer({
    super.key,
    required this.child,
    this.decoration,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.isInset = false,
    this.borderRadius = AppConstants.radiusLarge,
    this.shadowIntensity = 1.0,
  });

  final Widget child;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final bool isInset;
  final double borderRadius;
  final double shadowIntensity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: decoration ??
          ModernDecorations.customNeomorphic(
            borderRadius: borderRadius,
            isInset: isInset,
            shadowIntensity: shadowIntensity,
          ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(AppConstants.paddingMedium),
        child: child,
      ),
    );
  }
}

/// Виджет для создания liquid контейнера
class LiquidContainer extends StatelessWidget {
  const LiquidContainer({
    super.key,
    required this.child,
    this.gradient,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.borderRadius = 24,
    this.borderColor,
  });

  final Widget child;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final double borderRadius;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: ModernDecorations.customLiquid(
        gradient: gradient,
        borderRadius: borderRadius,
        borderColor: borderColor,
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(AppConstants.paddingMedium),
        child: child,
      ),
    );
  }
}
