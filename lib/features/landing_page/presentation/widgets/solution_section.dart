import 'package:flutter/material.dart';
import 'package:landing_page_emergency/core/theme/app_theme.dart';

class SolutionSection extends StatelessWidget {
  const SolutionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 1024;

    return Container(
      color: AppColors.background,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 24,
          vertical: isMobile ? 60 : 100
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // TÍTULO
              Text(
                'A Solução: Decision Track & Suporte à Decisão',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 28 : 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),

              // SUBTÍTULO
              Text(
                isMobile
                    ? 'O Rescue transforma dados brutos de sinais vitais em inteligência clínica imediata.'
                    : 'O Rescue transforma dados brutos de sinais vitais em inteligência clínica imediata através do\nmódulo Decision Track.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 18 : 20,
                  color: AppColors.textSecondary,
                  height: 1.4,
                ),
              ),
               SizedBox(height: isMobile ? 48 : 80),

              // GRID DE CARDS (Usando Wrap para responsividade automática)
              Wrap(
                spacing: 24, // Espaço horizontal entre cards no Desktop
                runSpacing: 24, // Espaço vertical quando empilhar no Mobile
                alignment: WrapAlignment.center,
                children: [
                  _SolutionCard(
                    isMobile: isMobile,
                    icon: Icons.track_changes_rounded,
                    title: 'Triagem Inteligente',
                    description: 'Automação dos protocolos NEWS2 e Manchester para priorização automática de casos.',
                  ),
                  _SolutionCard(
                    isMobile: isMobile,
                    icon: Icons.psychology_outlined,
                    title: 'Sugestões Clínicas Ativas',
                    description: 'O sistema sugere condutas (ex: oxigenoterapia, ECG, protocolos de Sepse/AVC) baseadas no risco.',
                  ),
                  _SolutionCard(
                    isMobile: isMobile,
                    icon: Icons.shield_outlined,
                    title: 'Rastreabilidade Total',
                    description: 'Registro obrigatório de justificativas em caso de divergência do protocolo padrão.',
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
  final bool isMobile;

  const _SolutionCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    // Cálculo de largura:
    // No Desktop: (Máximo / 3 colunas) - descontando os espaços
    // No Mobile: Largura total da tela
    final cardWidth = isMobile
        ? MediaQuery.of(context).size.width
        : (1200 / 3) - 24;

    return Container(
      width: cardWidth,
      // No mobile, removemos o height fixo para o texto não vazar se a fonte for grande
      constraints: BoxConstraints(
        minHeight: isMobile ? 200 : 320,
      ),
      padding: EdgeInsets.all(isMobile ? 24 : 40),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2F4D).withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Ocupa apenas o espaço necessário
        children: [
          Icon(icon, color: Colors.white, size: isMobile ? 36 : 48),
          const SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
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