import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/cards/forensic_feature_card.dart';
import 'package:rescue_pitchtech/shared/extensions/responsive_context.dart';
import 'package:rescue_pitchtech/shared/theme/app_theme.dart';
import 'package:rescue_pitchtech/shared/theme/app_text_styles.dart';
import 'package:rescue_pitchtech/shared/widgets/section_container.dart';
import 'package:rescue_pitchtech/shared/widgets/section_header.dart';

class ForensicDifferentialSection extends StatelessWidget {
  const ForensicDifferentialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer.wide(
      backgroundColor: AppColors.primary,
      child: Column(
        children: [
          SectionHeader(
            title: 'Diferencial Único: A Reconstrução Forense',
            titleColor: AppColors.background,
            spacingAfterSubtitle: context.responsiveValue(
              phone: 40,
              tablet: 56,
              desktop: 80,
            ),
            subtitleWidget: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: AppTextStyles.sectionSubtitle(context),
                children: const [
                  TextSpan(
                    text:
                        'Diferente de prontuários comuns, o Rescue atua como uma ',
                  ),
                  TextSpan(
                    text: 'caixa-preta hospitalar:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.background,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Wrap(
            spacing: context.responsiveValue(phone: 24, tablet: 32, desktop: 40),
            runSpacing: context.responsiveValue(phone: 32, tablet: 40, desktop: 48),
            alignment: WrapAlignment.center,
            children: const [
              ForensicFeatureCard(
                icon: Icons.lock_outline_rounded,
                title: 'Imutabilidade',
                description:
                    'Registros protegidos contra edições retroativas, garantindo compliance legal.',
              ),
              ForensicFeatureCard(
                icon: Icons.error_outline_rounded,
                title: 'Shadow Records',
                description:
                    'O sistema registra omissões (quando um alerta não é atendido no prazo) para auditoria.',
              ),
              ForensicFeatureCard(
                icon: Icons.content_paste_search_rounded,
                title: 'Relatório de Investigação',
                description:
                    'Em caso de incidentes críticos ou óbitos, o sistema gera uma reconstrução forense completa.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
