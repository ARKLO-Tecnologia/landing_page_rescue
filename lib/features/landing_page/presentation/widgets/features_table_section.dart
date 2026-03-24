import 'package:flutter/material.dart';
import 'package:landing_page_emergency/core/theme/app_theme.dart';

class FeaturesTableSection extends StatelessWidget {
  const FeaturesTableSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 1024;

    return Container(
      color: AppColors.surfaceGrey,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 24,
          vertical: isMobile ? 60 : 80
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              Text(
                'Funcionalidades de Alto Impacto',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 28 : 42,
                  fontWeight: FontWeight.bold,
                  color: AppColors.background,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'O sistema foi desenhado para os pilares do atendimento',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF475467),
                ),
              ),
              const SizedBox(height: 48),

              // Trocamos o GridView por Wrap para permitir empilhamento automático
              Wrap(
                spacing: 24, // Espaço lateral entre cards no desktop
                runSpacing: 24, // Espaço vertical entre cards no mobile
                alignment: WrapAlignment.center,
                children: [
                  _FeatureCard(
                    isMobile: isMobile,
                    icon: Icons.list_alt_rounded,
                    title: 'Trilhas Ativas',
                    description: 'Lista pacientes por score de risco e tempo de espera.',
                    highlight: 'Priorização real de casos críticos.',
                  ),
                  _FeatureCard(
                    isMobile: isMobile,
                    icon: Icons.visibility_outlined,
                    title: 'Proof of View',
                    description: 'Log de visualização de notificações e tempo de tela.',
                    highlight: 'Prova técnica de ciência do médico sobre o alerta.',
                  ),
                  _FeatureCard(
                    isMobile: isMobile,
                    icon: Icons.description_outlined,
                    title: 'ISBAR Automático',
                    description: 'Identificação, Situação, Background, Avaliação, Recomendação.',
                    highlight: 'Passagem de plantão segura e sem perda de dados.',
                  ),
                  _FeatureCard(
                    isMobile: isMobile,
                    icon: Icons.show_chart_rounded,
                    title: 'Timeline de Sinais',
                    description: 'Gráfico de tendência de NEWS2 e vitais ao longo do tempo.',
                    highlight: 'Identificação precoce de tendências de piora.',
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

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String highlight;
  final bool isMobile;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.highlight,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    // No Desktop, calcula a largura para 2 colunas. No Mobile, largura total.
    final double cardWidth = isMobile
        ? MediaQuery.of(context).size.width
        : (1100 / 2) - 20;

    return Container(
      width: cardWidth,
      padding: EdgeInsets.all(isMobile ? 20 : 24),
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Vital para o card não esticar sem necessidade
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Colors.white, size: 22),
              ),
              const SizedBox(width: 16),
              Expanded( // Expanded aqui evita erro de overflow no título
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.background,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF475467),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          // SELO DE DESTAQUE VERDE
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.successLight,
              borderRadius: BorderRadius.circular(4),
              border: const Border(
                left: BorderSide(color: AppColors.success, width: 4),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.check_circle_outline, color: AppColors.success, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    highlight,
                    style: const TextStyle(
                      color: Color(0xFF027A48),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}