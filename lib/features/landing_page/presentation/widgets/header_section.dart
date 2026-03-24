import 'package:flutter/material.dart';
import 'package:landing_page_emergency/core/theme/app_theme.dart';
import 'package:landing_page_emergency/core/widgets/responsive_builder.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      // VERSÃO MOBILE: Simples e direta para não quebrar
      phone: (context) => Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: AppColors.background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Logo de um lado, ícone do outro
          children: [
            Image.asset(
              'assets/imagens/logo_web.png',
              width: 120, // Reduzi um pouco para telas menores
              fit: BoxFit.contain,
              color: Colors.white,
              colorBlendMode: BlendMode.srcIn,
            ),
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white, size: 28),
              onPressed: () {
                // Abre o menu lateral que você configurou no Scaffold
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ],
        ),
      ),

      // VERSÃO DESKTOP: Centralizada com a técnica do "Espaço Fantasma"
      desktop: (context) => Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        color: AppColors.background,
        child: Row(
          children: [
            // 1. Logo à Esquerda
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/imagens/logo_web.png',
                  width: 190,
                  fit: BoxFit.contain,
                  color: Colors.white,
                  colorBlendMode: BlendMode.srcIn,
                ),
              ),
            ),

            // 2. Menu Centralizado
            Expanded(
              flex: 3, // Damos mais peso ao centro para os itens não encavalarem
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _navItem('Funcionalidades'),
                  _navItem('Triagem NEWS2'),
                  _navItem('Protocolos'),
                  _navItem('Decision Track'),
                ],
              ),
            ),

            // 3. Espaço Fantasma à Direita (Equilibra o flex: 1 da Logo)
            const Expanded(
              flex: 1,
              child: SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8), // Reduzi um pouco o padding lateral
      child: TextButton(
        onPressed: () {
          // Aqui entrará a lógica de scroll no futuro
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}