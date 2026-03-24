import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class OperationFlowSection extends StatelessWidget {
  const OperationFlowSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    final steps = [
      'Chegada e triagem com protocolos estruturados.',
      'Classificação de risco e registro dos sinais vitais.',
      'Encaminhamento para sala adequada (observação, procedimento, etc.).',
      'Exames, medicações e intervenções registradas em tempo real.',
      'Alta, internação ou transferência com desfecho documentado.',
    ];

    return Container(
      // Usando a cor de fundo do seu AppTheme
      color: AppColors.background,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80,
          vertical: isMobile ? 60 : 100
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fluxo Operacional',
                style: TextStyle(
                  fontSize: isMobile ? 32 : 48,
                  fontWeight: FontWeight.bold,
                  // Título principal em branco para contraste no fundo escuro
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),

              Text(
                'Visualize o fluxo completo do paciente pela emergência, desde a chegada até o desfecho final.',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  // Usando a cor de texto secundário do seu tema
                  color: AppColors.textSecondary,
                  height: 1.6,
                ),
              ),
               SizedBox(height: isMobile ? 48 : 64),

              // Mantendo a estrutura de lista vertical da imagem
              Column(
                children: [
                  for (var i = 0; i < steps.length; i++)
                    _FlowStep(
                      index: i + 1,
                      text: steps[i],
                      isMobile: isMobile,
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
  final bool isMobile;

  const _FlowStep({
    required this.index,
    required this.text,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // O CÍRCULO NUMÉRICO
          Container(
            width: isMobile ? 36 : 40,
            height: isMobile ? 36 : 40,
            decoration: const BoxDecoration(
              // Usando a cor de destaque (Accent) do seu tema
              color: AppColors.accent,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$index',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  // O número fica escuro para contraste no fundo claro do círculo
                  color: AppColors.background,
                  fontSize: 18,
                ),
              ),
            ),
          ),

          const SizedBox(width: 20),

          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                // Usando cor branca ou texto primário para as descrições
                color: Colors.white,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}