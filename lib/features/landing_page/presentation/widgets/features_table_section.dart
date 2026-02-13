import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class FeaturesTableSection extends StatelessWidget {
  const FeaturesTableSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surfaceGrey,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60), // Reduzi levemente o padding vertical da seção
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100), // Reduzi a largura máxima para aproximar os cards lateralmente
          child: Column(
            children: [
              Text(
                'Funcionalidades de Alto Impacto',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 42,
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
              const SizedBox(height: 48), // Reduzi a distância entre título e grid

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16, // Reduzi de 24 para 16 (distância vertical entre cards)
                crossAxisSpacing: 16, // Reduzi de 24 para 16 (distância horizontal entre cards)
                childAspectRatio: 2.4, // Aumentei o ratio para o card ficar mais baixo e "puxar" o de baixo para cima
                children: const [
                  _FeatureCard(
                    icon: Icons.list_alt_rounded,
                    title: 'Trilhas Ativas',
                    description: 'Lista pacientes por score de risco e tempo de espera.',
                    highlight: 'Priorização real de casos críticos.',
                  ),
                  _FeatureCard(
                    icon: Icons.visibility_outlined,
                    title: 'Proof of View',
                    description: 'Log de visualização de notificações e tempo de tela.',
                    highlight: 'Prova técnica de ciência do médico sobre o alerta.',
                  ),
                  _FeatureCard(
                    icon: Icons.description_outlined,
                    title: 'ISBAR Automático',
                    description: 'Identificação, Situação, Background, Avaliação, Recomendação.',
                    highlight: 'Passagem de plantão segura e sem perda de dados.',
                  ),
                  _FeatureCard(
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

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.highlight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(12), // Bordas arredondadas suaves
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Faz o container se ajustar ao conteúdo
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center, // Alinhado ao centro como na imagem
            children: [
              // BOX DO ÍCONE
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 16),
              // TÍTULO
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24, // Fonte maior conforme referência
                  fontWeight: FontWeight.bold,
                  color: AppColors.background,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16), // Espaço fixo
          // DESCRIÇÃO
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF475467),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20), // Espaço antes do destaque
          // SELO DE DESTAQUE VERDE
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.successLight, // Verde claro
              borderRadius: BorderRadius.circular(4),
              border: const Border(
                left: BorderSide(color: AppColors.success, width: 4), // Barra lateral verde
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.check, color: AppColors.success, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    highlight,
                    style: const TextStyle(
                      color: Color(0xFF027A48), // Verde escuro
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
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