import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/cards/flow_step_item.dart';
import 'package:rescue_pitchtech/shared/extensions/responsive_context.dart';
import 'package:rescue_pitchtech/shared/responsive/landing_breakpoints.dart';
import 'package:rescue_pitchtech/shared/theme/app_theme.dart';
import 'package:rescue_pitchtech/shared/theme/app_text_styles.dart';
import 'package:rescue_pitchtech/shared/widgets/section_container.dart';

class OperationFlowSection extends StatelessWidget {
  const OperationFlowSection({super.key});

  static const _steps = [
    'Chegada e triagem com protocolos estruturados.',
    'Classificação de risco e registro dos sinais vitais.',
    'Encaminhamento para sala adequada (observação, procedimento, etc.).',
    'Exames, medicações e intervenções registradas em tempo real.',
    'Alta, internação ou transferência com desfecho documentado.',
  ];

  @override
  Widget build(BuildContext context) {
    final isCompact = context.isOperationFlowCompact;

    return SectionContainer.wide(
      backgroundColor: AppColors.background,
      compactBreakpoint: LandingBreakpoints.operationFlowCompact,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fluxo Operacional',
            style: AppTextStyles.sectionTitleLarge(
              context,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Visualize o fluxo completo do paciente pela emergência, desde a chegada até o desfecho final.',
            style: AppTextStyles.sectionSubtitle(
              context,
              color: AppColors.textSecondary,
              mobileSize: 16,
              desktopSize: 18,
              height: 1.6,
            ),
          ),
          SizedBox(height: isCompact ? 48 : 64),
          Column(
            children: [
              for (var i = 0; i < _steps.length; i++)
                FlowStepItem(index: i + 1, text: _steps[i]),
            ],
          ),
        ],
      ),
    );
  }
}
