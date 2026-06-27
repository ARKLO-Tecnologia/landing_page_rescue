import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/shared/extensions/responsive_context.dart';
import 'package:rescue_pitchtech/shared/responsive/landing_breakpoints.dart';
import 'package:rescue_pitchtech/shared/theme/app_theme.dart';
import 'package:rescue_pitchtech/shared/theme/app_text_styles.dart';
import 'package:rescue_pitchtech/shared/utils/responsive_card_width.dart';

class SolutionFeatureCard extends StatelessWidget {
  const SolutionFeatureCard({
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
      spacing: 24,
    );

    return Container(
      width: cardWidth,
      constraints: BoxConstraints(
        minHeight: context.responsiveValue(
          phone: 180,
          tablet: 240,
          desktop: 320,
        ),
      ),
      padding: EdgeInsets.all(
        context.responsiveValue(phone: 20, tablet: 28, desktop: 40),
      ),
      decoration: BoxDecoration(
        color: AppColors.cardDarkSurface.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: context.responsiveValue(phone: 32, tablet: 36, desktop: 48),
          ),
          SizedBox(
            height: context.responsiveValue(phone: 16, tablet: 20, desktop: 24),
          ),
          Text(
            title,
            style: AppTextStyles.cardTitle(context, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: AppTextStyles.bodyMuted(height: 1.6).copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
