import 'package:flutter/material.dart';
import 'package:landing_page_emergency/core/theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 1024;

    return ConstrainedBox(
      constraints: BoxConstraints(
        // No mobile, a altura é flexível para evitar overflow (min 500)
        // No desktop, fixamos em 70% da tela
        minHeight: isMobile ? 500 : MediaQuery.of(context).size.height * 0.7,
        maxHeight: isMobile ? double.infinity : MediaQuery.of(context).size.height * 0.7,
      ),
      child: Container(
        width: double.infinity,
        color: AppColors.background,
        child: Stack(
          children: [
            // IMAGEM DE FUNDO / LATERAL
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: isMobile
                    ? screenWidth
                    : screenWidth * 0.6,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/imagens/medical.png'),
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: isMobile ? Alignment.topCenter : Alignment.centerLeft,
                      end: isMobile ? Alignment.bottomCenter : Alignment.centerRight,
                      colors: [
                        AppColors.background,
                        AppColors.background.withValues(alpha: isMobile ? 0.8 : 0.0),
                      ],
                      stops: isMobile ? const [0.4, 1.0] : const [0.0, 0.4],
                    ),
                  ),
                ),
              ),
            ),

            // CONTEÚDO (TEXTO)
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 24 : 80,
                  vertical: isMobile ? 60 : 0
              ),
              child: Align(
                alignment: isMobile ? Alignment.center : Alignment.centerLeft,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 650),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gestão de Emergência com\nRastreabilidade Total',
                        textAlign: isMobile ? TextAlign.center : TextAlign.left,
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: Colors.white,
                          fontSize: isMobile ? 32 : 40,
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Implemente os protocolos NEWS2 e Manchester com segurança e monitore cada segundo garantindo agilidade e transparência.',
                        textAlign: isMobile ? TextAlign.center : TextAlign.left,
                        style: TextStyle(
                          fontSize: isMobile ? 18 : 20,
                          color: Colors.white.withValues(alpha: 0.8),
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 48),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}