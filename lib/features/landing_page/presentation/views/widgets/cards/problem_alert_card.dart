import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/shared/extensions/responsive_context.dart';
import 'package:rescue_pitchtech/shared/theme/app_text_styles.dart';
import 'package:rescue_pitchtech/shared/utils/responsive_card_width.dart';

class ProblemAlertCard extends StatelessWidget {
  const ProblemAlertCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.accentColor,
    required this.backgroundColor,
    required this.sectionMaxWidth,
  });

  final IconData icon;
  final String title;
  final String description;
  final Color accentColor;
  final Color backgroundColor;
  final double sectionMaxWidth;

  @override
  Widget build(BuildContext context) {
    final cardWidth = responsiveCardWidth(
      context,
      sectionMaxWidth: sectionMaxWidth,
      phoneColumns: 1,
      tabletColumns: 2,
      desktopColumns: 2,
      spacing: 32,
    );

    final padding = context.responsiveValue(
      phone: 16.0,
      tablet: 24.0,
      desktop: 32.0,
    );

    return Container(
      width: cardWidth,
      constraints: BoxConstraints(
        minHeight: context.isLandingPhone ? 0 : 180,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 6,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      icon,
                      color: accentColor,
                      size: context.responsiveValue(
                        phone: 28,
                        tablet: 34,
                        desktop: 42,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: context.responsiveValue(
                                phone: 15,
                                tablet: 17,
                                desktop: 19,
                              ),
                              fontWeight: FontWeight.bold,
                              color: accentColor.withValues(alpha: 0.9),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(description, style: AppTextStyles.bodyMuted()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
