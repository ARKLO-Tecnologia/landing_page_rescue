import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/shared/extensions/responsive_context.dart';

/// Calcula a largura de um card dentro de um [Wrap] responsivo.
double responsiveCardWidth(
  BuildContext context, {
  required double sectionMaxWidth,
  required int phoneColumns,
  int? tabletColumns,
  required int desktopColumns,
  int? wideColumns,
  double spacing = 24,
}) {
  final columns = context.gridColumns(
    phone: phoneColumns,
    tablet: tabletColumns,
    desktop: desktopColumns,
    wide: wideColumns,
  );

  if (columns <= 1) {
    return double.infinity;
  }

  final horizontalPadding = context.sectionHorizontalPadding * 2;
  final availableWidth = (sectionMaxWidth <
          context.screenWidth - horizontalPadding)
      ? sectionMaxWidth
      : context.screenWidth - horizontalPadding;

  final totalSpacing = spacing * (columns - 1);
  return (availableWidth - totalSpacing) / columns;
}
