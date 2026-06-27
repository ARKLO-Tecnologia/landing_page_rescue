import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/shared/extensions/responsive_context.dart';

class ResponsiveSplitLayout extends StatelessWidget {
  const ResponsiveSplitLayout({
    super.key,
    required this.start,
    required this.end,
    this.gapMobile = 48,
    this.gapTablet,
    this.gapDesktop = 64,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.stackAtTablet = true,
  });

  final Widget start;
  final Widget end;
  final double gapMobile;
  final double? gapTablet;
  final double gapDesktop;
  final CrossAxisAlignment crossAxisAlignment;
  final bool stackAtTablet;

  @override
  Widget build(BuildContext context) {
    final shouldStack = stackAtTablet
        ? context.isStackedLayout
        : context.isLandingPhone;

    final gap = context.responsiveValue(
      phone: gapMobile,
      tablet: gapTablet ?? ((gapMobile + gapDesktop) / 2),
      desktop: gapDesktop,
    );

    if (shouldStack) {
      return Column(
        crossAxisAlignment: _columnCrossAxisAlignment(crossAxisAlignment),
        children: [
          start,
          SizedBox(height: gap),
          end,
        ],
      );
    }

    return Row(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Expanded(child: start),
        SizedBox(width: gap),
        Expanded(child: end),
      ],
    );
  }

  CrossAxisAlignment _columnCrossAxisAlignment(
    CrossAxisAlignment alignment,
  ) {
    return switch (alignment) {
      CrossAxisAlignment.start => CrossAxisAlignment.start,
      CrossAxisAlignment.end => CrossAxisAlignment.end,
      CrossAxisAlignment.center ||
      CrossAxisAlignment.stretch ||
      CrossAxisAlignment.baseline =>
        CrossAxisAlignment.center,
    };
  }
}
