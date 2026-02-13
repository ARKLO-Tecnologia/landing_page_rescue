import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/landing_page/presentation/pages/landing_page.dart';

class LandingPageApp extends StatelessWidget {
  const LandingPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestão de Emergência',
      theme: AppTheme.lightTheme,
      home: const LandingPage(),
    );
  }
}

