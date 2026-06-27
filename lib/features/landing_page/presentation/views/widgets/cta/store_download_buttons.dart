import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/cta/store_download_button.dart';
import 'package:rescue_pitchtech/shared/config/environment.dart';
import 'package:rescue_pitchtech/shared/extensions/responsive_context.dart';
import 'package:rescue_pitchtech/shared/utils/url_launcher_service.dart';

class StoreDownloadButtons extends StatelessWidget {
  const StoreDownloadButtons({
    super.key,
    this.alignment = WrapAlignment.start,
  });

  final WrapAlignment alignment;

  @override
  Widget build(BuildContext context) {
    final buttons = [
      StoreDownloadButton(
        icon: Icons.apple,
        label: 'Download on',
        storeName: 'App Store',
        onTap: () => UrlLauncherService.open(Environment.appStoreUrl),
      ),
      StoreDownloadButton(
        icon: Icons.play_arrow_rounded,
        label: 'Get it on',
        storeName: 'Google Play',
        onTap: () => UrlLauncherService.open(Environment.playStoreUrl),
      ),
    ];

    if (context.isLandingPhone) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < buttons.length; i++) ...[
            if (i > 0) const SizedBox(height: 12),
            buttons[i],
          ],
        ],
      );
    }

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: alignment,
      children: buttons,
    );
  }
}
