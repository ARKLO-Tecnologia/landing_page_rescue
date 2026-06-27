import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/cards/problem_alert_card.dart';
import 'package:rescue_pitchtech/shared/extensions/responsive_context.dart';
import 'package:rescue_pitchtech/shared/responsive/landing_breakpoints.dart';
import 'package:rescue_pitchtech/shared/theme/app_theme.dart';
import 'package:rescue_pitchtech/shared/widgets/section_container.dart';
import 'package:rescue_pitchtech/shared/widgets/section_header.dart';

class ProblemSection extends StatelessWidget {
  const ProblemSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      backgroundColor: AppColors.surfaceWhite,
      child: Column(
        children: [
          SectionHeader(
            title: 'O Problema: O "Gap" de 5 Minutos',
            titleColor: AppColors.background,
            subtitle: context.isLandingPhone
                ? 'Em emergências, o intervalo entre a triagem e a decisão médica é crítico. Falhas geram:'
                : 'Em emergências, o intervalo entre a triagem e a decisão médica é crítico. Falhas na\ncomunicação e falta de dados em tempo real geram:',
            spacingAfterSubtitle: context.responsiveValue(
              phone: 32,
              tablet: 48,
              desktop: 64,
            ),
          ),
          Wrap(
            spacing: context.responsiveValue(phone: 16, tablet: 24, desktop: 32),
            runSpacing: context.responsiveValue(phone: 16, tablet: 20, desktop: 24),
            alignment: WrapAlignment.center,
            children: [
              ProblemAlertCard(
                sectionMaxWidth: LandingBreakpoints.sectionMaxWidthNarrow,
                icon: Icons.error_outline_rounded,
                title: 'Desfechos Clínicos Desfavoráveis',
                description:
                    'Atraso na identificação de deterioração (NEWS2 elevado).',
                accentColor: AppColors.error,
                backgroundColor: AppColors.errorLight,
              ),
              ProblemAlertCard(
                sectionMaxWidth: LandingBreakpoints.sectionMaxWidthNarrow,
                icon: Icons.access_time_rounded,
                title: 'Insegurança Jurídica',
                description:
                    'Ausência de registros imutáveis sobre quem viu o alerta e por que a conduta foi tomada.',
                accentColor: AppColors.warning,
                backgroundColor: AppColors.warningLight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
