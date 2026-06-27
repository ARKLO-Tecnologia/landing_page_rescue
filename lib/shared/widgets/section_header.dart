import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/shared/theme/app_text_styles.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.titleColor,
    this.subtitle,
    this.subtitleColor,
    this.textAlign = TextAlign.center,
    this.spacingAfterTitle = 24,
    this.spacingAfterSubtitle = 48,
    this.subtitleWidget,
    this.titleStyle,
  });

  final String title;
  final Color titleColor;
  final String? subtitle;
  final Color? subtitleColor;
  final TextAlign textAlign;
  final double spacingAfterTitle;
  final double spacingAfterSubtitle;
  final Widget? subtitleWidget;
  final TextStyle Function(BuildContext context)? titleStyle;

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = titleStyle?.call(context) ??
        AppTextStyles.sectionTitle(context, color: titleColor);

    return Column(
      children: [
        Text(title, textAlign: textAlign, style: titleTextStyle),
        SizedBox(height: spacingAfterTitle),
        if (subtitleWidget != null)
          subtitleWidget!
        else if (subtitle != null)
          Text(
            subtitle!,
            textAlign: textAlign,
            style: AppTextStyles.sectionSubtitle(
              context,
              color: subtitleColor,
            ),
          ),
        if (subtitle != null || subtitleWidget != null)
          SizedBox(height: spacingAfterSubtitle),
      ],
    );
  }
}
