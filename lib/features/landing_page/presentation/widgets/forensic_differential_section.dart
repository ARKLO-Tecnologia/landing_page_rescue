import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class ForensicDifferentialSection extends StatelessWidget {
  const ForensicDifferentialSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 1024;

    return Container(
      color: AppColors.primary,
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
                'Diferencial Único: A Reconstrução Forense',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 28 : 42, // Ajuste para mobile
                  fontWeight: FontWeight.bold,
                  color: AppColors.background,
                ),
              ),
              const SizedBox(height: 24),

              // SUBTÍTULO
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                      fontSize: isMobile ? 18 : 20,
                      color: const Color(0xFF475467),
                      height: 1.4
                  ),
                  children: const [
                    TextSpan(text: 'Diferente de prontuários comuns, o Rescue atua como uma '),
                    TextSpan(
                      text: 'caixa-preta hospitalar:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.background
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(height: isMobile ? 48 : 80),

              // GRID DE DIFERENCIAIS (Wrap resolve o empilhamento)
              Wrap(
                spacing: 40, // Espaço entre colunas no Desktop
                runSpacing: 48, // Espaço entre linhas no Mobile
                alignment: WrapAlignment.center,
                children: [
                  _ForensicCard(
                    isMobile: isMobile,
                    icon: Icons.lock_outline_rounded,
                    title: 'Imutabilidade',
                    description: 'Registros protegidos contra edições retroativas, garantindo compliance legal.',
                  ),
                  _ForensicCard(
                    isMobile: isMobile,
                    icon: Icons.error_outline_rounded,
                    title: 'Shadow Records',
                    description: 'O sistema registra omissões (quando um alerta não é atendido no prazo) para auditoria.',
                  ),
                  _ForensicCard(
                    isMobile: isMobile,
                    icon: Icons.content_paste_search_rounded,
                    title: 'Relatório de Investigação',
                    description: 'Em caso de incidentes críticos ou óbitos, o sistema gera uma reconstrução forense completa.',
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
  final bool isMobile;

  const _ForensicCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    // No desktop divide por 3, no mobile ocupa a largura disponível
    final double cardWidth = isMobile
        ? MediaQuery.of(context).size.width
        : (1200 / 3) - 30;

    return SizedBox(
      width: cardWidth,
      child: Column(
        children: [
          // ÍCONE
          Container(
            width: isMobile ? 64 : 80,
            height: isMobile ? 64 : 80,
            decoration: const BoxDecoration(
              color: AppColors.background,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: isMobile ? 28 : 36),
          ),
           SizedBox(height: isMobile ? 20 : 32),
          // TÍTULO
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: AppColors.background,
            ),
          ),
          const SizedBox(height: 16),
          // DESCRIÇÃO
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
      ),
    );
  }
}