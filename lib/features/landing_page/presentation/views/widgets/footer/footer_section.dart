import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/footer/footer_link.dart';
import 'package:rescue_pitchtech/shared/config/environment.dart';
import 'package:rescue_pitchtech/shared/extensions/responsive_context.dart';
import 'package:rescue_pitchtech/shared/responsive/landing_breakpoints.dart';
import 'package:rescue_pitchtech/shared/theme/app_theme.dart';
import 'package:rescue_pitchtech/shared/widgets/section_content.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isCompact = context.isFooterCompact;

    return ColoredBox(
      color: AppColors.background,
      child: SectionContent(
        horizontalPaddingMobile: 24,
        horizontalPaddingDesktop: 24,
        verticalPaddingMobile: 32,
        verticalPaddingDesktop: 24,
        compactBreakpoint: LandingBreakpoints.footerCompact,
        child: Wrap(
          alignment: isCompact ? WrapAlignment.center : WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: 12,
          spacing: 12,
          children: [
            Text(
              '© ${DateTime.now().year} Rescue. Todos os direitos reservados.',
              textAlign: isCompact ? TextAlign.center : TextAlign.left,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
            const Wrap(
              spacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                FooterLink(label: 'Termos de Uso', url: Environment.termsUrl),
                Text('•', style: TextStyle(color: AppColors.textSecondary)),
                FooterLink(
                  label: 'Política de Privacidade',
                  url: Environment.privacyUrl,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
