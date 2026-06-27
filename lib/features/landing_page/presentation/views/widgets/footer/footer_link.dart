import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/shared/theme/app_theme.dart';
import 'package:rescue_pitchtech/shared/utils/url_launcher_service.dart';

class FooterLink extends StatelessWidget {
  const FooterLink({
    super.key,
    required this.label,
    required this.url,
  });

  final String label;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => UrlLauncherService.open(url),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          color: AppColors.textSecondary,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.textSecondary,
        ),
      ),
    );
  }
}
