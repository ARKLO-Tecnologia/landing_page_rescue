import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/shared/extensions/responsive_context.dart';
import 'package:rescue_pitchtech/shared/responsive/landing_breakpoints.dart';
import 'package:rescue_pitchtech/shared/theme/app_theme.dart';
import 'package:rescue_pitchtech/shared/theme/app_text_styles.dart';
import 'package:rescue_pitchtech/shared/utils/responsive_card_width.dart';

class ForensicFeatureCard extends StatelessWidget {
  const ForensicFeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final cardWidth = responsiveCardWidth(
      context,
      sectionMaxWidth: LandingBreakpoints.sectionMaxWidthWide,
      phoneColumns: 1,
      tabletColumns: 2,
      desktopColumns: 3,
      spacing: 40,
    );

    final iconSize = context.responsiveValue(
      phone: 56.0,
      tablet: 64.0,
      desktop: 80.0,
    );

    return SizedBox(
      width: cardWidth,
      child: Column(
        children: [
          Container(
            width: iconSize,
            height: iconSize,
            decoration: const BoxDecoration(
              color: AppColors.background,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: iconSize * 0.42,
            ),
          ),
          SizedBox(
            height: context.responsiveValue(phone: 16, tablet: 24, desktop: 32),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.cardTitle(context, color: AppColors.background),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMuted(height: 1.5),
          ),
        ],
      ),
    );
  }
}
