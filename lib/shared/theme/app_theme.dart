import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rescue_design_system/rescue_design_system.dart' hide AppColors;

import 'package:rescue_pitchtech/shared/theme/app_colors.dart';

export 'app_colors.dart';

class AppTheme {
  static ThemeData get theme {
    final base = rescueDarkTheme.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      textTheme: GoogleFonts.interTextTheme(rescueDarkTheme.textTheme).copyWith(
        displayMedium: rescueDarkTheme.textTheme.displayMedium?.copyWith(
          fontSize: 38,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        headlineMedium: rescueDarkTheme.textTheme.headlineMedium?.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: rescueDarkTheme.textTheme.titleLarge?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.background,
        ),
        bodyLarge: rescueDarkTheme.textTheme.bodyLarge?.copyWith(
          fontSize: 14,
          color: AppColors.textSecondary,
          height: 1.5,
        ),
      ),
    );

    return base;
  }
}
