import 'package:rescue_pitchtech/shared/responsive/landing_display_size.dart';

/// Breakpoints e limites de layout da landing page.
abstract final class LandingBreakpoints {
  static const double phone = 600;
  static const double tablet = 1024;
  static const double wide = 1440;
  static const double ultraWide = 1920;

  /// Alias mantido por compatibilidade com código existente.
  static const double desktop = tablet;

  static const double footerCompact = 800;
  static const double operationFlowCompact = 768;

  static const double sectionMaxWidthNarrow = 1100;
  static const double sectionMaxWidthWide = 1200;
  static const double heroContentMaxWidth = 650;

  static LandingDisplaySize displaySizeFor(double width) {
    if (width >= ultraWide) return LandingDisplaySize.ultraWide;
    if (width >= wide) return LandingDisplaySize.wide;
    if (width >= tablet) return LandingDisplaySize.desktop;
    if (width >= phone) return LandingDisplaySize.tablet;
    return LandingDisplaySize.phone;
  }
}
