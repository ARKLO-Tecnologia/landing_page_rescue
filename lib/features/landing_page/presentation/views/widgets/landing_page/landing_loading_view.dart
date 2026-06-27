import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/shared/theme/app_theme.dart';

/// Estado de carregamento inicial da landing page.
class LandingLoadingView extends StatelessWidget {
  const LandingLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
    );
  }
}
