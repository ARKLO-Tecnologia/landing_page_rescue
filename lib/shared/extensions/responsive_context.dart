import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/shared/responsive/landing_breakpoints.dart';
import 'package:rescue_pitchtech/shared/responsive/landing_display_size.dart';

extension ResponsiveContext on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  LandingDisplaySize get displaySize =>
      LandingBreakpoints.displaySizeFor(screenWidth);

  bool get isLandingPhone => screenWidth < LandingBreakpoints.phone;

  /// Layout empilhado (coluna) em phone e tablet.
  bool get isLandingMobile => screenWidth < LandingBreakpoints.tablet;

  bool get isStackedLayout => isLandingMobile;

  bool get isFooterCompact => screenWidth < LandingBreakpoints.footerCompact;

  bool get isOperationFlowCompact =>
      screenWidth < LandingBreakpoints.operationFlowCompact;

  /// Retorna um valor conforme o tamanho atual da tela.
  T responsiveValue<T>({
    required T phone,
    T? tablet,
    required T desktop,
    T? wide,
    T? ultraWide,
  }) {
    return switch (displaySize) {
      LandingDisplaySize.ultraWide => ultraWide ?? wide ?? desktop,
      LandingDisplaySize.wide => wide ?? desktop,
      LandingDisplaySize.desktop => desktop,
      LandingDisplaySize.tablet => tablet ?? phone,
      LandingDisplaySize.phone => phone,
    };
  }

  /// Colunas de grid responsivas para cards em [Wrap].
  int gridColumns({
    required int phone,
    int? tablet,
    required int desktop,
    int? wide,
  }) {
    final resolvedTablet = tablet ?? ((phone + desktop) ~/ 2).clamp(phone, desktop);
    return responsiveValue(
      phone: phone,
      tablet: resolvedTablet,
      desktop: desktop,
      wide: wide ?? desktop,
    );
  }

  double get sectionHorizontalPadding => responsiveValue(
        phone: 16,
        tablet: 24,
        desktop: 40,
        wide: 48,
        ultraWide: 64,
      );

  double get sectionVerticalPadding => responsiveValue(
        phone: 48,
        tablet: 56,
        desktop: 80,
        wide: 88,
        ultraWide: 96,
      );
}
