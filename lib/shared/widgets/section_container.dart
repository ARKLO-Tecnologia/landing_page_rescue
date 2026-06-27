import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/shared/responsive/landing_breakpoints.dart';
import 'package:rescue_pitchtech/shared/widgets/section_content.dart';

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.backgroundColor,
    required this.child,
    this.maxWidth = LandingBreakpoints.sectionMaxWidthNarrow,
    this.horizontalPaddingMobile = 20,
    this.horizontalPaddingDesktop = 24,
    this.verticalPaddingMobile = 60,
    this.verticalPaddingDesktop = 80,
    this.compactBreakpoint,
  });

  const SectionContainer.wide({
    super.key,
    required this.backgroundColor,
    required this.child,
    this.maxWidth = LandingBreakpoints.sectionMaxWidthWide,
    this.horizontalPaddingMobile = 24,
    this.horizontalPaddingDesktop = 80,
    this.verticalPaddingMobile = 60,
    this.verticalPaddingDesktop = 100,
    this.compactBreakpoint,
  });

  const SectionContainer.compact({
    super.key,
    required this.backgroundColor,
    required this.child,
    this.maxWidth = LandingBreakpoints.sectionMaxWidthNarrow,
    this.horizontalPaddingMobile = 24,
    this.horizontalPaddingDesktop = 40,
    this.verticalPaddingMobile = 60,
    this.verticalPaddingDesktop = 80,
    this.compactBreakpoint,
  });

  final Color backgroundColor;
  final Widget child;
  final double maxWidth;
  final double horizontalPaddingMobile;
  final double horizontalPaddingDesktop;
  final double verticalPaddingMobile;
  final double verticalPaddingDesktop;
  final double? compactBreakpoint;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: SectionContent(
        maxWidth: maxWidth,
        horizontalPaddingMobile: horizontalPaddingMobile,
        horizontalPaddingDesktop: horizontalPaddingDesktop,
        verticalPaddingMobile: verticalPaddingMobile,
        verticalPaddingDesktop: verticalPaddingDesktop,
        compactBreakpoint: compactBreakpoint,
        child: child,
      ),
    );
  }
}
