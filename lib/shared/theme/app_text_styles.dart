import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/shared/extensions/responsive_context.dart';
import 'package:rescue_pitchtech/shared/theme/app_theme.dart';

abstract final class AppTextStyles {
  static TextStyle sectionTitle(
    BuildContext context, {
    required Color color,
    double? mobileSize,
    double? tabletSize,
    double? desktopSize,
  }) {
    return TextStyle(
      fontSize: context.responsiveValue(
        phone: mobileSize ?? 24,
        tablet: tabletSize ?? 28,
        desktop: desktopSize ?? 32,
        wide: desktopSize ?? 34,
      ),
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle sectionTitleLarge(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
      fontSize: context.responsiveValue(
        phone: 24,
        tablet: 30,
        desktop: 38,
        wide: 40,
      ),
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle sectionSubtitle(
    BuildContext context, {
    Color? color,
    double? mobileSize,
    double? tabletSize,
    double? desktopSize,
    double height = 1.4,
  }) {
    return TextStyle(
      fontSize: context.responsiveValue(
        phone: mobileSize ?? 14,
        tablet: tabletSize ?? 16,
        desktop: desktopSize ?? 18,
      ),
      color: color ?? AppColors.textMuted,
      height: height,
    );
  }

  static TextStyle cardTitle(BuildContext context, {required Color color}) {
    return TextStyle(
      fontSize: context.responsiveValue(
        phone: 16,
        tablet: 18,
        desktop: 21,
      ),
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle bodyMuted({double fontSize = 14, double height = 1.4}) {
    return TextStyle(
      fontSize: fontSize,
      color: AppColors.textMuted,
      height: height,
    );
  }

  static TextStyle bodyOnDark(BuildContext context, {double height = 1.5}) {
    return TextStyle(
      fontSize: context.responsiveValue(
        phone: 14,
        tablet: 15,
        desktop: 16,
      ),
      color: Colors.white,
      height: height,
    );
  }
}
