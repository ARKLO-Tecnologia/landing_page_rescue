import 'package:flutter/material.dart';
import 'package:landing_page_emergency/core/theme/app_theme.dart';

class ProblemSection extends StatelessWidget {
  const ProblemSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 1024;

    return Container(
      color: AppColors.surfaceWhite,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 24,
          vertical: isMobile ? 60 : 80
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              // TÍTULO
              Text(
                'O Problema: O "Gap" de 5 Minutos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 28 : 42, // Reduzido no mobile
                  fontWeight: FontWeight.bold,
                  color: AppColors.background,
                ),
              ),
              const SizedBox(height: 24),

              // SUBTÍTULO
              Text(
                isMobile
                    ? 'Em emergências, o intervalo entre a triagem e a decisão médica é crítico. Falhas geram:'
                    : 'Em emergências, o intervalo entre a triagem e a decisão médica é crítico. Falhas na\ncomunicação e falta de dados em tempo real geram:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 18 : 20,
                  color: const Color(0xFF475467),
                  height: 1.4,
                ),
              ),
              SizedBox(height: isMobile ? 40 : 64),

              // CARDS DE PROBLEMA (Usando Wrap para auto-empilhamento)
              Wrap(
                spacing: 32, // Espaço horizontal entre cards
                runSpacing: 24, // Espaço vertical quando empilhar
                alignment: WrapAlignment.center,
                children: [
                  _buildProblemCard(
                    context,
                    isMobile,
                    icon: Icons.error_outline_rounded,
                    title: 'Desfechos Clínicos Desfavoráveis',
                    description: 'Atraso na identificação de deterioração (NEWS2 elevado).',
                    accentColor: AppColors.error,
                    backgroundColor: AppColors.errorLight,
                  ),
                  _buildProblemCard(
                    context,
                    isMobile,
                    icon: Icons.access_time_rounded,
                    title: 'Insegurança Jurídica',
                    description: 'Ausência de registros imutáveis sobre quem viu o alerta e por que a conduta foi tomada.',
                    accentColor: AppColors.warning,
                    backgroundColor: AppColors.warningLight,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProblemCard(
      BuildContext context,
      bool isMobile, {
        required IconData icon,
        required String title,
        required String description,
        required Color accentColor,
        required Color backgroundColor,
      }) {
    // No Desktop, largura fixa para caber 2 na Row. No Mobile, largura total.
    final cardWidth = isMobile
        ? MediaQuery.of(context).size.width
        : (1100 / 2) - 16;

    return Container(
      width: cardWidth,
      // No mobile tiramos o height fixo para o texto não vazar
      constraints: BoxConstraints(minHeight: isMobile ? 0 : 180),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IntrinsicHeight( // Faz a borda lateral acompanhar a altura do texto
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Borda colorida na lateral esquerda
            Container(
              width: 6,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
            // Conteúdo do Card
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 20 : 32),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(icon, color: accentColor, size: isMobile ? 32 : 42),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: isMobile ? 18 : 22,
                              fontWeight: FontWeight.bold,
                              color: accentColor.withValues(alpha: 0.9),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            description,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF475467),
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}