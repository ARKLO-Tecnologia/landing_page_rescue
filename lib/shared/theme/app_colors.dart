import 'package:flutter/material.dart';
import 'package:rescue_design_system/rescue_design_system.dart' hide AppColors;

abstract final class AppColors {
  AppColors._();

  static const Color background = RescueLightColors.navy;
  static const Color primary = RescueDarkColors.primary;
  static const Color accent = RescueDarkColors.info;
  static const Color textPrimary = RescueDarkColors.textPrimary;
  static const Color textSecondary = RescueDarkColors.textSecondary;
  static const Color error = RescueDarkColors.critical;
  static Color get errorLight => error.withValues(alpha: 0.08);
  static const Color warning = RescueDarkColors.attention;
  static Color get warningLight => warning.withValues(alpha: 0.14);
  static const Color success = RescueDarkColors.success;
  static Color get successLight => success.withValues(alpha: 0.12);
  static const Color surfaceWhite = RescueLightColors.surface;
  static const Color surfaceGrey = RescueLightColors.background;
  static const Color textMuted = Color(0xFF475467);
  static const Color textBody = Color(0xFF344054);
  static const Color highlightSuccess = Color(0xFF027A48);
  static const Color cardDarkSurface = Color(0xFF1E2F4D);
  static const Color formCardBackground = Color(0xFF1C2938);
  static const Color formButtonForeground = Color(0xFF111D29);
}
