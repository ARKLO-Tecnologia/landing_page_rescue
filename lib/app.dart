import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/features/landing_page/presentation/views/pages/landing_page.dart';
import 'package:rescue_pitchtech/shared/theme/app_theme.dart';

class LandingPageApp extends StatelessWidget {
  const LandingPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rescue Pitchtech',
      theme: AppTheme.theme,
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);
        final clampedScaler = mediaQuery.textScaler.clamp(
          minScaleFactor: 1,
          maxScaleFactor: 1.25,
        );

        return MediaQuery(
          data: mediaQuery.copyWith(textScaler: clampedScaler),
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: const LandingPage(),
    );
  }
}
