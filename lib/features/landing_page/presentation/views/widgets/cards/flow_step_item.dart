import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/shared/extensions/responsive_context.dart';
import 'package:rescue_pitchtech/shared/theme/app_theme.dart';

class FlowStepItem extends StatelessWidget {
  const FlowStepItem({
    super.key,
    required this.index,
    required this.text,
  });

  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    final circleSize = context.responsiveValue(
      phone: 36.0,
      tablet: 38.0,
      desktop: 40.0,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: circleSize,
            height: circleSize,
            decoration: const BoxDecoration(
              color: AppColors.accent,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$index',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.background,
                  fontSize: circleSize * 0.45,
                ),
              ),
            ),
          ),
          SizedBox(
            width: context.responsiveValue(phone: 16, tablet: 18, desktop: 20),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: context.responsiveValue(
                  phone: 14,
                  tablet: 15,
                  desktop: 16,
                ),
                color: Colors.white,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
