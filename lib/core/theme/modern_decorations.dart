import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

/// Enterprise Decorations System BeautyMaster 2.0
/// Философия: Conscious Design + Strategic Glassmorphism + Mathematical Precision
/// Принципы: Progressive Disclosure + Intelligent Depth + Emotional Intelligence
class ModernDecorations {
  ModernDecorations._();

  // =====================================================================
  // GLASSMORPHISM SYSTEM - Strategic Glass Elements
  // =====================================================================

  /// Navigation Glass - Для навигационных элементов
  /// Backdrop blur + subtle borders + strategic opacity
  static BoxDecoration get navigationGlass => BoxDecoration(
        color: AppColors.navigationGlass,
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        border: Border.all(
          color: AppColors.borderSubtle,
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowSmall,
            offset: Offset(0, AppConstants.elevation2),
            blurRadius: AppConstants.glassBlurNavigation,
            spreadRadius: -2,
          ),
        ],
      );

  /// Modal Glass - Для модальных окон и overlays
  /// Maximum blur + premium opacity + elevated shadows
  static BoxDecoration get modalGlass => BoxDecoration(
        color: AppColors.modalGlass,
        borderRadius: BorderRadius.circular(AppConstants.radiusXLarge),
        border: Border.all(
          color: AppColors.borderSubtle.withValues(alpha: 0.3),
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLarge,
            offset: Offset(0, AppConstants.elevation4),
            blurRadius: AppConstants.glassBlurModal,
            spreadRadius: -4,
          ),
          // Secondary shadow for depth
          BoxShadow(
            color: AppColors.shadowMedium,
            offset: Offset(0, AppConstants.elevation2),
            blurRadius: AppConstants.glassBlurModal / 2,
            spreadRadius: -2,
          ),
        ],
      );

  /// Card Glass - Для стеклянных карточек
  /// Subtle glass effect + organic borders
  static BoxDecoration get cardGlass => BoxDecoration(
        color: AppColors.cardGlass,
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        border: Border.all(
          color: AppColors.borderSubtle,
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowSmall,
            offset: Offset(0, AppConstants.elevation1),
            blurRadius: AppConstants.glassBlurCard,
            spreadRadius: 0,
          ),
        ],
      );

  /// Floating Glass - Для floating action buttons
  /// Brand-colored glass + premium shadows
  static BoxDecoration get floatingGlass => BoxDecoration(
        color: AppColors.floatingGlass,
        borderRadius: BorderRadius.circular(AppConstants.radiusXLarge),
        border: Border.all(
          color: AppColors.quantumLight.withValues(alpha: 0.3),
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowBrand,
            offset: Offset(0, AppConstants.elevation3),
            blurRadius: AppConstants.glassBlurFloating,
            spreadRadius: -2,
          ),
          // Brand glow effect
          BoxShadow(
            color: AppColors.quantumCore.withValues(alpha: 0.2),
            offset: Offset(0, AppConstants.elevation2),
            blurRadius: AppConstants.glassBlurFloating * 2,
            spreadRadius: 0,
          ),
        ],
      );

  /// Sidebar Glass - Для боковых панелей
  /// High opacity + structural support
  static BoxDecoration get sidebarGlass => BoxDecoration(
        color: AppColors.sidebarGlass,
        border: Border(
          right: BorderSide(
            color: AppColors.borderSubtle,
            width: 1.0,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowMedium,
            offset: Offset(AppConstants.elevation2, 0),
            blurRadius: AppConstants.glassBlurSidebar,
            spreadRadius: -1,
          ),
        ],
      );

  // =====================================================================
  // ENTERPRISE SURFACE SYSTEM - Elevation Hierarchy
  // =====================================================================

  /// Surface Level 0 - Page background
  /// Clean foundation with no elevation
  static BoxDecoration get surface0 => BoxDecoration(
        color: AppColors.surface0,
      );

  /// Surface Level 1 - Basic cards and panels
  /// Subtle elevation with micro shadows
  static BoxDecoration get surface1 => BoxDecoration(
        color: AppColors.surface1,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(
          color: AppColors.borderSubtle,
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowMicro,
            offset: Offset(0, AppConstants.elevation1),
            blurRadius: AppConstants.spaceSmall,
            spreadRadius: 0,
          ),
        ],
      );

  /// Surface Level 2 - Elevated cards and dropdowns
  /// Standard elevation with defined shadows
  static BoxDecoration get surface2 => BoxDecoration(
        color: AppColors.surface2,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(
          color: AppColors.borderSubtle,
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowSmall,
            offset: Offset(0, AppConstants.elevation2),
            blurRadius: AppConstants.spaceSmall * 2,
            spreadRadius: -1,
          ),
        ],
      );

  /// Surface Level 3 - Modals and important dialogs
  /// High elevation with premium shadows
  static BoxDecoration get surface3 => BoxDecoration(
        color: AppColors.surface3,
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        border: Border.all(
          color: AppColors.borderDefault,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowMedium,
            offset: Offset(0, AppConstants.elevation3),
            blurRadius: AppConstants.spaceMedium,
            spreadRadius: -2,
          ),
          // Secondary shadow for depth
          BoxShadow(
            color: AppColors.shadowSmall,
            offset: Offset(0, AppConstants.elevation1),
            blurRadius: AppConstants.spaceSmall,
            spreadRadius: 0,
          ),
        ],
      );

  /// Surface Level 4 - Critical alerts and tooltips
  /// Maximum elevation with dramatic shadows
  static BoxDecoration get surface4 => BoxDecoration(
        color: AppColors.surface4,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(
          color: AppColors.borderDefault,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLarge,
            offset: Offset(0, AppConstants.elevation4),
            blurRadius: AppConstants.spaceLarge,
            spreadRadius: -4,
          ),
          BoxShadow(
            color: AppColors.shadowMedium,
            offset: Offset(0, AppConstants.elevation2),
            blurRadius: AppConstants.spaceMedium,
            spreadRadius: -2,
          ),
        ],
      );

  // =====================================================================
  // ORGANIC SHAPES SYSTEM - Natural Form Language
  // =====================================================================

  /// Organic Card - Asymmetric beauty with natural flow
  /// Inspired by liquid motion and organic forms
  static BoxDecoration get organicCard => BoxDecoration(
        color: AppColors.surface1,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppConstants.radiusXLarge),
          topRight: Radius.circular(AppConstants.radiusSmall),
          bottomLeft: Radius.circular(AppConstants.radiusSmall),
          bottomRight: Radius.circular(AppConstants.radiusXLarge),
        ),
        border: Border.all(
          color: AppColors.borderSubtle,
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowSmall,
            offset: Offset(0, AppConstants.elevation1),
            blurRadius: AppConstants.spaceSmall * 2,
            spreadRadius: 0,
          ),
        ],
      );

  /// Organic Avatar - Natural profile picture container
  /// Flowing curves with brand accent
  static BoxDecoration get organicAvatar => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.quantumLight,
            AppColors.quantumFog,
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppConstants.radiusMedium),
          topRight: Radius.circular(AppConstants.radiusSmall),
          bottomLeft: Radius.circular(AppConstants.radiusSmall),
          bottomRight: Radius.circular(AppConstants.radiusMedium),
        ),
        border: Border.all(
          color: AppColors.quantumCore.withValues(alpha: 0.2),
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.quantumCore.withValues(alpha: 0.1),
            offset: Offset(0, AppConstants.elevation2),
            blurRadius: AppConstants.spaceSmall * 2,
            spreadRadius: -1,
          ),
        ],
      );

  /// Organic Button - Natural interactive element
  /// Flowing form with premium feel
  static BoxDecoration get organicButton => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.quantumCore,
            AppColors.quantumDeep,
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppConstants.radiusLarge),
          topRight: Radius.circular(AppConstants.radiusMedium),
          bottomLeft: Radius.circular(AppConstants.radiusMedium),
          bottomRight: Radius.circular(AppConstants.radiusLarge),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowBrand,
            offset: Offset(0, AppConstants.elevation2),
            blurRadius: AppConstants.spaceMedium,
            spreadRadius: -2,
          ),
        ],
      );

  // =====================================================================
  // INTERACTIVE STATES - Micro-interaction Decorations
  // =====================================================================

  /// Hover State - Subtle elevation increase
  static BoxDecoration getHoverDecoration(BoxDecoration base) {
    return base.copyWith(
      boxShadow: [
        ...base.boxShadow ?? [],
        BoxShadow(
          color: AppColors.stateHover,
          offset: Offset(0, AppConstants.elevation1),
          blurRadius: AppConstants.spaceSmall,
          spreadRadius: 0,
        ),
      ],
    );
  }

  /// Pressed State - Immediate visual feedback
  static BoxDecoration getPressedDecoration(BoxDecoration base) {
    return base.copyWith(
      boxShadow: [
        BoxShadow(
          color: AppColors.statePressed,
          offset: Offset(0, AppConstants.elevation1 / 2),
          blurRadius: AppConstants.spaceSmall / 2,
          spreadRadius: -1,
        ),
      ],
    );
  }

  /// Focus State - Clear accessibility indicator
  static BoxDecoration getFocusDecoration(BoxDecoration base) {
    return base.copyWith(
      border: Border.all(
        color: AppColors.quantumCore,
        width: 2.0,
      ),
      boxShadow: [
        ...base.boxShadow ?? [],
        BoxShadow(
          color: AppColors.stateFocus,
          offset: Offset.zero,
          blurRadius: AppConstants.spaceSmall,
          spreadRadius: 0,
        ),
      ],
    );
  }

  /// Selected State - Persistent selection indicator
  static BoxDecoration getSelectedDecoration(BoxDecoration base) {
    return base.copyWith(
      color: AppColors.stateSelected,
      border: Border.all(
        color: AppColors.quantumCore,
        width: 1.5,
      ),
    );
  }

  // =====================================================================
  // SEMANTIC DECORATIONS - Context-Aware Styling
  // =====================================================================

  /// Success Decoration - Positive feedback styling
  static BoxDecoration get successDecoration => BoxDecoration(
        color: AppColors.successLight,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(
          color: AppColors.successCore,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.successCore.withValues(alpha: 0.2),
            offset: Offset(0, AppConstants.elevation1),
            blurRadius: AppConstants.spaceSmall,
            spreadRadius: 0,
          ),
        ],
      );

  /// Warning Decoration - Attention-getting styling
  static BoxDecoration get warningDecoration => BoxDecoration(
        color: AppColors.warningLight,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(
          color: AppColors.warningCore,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.warningCore.withValues(alpha: 0.2),
            offset: Offset(0, AppConstants.elevation1),
            blurRadius: AppConstants.spaceSmall,
            spreadRadius: 0,
          ),
        ],
      );

  /// Error Decoration - Error state styling
  static BoxDecoration get errorDecoration => BoxDecoration(
        color: AppColors.errorLight,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(
          color: AppColors.errorCore,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.errorCore.withValues(alpha: 0.2),
            offset: Offset(0, AppConstants.elevation1),
            blurRadius: AppConstants.spaceSmall,
            spreadRadius: 0,
          ),
        ],
      );

  /// Info Decoration - Informational styling
  static BoxDecoration get infoDecoration => BoxDecoration(
        color: AppColors.infoLight,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(
          color: AppColors.infoCore,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.infoCore.withValues(alpha: 0.2),
            offset: Offset(0, AppConstants.elevation1),
            blurRadius: AppConstants.spaceSmall,
            spreadRadius: 0,
          ),
        ],
      );

  // =====================================================================
  // PREMIUM DECORATIONS - Luxury Touch Points
  // =====================================================================

  /// VIP Badge - Premium status indicator
  static BoxDecoration get vipBadge => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.premiumGold,
            AppColors.premiumGold.withValues(alpha: 0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(AppConstants.radiusXLarge),
        border: Border.all(
          color: AppColors.premiumGold.withValues(alpha: 0.3),
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.premiumGold.withValues(alpha: 0.3),
            offset: Offset(0, AppConstants.elevation2),
            blurRadius: AppConstants.spaceSmall * 2,
            spreadRadius: -1,
          ),
        ],
      );

  /// Premium Card - Luxury content container
  static BoxDecoration get premiumCard => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.surface1,
            AppColors.surface0,
          ],
        ),
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        border: Border.all(
          color: AppColors.quantumCore.withValues(alpha: 0.2),
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowBrand,
            offset: Offset(0, AppConstants.elevation3),
            blurRadius: AppConstants.spaceMedium,
            spreadRadius: -2,
          ),
          BoxShadow(
            color: AppColors.quantumCore.withValues(alpha: 0.1),
            offset: Offset(0, AppConstants.elevation1),
            blurRadius: AppConstants.spaceLarge,
            spreadRadius: 0,
          ),
        ],
      );

  // =====================================================================
  // CUSTOM DECORATION BUILDERS - Utility Functions
  // =====================================================================

  /// Creates custom glass decoration with parameters
  static BoxDecoration createGlassDecoration({
    Color? backgroundColor,
    Color? borderColor,
    double? borderRadius,
    double? borderWidth,
    double? blurRadius,
    double? elevation,
    EdgeInsetsGeometry? padding,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? AppColors.cardGlass,
      borderRadius: BorderRadius.circular(
        borderRadius ?? AppConstants.radiusMedium,
      ),
      border: Border.all(
        color: borderColor ?? AppColors.borderSubtle,
        width: borderWidth ?? 0.5,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.shadowSmall,
          offset: Offset(0, elevation ?? AppConstants.elevation1),
          blurRadius: blurRadius ?? AppConstants.glassBlurCard,
          spreadRadius: -1,
        ),
      ],
    );
  }

  /// Creates surface decoration with custom elevation
  static BoxDecoration createSurfaceDecoration({
    Color? backgroundColor,
    double? borderRadius,
    double? elevation,
    Color? shadowColor,
    bool hasBorder = true,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? AppColors.surface1,
      borderRadius: BorderRadius.circular(
        borderRadius ?? AppConstants.radiusMedium,
      ),
      border: hasBorder
          ? Border.all(
              color: AppColors.borderSubtle,
              width: 0.5,
            )
          : null,
      boxShadow: [
        BoxShadow(
          color: shadowColor ?? AppColors.shadowSmall,
          offset: Offset(0, elevation ?? AppConstants.elevation1),
          blurRadius: (elevation ?? AppConstants.elevation1) * 2,
          spreadRadius: -1,
        ),
      ],
    );
  }

  /// Creates organic decoration with custom asymmetry
  static BoxDecoration createOrganicDecoration({
    Color? backgroundColor,
    Gradient? gradient,
    double? topLeftRadius,
    double? topRightRadius,
    double? bottomLeftRadius,
    double? bottomRightRadius,
    Color? borderColor,
    double? elevation,
  }) {
    return BoxDecoration(
      color: gradient == null ? (backgroundColor ?? AppColors.surface1) : null,
      gradient: gradient,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          topLeftRadius ?? AppConstants.radiusLarge,
        ),
        topRight: Radius.circular(
          topRightRadius ?? AppConstants.radiusSmall,
        ),
        bottomLeft: Radius.circular(
          bottomLeftRadius ?? AppConstants.radiusSmall,
        ),
        bottomRight: Radius.circular(
          bottomRightRadius ?? AppConstants.radiusLarge,
        ),
      ),
      border: Border.all(
        color: borderColor ?? AppColors.borderSubtle,
        width: 0.5,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.shadowSmall,
          offset: Offset(0, elevation ?? AppConstants.elevation1),
          blurRadius: AppConstants.spaceSmall * 2,
          spreadRadius: 0,
        ),
      ],
    );
  }

  /// Creates branded decoration with quantum colors
  static BoxDecoration createBrandDecoration({
    bool isGradient = true,
    double? borderRadius,
    double? elevation,
    bool hasShadow = true,
  }) {
    return BoxDecoration(
      color: isGradient ? null : AppColors.quantumCore,
      gradient: isGradient
          ? LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.quantumCore,
                AppColors.quantumDeep,
              ],
            )
          : null,
      borderRadius: BorderRadius.circular(
        borderRadius ?? AppConstants.radiusMedium,
      ),
      boxShadow: hasShadow
          ? [
              BoxShadow(
                color: AppColors.shadowBrand,
                offset: Offset(0, elevation ?? AppConstants.elevation2),
                blurRadius: AppConstants.spaceMedium,
                spreadRadius: -2,
              ),
            ]
          : null,
    );
  }

  // =====================================================================
  // BACKDROP FILTER UTILITIES - Glass Effect Helpers
  // =====================================================================

  /// Creates backdrop filter widget for glassmorphism
  static Widget createBackdropFilter({
    required Widget child,
    double? sigmaX,
    double? sigmaY,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigmaX ?? AppConstants.glassBlurCard,
          sigmaY: sigmaY ?? AppConstants.glassBlurCard,
        ),
        child: child,
      ),
    );
  }

  /// Creates glass container widget with backdrop filter
  static Widget createGlassContainer({
    required Widget child,
    Color? backgroundColor,
    double? borderRadius,
    double? blurRadius,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
  }) {
    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppConstants.radiusMedium,
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blurRadius ?? AppConstants.glassBlurCard,
            sigmaY: blurRadius ?? AppConstants.glassBlurCard,
          ),
          child: Container(
            padding: padding ?? EdgeInsets.all(AppConstants.spaceMedium),
            decoration: createGlassDecoration(
              backgroundColor: backgroundColor,
              borderRadius: borderRadius,
              blurRadius: blurRadius,
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  // =====================================================================
  // ANIMATION HELPERS - Transition Decorations
  // =====================================================================

  /// Creates animated decoration for smooth transitions
  static AnimatedContainer createAnimatedContainer({
    required Widget child,
    required BoxDecoration decoration,
    Duration? duration,
    Curve? curve,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? width,
    double? height,
  }) {
    return AnimatedContainer(
      duration: duration ?? AppConstants.animationStandard,
      curve: curve ?? Curves.easeInOut,
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: decoration,
      child: child,
    );
  }

  /// Creates hero transition decoration
  static BoxDecoration createHeroDecoration({
    String? heroTag,
    Color? backgroundColor,
    double? borderRadius,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? AppColors.surface1,
      borderRadius: BorderRadius.circular(
        borderRadius ?? AppConstants.radiusMedium,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.shadowMedium,
          offset: Offset(0, AppConstants.elevation2),
          blurRadius: AppConstants.spaceMedium,
          spreadRadius: -1,
        ),
      ],
    );
  }
}

/// Glass Decorations для навигации
class GlassDecorations {
  GlassDecorations._();

  /// Glass navigation bar decoration
  static BoxDecoration get glassNavBar => BoxDecoration(
        color: AppColors.navigationGlass,
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        border: Border.all(
          color: AppColors.borderSubtle,
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowSmall,
            offset: Offset(0, AppConstants.elevation2),
            blurRadius: AppConstants.glassBlurNavigation,
            spreadRadius: -2,
          ),
        ],
      );
}
