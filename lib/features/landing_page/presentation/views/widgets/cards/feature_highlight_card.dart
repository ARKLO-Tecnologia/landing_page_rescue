import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/shared/extensions/responsive_context.dart';
import 'package:rescue_pitchtech/shared/responsive/landing_breakpoints.dart';
import 'package:rescue_pitchtech/shared/theme/app_theme.dart';
import 'package:rescue_pitchtech/shared/theme/app_text_styles.dart';
import 'package:rescue_pitchtech/shared/utils/responsive_card_width.dart';

class FeatureHighlightCard extends StatelessWidget {
  const FeatureHighlightCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.highlight,
  });

  final IconData icon;
  final String title;
  final String description;
  final String highlight;

  @override
  Widget build(BuildContext context) {
    final cardWidth = responsiveCardWidth(
      context,
      sectionMaxWidth: LandingBreakpoints.sectionMaxWidthNarrow,
      phoneColumns: 1,
      tabletColumns: 2,
      desktopColumns: 2,
      spacing: 24,
    );

    return Container(
      width: cardWidth,
      padding: EdgeInsets.all(
        context.responsiveValue(phone: 18, tablet: 20, desktop: 24),
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Colors.white, size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.cardTitle(
                    context,
                    color: AppColors.background,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(description, style: AppTextStyles.bodyMuted()),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.successLight,
              borderRadius: BorderRadius.circular(4),
              border: const Border(
                left: BorderSide(color: AppColors.success, width: 4),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: AppColors.success,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    highlight,
                    style: const TextStyle(
                      color: AppColors.highlightSuccess,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
