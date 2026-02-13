import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class ForensicDifferentialSection extends StatelessWidget {
  const ForensicDifferentialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // TÍTULO CENTRALIZADO
              const Text(
                'Diferencial Único: A Reconstrução Forense',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: AppColors.background, // Azul marinho do tema
                ),
              ),
              const SizedBox(height: 24),
              // SUBTÍTULO COM DESTAQUE "CAIXA-PRETA"
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(fontSize: 20, color: Color(0xFF475467), height: 1.4),
                  children: [
                    TextSpan(text: 'Diferente de prontuários comuns, o Rescue atua como uma '),
                    TextSpan(
                      text: 'caixa-preta hospitalar:',
                      style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.background),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),

              // GRID DE DIFERENCIAIS
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    child: _ForensicCard(
                      icon: Icons.lock_outline_rounded,
                      title: 'Imutabilidade',
                      description: 'Registros protegidos contra edições retroativas, garantindo compliance legal.',
                    ),
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    child: _ForensicCard(
                      icon: Icons.error_outline_rounded,
                      title: 'Shadow Records',
                      description: 'O sistema registra omissões (quando um alerta não é atendido no prazo) para auditoria de gestão.',
                    ),
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    child: _ForensicCard(
                      icon: Icons.content_paste_search_rounded,
                      title: 'Relatório de Investigação',
                      description: 'Em caso de incidentes críticos ou óbitos, o sistema gera uma reconstrução forense completa.',
                    ),
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

class _ForensicCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ForensicCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ÍCONE CIRCULAR ESCURO
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            color: AppColors.background,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 36),
        ),
        const SizedBox(height: 32),
        // TÍTULO DO DIFERENCIAL
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.background,
          ),
        ),
        const SizedBox(height: 16),
        // DESCRIÇÃO DETALHADA
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF475467),
            height: 1.5,
          ),
        ),
      ],
    );
  }
}