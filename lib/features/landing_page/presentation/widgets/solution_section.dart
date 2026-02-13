import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class SolutionSection extends StatelessWidget {
  const SolutionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Fundo azul marinho profundo idêntico à imagem de referência
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // TÍTULO CENTRALIZADO
              const Text(
                'A Solução: Decision Track & Suporte à Decisão',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              // SUBTÍTULO
              const Text(
                'O Rescue transforma dados brutos de sinais vitais em inteligência clínica imediata através do\nmódulo Decision Track.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.textSecondary,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 80),

              // GRID DE CARDS (Três colunas)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    child: _SolutionCard(
                      icon: Icons.track_changes_rounded, // Ícone de alvo/triagem
                      title: 'Triagem Inteligente',
                      description:
                      'Automação dos protocolos NEWS2 e Manchester para priorização automática de casos.',
                    ),
                  ),
                  SizedBox(width: 24),
                  Expanded(
                    child: _SolutionCard(
                      icon: Icons.psychology_outlined, // Ícone de cérebro/sugestões
                      title: 'Sugestões Clínicas Ativas',
                      description:
                      'O sistema sugere condutas (ex: oxigenoterapia, ECG, protocolos de Sepse/AVC) baseadas no risco do paciente.',
                    ),
                  ),
                  SizedBox(width: 24),
                  Expanded(
                    child: _SolutionCard(
                      icon: Icons.shield_outlined, // Ícone de escudo/rastreabilidade
                      title: 'Rastreabilidade Total',
                      description:
                      'Registro obrigatório de justificativas em caso de divergência do protocolo padrão.',
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

class _SolutionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _SolutionCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        // Cor do card ligeiramente mais clara que o fundo para destaque
        color: const Color(0xFF1E2F4D).withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 48),
          const SizedBox(height: 32),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}