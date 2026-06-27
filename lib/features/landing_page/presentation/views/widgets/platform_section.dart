import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/shared/extensions/responsive_context.dart';
import 'package:rescue_pitchtech/shared/theme/app_theme.dart';
import 'package:rescue_pitchtech/shared/theme/app_text_styles.dart';
import 'package:rescue_pitchtech/shared/widgets/check_list_item.dart';
import 'package:rescue_pitchtech/shared/widgets/responsive_split_layout.dart';
import 'package:rescue_pitchtech/shared/widgets/section_container.dart';

class PlatformSection extends StatelessWidget {
  const PlatformSection({super.key});

  static const _bullets = [
    'Mapa de leitos e salas da emergência.',
    'Indicadores de desempenho em tempo real.',
    'Relatórios customizáveis por período e tipo de caso.',
  ];

  @override
  Widget build(BuildContext context) {
    final isStacked = context.isStackedLayout;
    final textAlign = isStacked ? TextAlign.center : TextAlign.left;
    final crossAxisAlignment =
        isStacked ? CrossAxisAlignment.center : CrossAxisAlignment.start;

    return SectionContainer(
      backgroundColor: AppColors.primary.withValues(alpha: 0.7),
      maxWidth: 1040,
      child: ResponsiveSplitLayout(
        crossAxisAlignment: CrossAxisAlignment.start,
        gapMobile: 28,
        gapTablet: 32,
        gapDesktop: 48,
        start: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Text(
              'Plataforma Web',
              textAlign: textAlign,
              style: AppTextStyles.cardTitle(
                context,
                color: AppColors.textPrimary,
              ).copyWith(
                fontSize: context.responsiveValue(
                  phone: 19,
                  tablet: 21,
                  desktop: 23,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Interface web para coordenação da emergência, núcleos de segurança '
              'do paciente e diretoria clínica, com visão macro da operação.',
              textAlign: textAlign,
              style: AppTextStyles.bodyMuted(height: 1.5).copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        end: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Text(
              'Principais recursos',
              textAlign: textAlign,
              style: TextStyle(
                fontSize: context.responsiveValue(
                  phone: 14,
                  tablet: 15,
                  desktop: 16,
                ),
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            for (final bullet in _bullets)
              CheckListItem(
                text: bullet,
                icon: Icons.check_circle,
                iconColor: AppColors.accent,
                padding: const EdgeInsets.symmetric(vertical: 4),
                textStyle: AppTextStyles.bodyMuted(fontSize: 14).copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
