import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class MobileSection extends StatelessWidget {
  const MobileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Usando fundo branco ou cinza muito claro para destacar a imagem
      color: AppColors.surfaceWhite,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center, // Centraliza imagem e texto verticalmente
            children: [
              // COLUNA DE TEXTO
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Aplicativo Rescue',
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: AppColors.background,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Ferramenta pensada para a ponta assistencial: enfermeiros, médicos e '
                          'equipes de apoio registram cada evento diretamente do smartphone.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF475467),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Lista de funcionalidades com o novo estilo de check verde
                    const _MobileFeature(text: 'Registro rápido de protocolos e sinais vitais.'),
                    const _MobileFeature(text: 'Checklists de procedimentos à beira-leito.'),
                    const _MobileFeature(text: 'Notificações de pendências críticas.'),
                  ],
                ),
              ),

              const SizedBox(width: 64), // Espaçamento entre texto e imagem

              // COLUNA DA IMAGEM (Substituindo o Ícone)
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24), // Bordas arredondadas modernas
                  child: Image.asset(
                    'assets/imagens/apk.png', // Caminho da sua imagem
                    fit: BoxFit.cover,
                    height: 500, // Altura para dar impacto visual
                    errorBuilder: (context, error, stackTrace) {
                      // Placeholder caso a imagem não carregue
                      return Container(
                        height: 500,
                        color: AppColors.background.withOpacity(0.1),
                        child: const Icon(Icons.image, size: 50),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MobileFeature extends StatelessWidget {
  final String text;

  const _MobileFeature({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // Ícone de check verde conforme a identidade visual
          const Icon(Icons.check_circle_outline_rounded, size: 22, color: AppColors.success),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF344054),
              ),
            ),
          ),
        ],
      ),
    );
  }
}