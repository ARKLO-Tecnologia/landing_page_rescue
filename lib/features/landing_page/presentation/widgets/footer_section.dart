import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800; // Footer pode quebrar um pouco antes

    return Container(
      color: AppColors.background,
      padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: isMobile ? 32 : 24
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Flex(
            // No mobile, empilhamos os textos para garantir leitura
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© ${DateTime.now().year} Rescue. Todos os direitos reservados.',
                textAlign: isMobile ? TextAlign.center : TextAlign.left,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),

              if (isMobile) const SizedBox(height: 16),

              Text(
                'Termos de Uso • Política de Privacidade',
                textAlign: isMobile ? TextAlign.center : TextAlign.right,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}