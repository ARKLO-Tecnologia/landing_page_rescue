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
    return Scaffold(
      backgroundColor: AppColors.background,

      // 1. ADICIONE O ENDDRAWER AQUI
      // Ele fica no nível do Scaffold, fora do body.
      endDrawer: Drawer(
        backgroundColor: AppColors.background,
        child: Column(
          children: [
            const SizedBox(height: 60),
            Image.asset(
              'assets/imagens/logo_web.png',
              width: 150,
              color: Colors.white,
              colorBlendMode: BlendMode.srcIn,
            ),
            const Divider(color: Colors.white10, height: 40),

            // Itens do menu mobile
            _buildDrawerItem('Funcionalidades', context),
            _buildDrawerItem('Triagem NEWS2', context),
            _buildDrawerItem('Protocolos', context),
            _buildDrawerItem('Decision Track', context),
          ],
        ),
      ),

      body: Column(
        children: [
          // Mantendo o Header fixo no topo (opcional, mas recomendado para UX)
          const HeaderSection(),

          Expanded(
            child: SingleChildScrollView(
              child: ResponsiveBuilder(
                phone: (context) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      // HeaderSection removido daqui para não duplicar
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
                desktop: (context) => const Column(
                  children: [
                    // HeaderSection removido daqui para não duplicar
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
          ),
        ],
      ),
    );
  }

  // 2. FUNÇÃO AUXILIAR PARA OS ITENS DO MENU MOBILE
  Widget _buildDrawerItem(String title, BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      onTap: () {
        Navigator.pop(context); // Fecha o menu lateral
        debugPrint('Clicou em: $title');
      },
    );
  }
}