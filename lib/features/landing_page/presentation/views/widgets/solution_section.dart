import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/cards/solution_feature_card.dart';
import 'package:rescue_pitchtech/shared/extensions/responsive_context.dart';
import 'package:rescue_pitchtech/shared/theme/app_theme.dart';
import 'package:rescue_pitchtech/shared/widgets/section_container.dart';
import 'package:rescue_pitchtech/shared/widgets/section_header.dart';

class SolutionSection extends StatelessWidget {
  const SolutionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer.wide(
      backgroundColor: AppColors.background,
      child: Column(
        children: [
          SectionHeader(
            title: 'A Solução: Decision Track & Suporte à Decisão',
            titleColor: Colors.white,
            subtitle: context.isLandingPhone
                ? 'O Rescue transforma dados brutos de sinais vitais em inteligência clínica imediata.'
                : 'O Rescue transforma dados brutos de sinais vitais em inteligência clínica imediata através do\nmódulo Decision Track.',
            subtitleColor: AppColors.textSecondary,
            spacingAfterSubtitle: context.responsiveValue(
              phone: 40,
              tablet: 56,
              desktop: 80,
            ),
          ),
          Wrap(
            spacing: context.responsiveValue(phone: 16, tablet: 20, desktop: 24),
            runSpacing: context.responsiveValue(phone: 16, tablet: 20, desktop: 24),
            alignment: WrapAlignment.center,
            children: const [
              SolutionFeatureCard(
                icon: Icons.track_changes_rounded,
                title: 'Triagem Inteligente',
                description:
                    'Automação dos protocolos NEWS2 e Manchester para priorização automática de casos.',
              ),
              SolutionFeatureCard(
                icon: Icons.psychology_outlined,
                title: 'Sugestões Clínicas Ativas',
                description:
                    'O sistema sugere condutas (ex: oxigenoterapia, ECG, protocolos de Sepse/AVC) baseadas no risco.',
              ),
              SolutionFeatureCard(
                icon: Icons.shield_outlined,
                title: 'Rastreabilidade Total',
                description:
                    'Registro obrigatório de justificativas em caso de divergência do protocolo padrão.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
