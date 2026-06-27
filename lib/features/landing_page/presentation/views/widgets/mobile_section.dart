import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/shared/extensions/responsive_context.dart';
import 'package:rescue_pitchtech/shared/theme/app_theme.dart';
import 'package:rescue_pitchtech/shared/theme/app_text_styles.dart';
import 'package:rescue_pitchtech/shared/widgets/check_list_item.dart';
import 'package:rescue_pitchtech/shared/widgets/responsive_split_layout.dart';
import 'package:rescue_pitchtech/shared/widgets/section_container.dart';

class MobileSection extends StatelessWidget {
  const MobileSection({super.key});

  static const _features = [
    'Registro rápido de protocolos e sinais vitais.',
    'Checklists de procedimentos à beira-leito.',
    'Notificações de pendências críticas.',
  ];

  @override
  Widget build(BuildContext context) {
    final isStacked = context.isStackedLayout;
    final textAlign = isStacked ? TextAlign.center : TextAlign.left;
    final crossAxisAlignment =
        isStacked ? CrossAxisAlignment.center : CrossAxisAlignment.start;

    return SectionContainer.compact(
      backgroundColor: AppColors.surfaceWhite,
      child: ResponsiveSplitLayout(
        gapMobile: 32,
        gapTablet: 40,
        gapDesktop: 64,
        start: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Text(
              'Aplicativo Rescue',
              textAlign: textAlign,
              style: AppTextStyles.sectionTitle(
                context,
                color: AppColors.background,
                mobileSize: 24,
                tabletSize: 28,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Ferramenta pensada para a ponta assistencial: enfermeiros, médicos e equipes de apoio registram cada evento diretamente do smartphone.',
              textAlign: textAlign,
              style: AppTextStyles.bodyMuted(fontSize: 15, height: 1.5),
            ),
            const SizedBox(height: 32),
            for (final feature in _features)
              CheckListItem(
                text: feature,
                icon: Icons.check_circle_outline_rounded,
                iconColor: AppColors.success,
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBody,
                ),
              ),
          ],
        ),
        end: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: context.responsiveValue(
                phone: context.screenWidth * 0.75,
                tablet: 320,
                desktop: 380,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                'assets/imagens/celular.png',
                fit: BoxFit.contain,
                height: context.responsiveValue(
                  phone: 320,
                  tablet: 400,
                  desktop: 500,
                ),
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 320,
                    width: 250,
                    color: AppColors.background.withValues(alpha: 0.1),
                    child: const Icon(
                      Icons.smartphone,
                      size: 50,
                      color: AppColors.background,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
