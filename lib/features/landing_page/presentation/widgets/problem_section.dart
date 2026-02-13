import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class ProblemSection extends StatelessWidget {
  const ProblemSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Usando a nova cor de superfície branca para destacar os cards
      color: AppColors.surfaceWhite,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              // TÍTULO CENTRALIZADO
              const Text(
                'O Problema: O "Gap" de 5 Minutos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: AppColors.background, // Azul marinho profundo do seu tema
                ),
              ),
              const SizedBox(height: 24),

              // SUBTÍTULO
              const Text(
                'Em emergências, o intervalo entre a triagem e a decisão médica é crítico. Falhas na\ncomunicação e falta de dados em tempo real geram:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF475467), // Cor para subtítulo em fundo claro
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 64),

              // CARDS DE PROBLEMA
              Row(
                children: [
                  // CARD 1: Desfechos Clínicos (Usa as novas cores de Erro)
                  Expanded(
                    child: _buildProblemCard(
                      icon: Icons.error_outline_rounded,
                      title: 'Desfechos Clínicos Desfavoráveis',
                      description: 'Atraso na identificação de deterioração (NEWS2 elevado).',
                      accentColor: AppColors.error, // Vermelho do tema
                      backgroundColor: AppColors.errorLight, // Fundo rosa do tema
                    ),
                  ),
                  const SizedBox(width: 32),
                  // CARD 2: Insegurança Jurídica (Usa as novas cores de Aviso)
                  Expanded(
                    child: _buildProblemCard(
                      icon: Icons.access_time_rounded,
                      title: 'Insegurança Jurídica',
                      description: 'Ausência de registros imutáveis sobre quem viu o alerta e por que a conduta foi tomada.',
                      accentColor: AppColors.warning, // Laranja do tema
                      backgroundColor: AppColors.warningLight, // Fundo creme do tema
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

  Widget _buildProblemCard({
    required IconData icon,
    required String title,
    required String description,
    required Color accentColor,
    required Color backgroundColor,
  }) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // Borda colorida na lateral esquerda
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 6,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
          ),
          // Conteúdo do Card
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: accentColor, size: 42),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: accentColor.withOpacity(0.9), // Texto levemente mais suave
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
        ],
      ),
    );
  }
}