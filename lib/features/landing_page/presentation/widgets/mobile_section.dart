import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class MobileSection extends StatelessWidget {
  const MobileSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 1024;

    return Container(
      color: AppColors.surfaceWhite,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 40,
          vertical: isMobile ? 60 : 80
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Flex(
            // No mobile usamos Column (vertical), no desktop Row (horizontal)
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // COLUNA DE TEXTO
              Expanded(
                flex: isMobile ? 0 : 1, // No mobile o Expanded(0) não força altura
                child: Column(
                  crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Aplicativo Rescue',
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                      style: TextStyle(
                        fontSize: isMobile ? 32 : 42,
                        fontWeight: FontWeight.bold,
                        color: AppColors.background,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Ferramenta pensada para a ponta assistencial: enfermeiros, médicos e equipes de apoio registram cada evento diretamente do smartphone.',
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xFF475467),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),
                    const _MobileFeature(text: 'Registro rápido de protocolos e sinais vitais.'),
                    const _MobileFeature(text: 'Checklists de procedimentos à beira-leito.'),
                    const _MobileFeature(text: 'Notificações de pendências críticas.'),
                  ],
                ),
              ),

              // Espaçamento adaptativo
              SizedBox(
                  width: isMobile ? 0 : 64,
                  height: isMobile ? 48 : 0
              ),

              // COLUNA DA IMAGEM
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      'assets/imagens/apk.png',
                      fit: BoxFit.contain, // Contain é melhor para não cortar o celular na imagem
                      height: isMobile ? 400 : 500, // Altura um pouco menor no mobile
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 400,
                          width: 250,
                          color: AppColors.background.withValues(alpha: 0.1),
                          child: const Icon(Icons.smartphone, size: 50, color: AppColors.background),
                        );
                      },
                    ),
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
        mainAxisSize: MainAxisSize.min,
        children: [
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