import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/shared/extensions/responsive_context.dart';
import 'package:rescue_pitchtech/shared/responsive/landing_breakpoints.dart';

class SectionContent extends StatelessWidget {
  const SectionContent({
    super.key,
    required this.child,
    this.maxWidth = LandingBreakpoints.sectionMaxWidthNarrow,
    this.horizontalPaddingMobile,
    this.horizontalPaddingDesktop,
    this.verticalPaddingMobile,
    this.verticalPaddingDesktop,
    this.compactBreakpoint,
  });

  final Widget child;
  final double maxWidth;
  final double? horizontalPaddingMobile;
  final double? horizontalPaddingDesktop;
  final double? verticalPaddingMobile;
  final double? verticalPaddingDesktop;
  final double? compactBreakpoint;

  bool _isCompact(BuildContext context) {
    final breakpoint = compactBreakpoint ?? LandingBreakpoints.desktop;
    return context.screenWidth < breakpoint;
  }

  @override
  Widget build(BuildContext context) {
    final isCompact = _isCompact(context);

    final horizontalPadding = isCompact
        ? (horizontalPaddingMobile ?? context.sectionHorizontalPadding)
        : (horizontalPaddingDesktop ?? context.sectionHorizontalPadding);

    final verticalPadding = isCompact
        ? (verticalPaddingMobile ?? context.sectionVerticalPadding)
        : (verticalPaddingDesktop ?? context.sectionVerticalPadding);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: child,
        ),
      ),
    );
  }
}
