import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class OperationFlowSection extends StatelessWidget {
  const OperationFlowSection({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = [
      'Chegada e triagem com protocolos estruturados.',
      'Classificação de risco e registro dos sinais vitais.',
      'Encaminhamento para sala adequada (observação, procedimento, etc.).',
      'Exames, medicações e intervenções registradas em tempo real.',
      'Alta, internação ou transferência com desfecho documentado.',
    ];

    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 960),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Fluxo Operacional',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Visualize o fluxo completo do paciente pela emergência, desde a chegada até o desfecho final.',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Column(
                children: [
                  for (var i = 0; i < steps.length; i++)
                    _FlowStep(
                      index: i + 1,
                      text: steps[i],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FlowStep extends StatelessWidget {
  final int index;
  final String text;

  const _FlowStep({required this.index, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.accent,
            child: Text(
              '$index',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

