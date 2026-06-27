import 'package:rescue_pitchtech/shared/navigation/landing_section_id.dart';

/// Itens de navegação exibidos no header desktop.
abstract final class HeaderNavConfig {
  static const navItems = [
    LandingSectionId.features,
    LandingSectionId.triage,
    LandingSectionId.protocols,
    LandingSectionId.decisionTrack,
  ];
}
