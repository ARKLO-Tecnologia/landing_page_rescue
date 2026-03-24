import 'package:flutter/material.dart';
import 'package:landing_page_emergency/core/theme/app_theme.dart';
import 'package:landing_page_emergency/core/widgets/responsive_builder.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      // VERSÃO MOBILE
      phone: (context) => Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: AppColors.background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/imagens/logo_web.png',
              width: 120,
              fit: BoxFit.contain,
              color: Colors.white,
              colorBlendMode: BlendMode.srcIn,
            ),
            // O Builder garante um context "abaixo" do Scaffold para abrir o Drawer
            Builder(
              builder: (innerContext) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                onPressed: () {
                  Scaffold.of(innerContext).openEndDrawer();
                },
              ),
            ),
          ],
        ),
      ),

      // VERSÃO DESKTOP
      desktop: (context) => Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        color: AppColors.background,
        child: Row(
          children: [
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
            Expanded(
              flex: 3,
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
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        onPressed: () {
          // Lógica de Scroll ou Navegação aqui
          debugPrint('Navegando para: $title');
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}