import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/cards/feature_highlight_card.dart';
import 'package:rescue_pitchtech/shared/extensions/responsive_context.dart';
import 'package:rescue_pitchtech/shared/theme/app_theme.dart';
import 'package:rescue_pitchtech/shared/widgets/section_container.dart';
import 'package:rescue_pitchtech/shared/widgets/section_header.dart';

class FeaturesTableSection extends StatelessWidget {
  const FeaturesTableSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      backgroundColor: AppColors.surfaceGrey,
      child: Column(
        children: [
          SectionHeader(
            title: 'Funcionalidades de Alto Impacto',
            titleColor: AppColors.background,
            subtitle: context.isLandingPhone
                ? 'O sistema foi desenhado para os pilares do atendimento'
                : 'O sistema foi desenhado para os pilares do atendimento em emergência',
            spacingAfterTitle: 12,
          ),
          Wrap(
            spacing: context.responsiveValue(phone: 16, tablet: 20, desktop: 24),
            runSpacing: context.responsiveValue(phone: 16, tablet: 20, desktop: 24),
            alignment: WrapAlignment.center,
            children: const [
              FeatureHighlightCard(
                icon: Icons.list_alt_rounded,
                title: 'Trilhas Ativas',
                description:
                    'Lista pacientes por score de risco e tempo de espera.',
                highlight: 'Priorização real de casos críticos.',
              ),
              FeatureHighlightCard(
                icon: Icons.visibility_outlined,
                title: 'Proof of View',
                description:
                    'Log de visualização de notificações e tempo de tela.',
                highlight:
                    'Prova técnica de ciência do médico sobre o alerta.',
              ),
              FeatureHighlightCard(
                icon: Icons.description_outlined,
                title: 'ISBAR Automático',
                description:
                    'Identificação, Situação, Background, Avaliação, Recomendação.',
                highlight: 'Passagem de plantão segura e sem perda de dados.',
              ),
              FeatureHighlightCard(
                icon: Icons.show_chart_rounded,
                title: 'Timeline de Sinais',
                description:
                    'Gráfico de tendência de NEWS2 e vitais ao longo do tempo.',
                highlight: 'Identificação precoce de tendências de piora.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
