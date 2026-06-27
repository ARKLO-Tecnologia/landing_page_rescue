import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/shared/extensions/responsive_context.dart';
import 'package:rescue_pitchtech/shared/responsive/landing_breakpoints.dart';
import 'package:rescue_pitchtech/shared/theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final isStacked = context.isStackedLayout;

    final minHeight = context.responsiveValue(
      phone: 440.0,
      tablet: 520.0,
      desktop: context.screenHeight * 0.65,
      wide: context.screenHeight * 0.7,
    );

    final maxHeight = isStacked
        ? double.infinity
        : context.responsiveValue(
            phone: double.infinity,
            tablet: double.infinity,
            desktop: context.screenHeight * 0.7,
          );

    final horizontalPadding = context.sectionHorizontalPadding;
    final titleSize = context.responsiveValue(
      phone: 24.0,
      tablet: 28.0,
      desktop: 32.0,
      wide: 34.0,
    );
    final subtitleSize = context.responsiveValue(
      phone: 14.0,
      tablet: 15.0,
      desktop: 16.0,
    );

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: minHeight,
        maxHeight: maxHeight,
      ),
      child: ColoredBox(
        color: AppColors.background,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: SizedBox(
                width: isStacked
                    ? screenWidth
                    : context.responsiveValue(
                        phone: screenWidth,
                        tablet: screenWidth * 0.65,
                        desktop: screenWidth * 0.6,
                      ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/imagens/medical.png',
                      fit: BoxFit.cover,
                      alignment: isStacked
                          ? Alignment.topCenter
                          : Alignment.centerLeft,
                      errorBuilder: (context, error, stackTrace) {
                        return ColoredBox(
                          color: AppColors.background.withValues(alpha: 0.2),
                          child: const Icon(
                            Icons.medical_services_outlined,
                            color: Colors.white24,
                            size: 64,
                          ),
                        );
                      },
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: isStacked
                              ? Alignment.topCenter
                              : Alignment.centerLeft,
                          end: isStacked
                              ? Alignment.bottomCenter
                              : Alignment.centerRight,
                          colors: [
                            AppColors.background,
                            AppColors.background.withValues(
                              alpha: isStacked ? 0.85 : 0.0,
                            ),
                          ],
                          stops: isStacked
                              ? const [0.35, 1.0]
                              : const [0.0, 0.45],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: context.responsiveValue(
                  phone: 48,
                  tablet: 56,
                  desktop: 0,
                ),
              ),
              child: Align(
                alignment:
                    isStacked ? Alignment.bottomCenter : Alignment.centerLeft,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: LandingBreakpoints.heroContentMaxWidth,
                  ),
                  child: Column(
                    mainAxisAlignment: isStacked
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.center,
                    crossAxisAlignment: isStacked
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gestão de Emergência com\nRastreabilidade Total',
                        textAlign:
                            isStacked ? TextAlign.center : TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                              color: Colors.white,
                              fontSize: titleSize,
                              fontWeight: FontWeight.bold,
                              height: 1.1,
                            ),
                      ),
                      SizedBox(
                        height: context.responsiveValue(
                          phone: 16,
                          tablet: 20,
                          desktop: 24,
                        ),
                      ),
                      Text(
                        'Implemente os protocolos NEWS2 e Manchester com segurança e monitore cada segundo garantindo agilidade e transparência.',
                        textAlign:
                            isStacked ? TextAlign.center : TextAlign.left,
                        style: TextStyle(
                          fontSize: subtitleSize,
                          color: Colors.white.withValues(alpha: 0.8),
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: context.responsiveValue(
                          phone: 32,
                          tablet: 40,
                          desktop: 48,
                        ),
                      ),
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
