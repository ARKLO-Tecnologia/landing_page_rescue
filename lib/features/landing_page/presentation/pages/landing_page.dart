import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_theme.dart';
import '../viewmodels/landing_page_view_model.dart';
import '../widgets/header_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/problem_section.dart';
import '../widgets/solution_section.dart';
import '../widgets/features_table_section.dart';
import '../widgets/forensic_differential_section.dart';
import '../widgets/operation_flow_section.dart';
import '../widgets/mobile_section.dart';
import '../widgets/cta_section.dart';
import '../widgets/footer_section.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LandingPageViewModel()..init(),
      child: Consumer<LandingPageViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      HeaderSection(),
                      HeroSection(),
                      ProblemSection(),
                      SolutionSection(),
                      FeaturesTableSection(),
                      ForensicDifferentialSection(),
                      OperationFlowSection(),
                      //PlatformSection(),
                      MobileSection(),
                      CTASection(),
                      FooterSection(),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

