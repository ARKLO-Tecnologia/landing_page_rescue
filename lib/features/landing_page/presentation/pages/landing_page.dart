import 'package:flutter/material.dart';
import 'package:landing_page_emergency/core/theme/app_theme.dart';
import 'package:landing_page_emergency/core/widgets/responsive_builder.dart';
import 'package:landing_page_emergency/features/landing_page/presentation/widgets/cta_section.dart';
import 'package:landing_page_emergency/features/landing_page/presentation/widgets/features_table_section.dart';
import 'package:landing_page_emergency/features/landing_page/presentation/widgets/footer_section.dart';
import 'package:landing_page_emergency/features/landing_page/presentation/widgets/forensic_differential_section.dart';
import 'package:landing_page_emergency/features/landing_page/presentation/widgets/header_section.dart';
import 'package:landing_page_emergency/features/landing_page/presentation/widgets/hero_section.dart';
import 'package:landing_page_emergency/features/landing_page/presentation/widgets/mobile_section.dart';
import 'package:landing_page_emergency/features/landing_page/presentation/widgets/operation_flow_section.dart';
import 'package:landing_page_emergency/features/landing_page/presentation/widgets/problem_section.dart';
import 'package:landing_page_emergency/features/landing_page/presentation/widgets/solution_section.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.background,
      body: ResponsiveBuilder(
        phone: (context) => const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                HeaderSection(),
                HeroSection(),
                ProblemSection(),
                SolutionSection(),
                FeaturesTableSection(),
                ForensicDifferentialSection(),
                OperationFlowSection(),
                MobileSection(),
                CTASection(),
                FooterSection(),
              ],
            ),
          ),
        ),

        desktop: (context) => const SingleChildScrollView(
          child: Column(
            children: [
              HeaderSection(),
              HeroSection(),
              ProblemSection(),
              SolutionSection(),
              FeaturesTableSection(),
              ForensicDifferentialSection(),
              OperationFlowSection(),
              MobileSection(),
              CTASection(),
              FooterSection(),
            ],
          ),
        ),
      ),

    );
  }
}