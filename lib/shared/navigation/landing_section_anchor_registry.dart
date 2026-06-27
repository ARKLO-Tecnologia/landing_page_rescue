import 'package:flutter/widgets.dart';

import 'package:rescue_pitchtech/shared/navigation/landing_section_id.dart';

/// Contrato de registro de âncoras para scroll entre seções (DIP).
abstract interface class LandingSectionAnchorRegistry {
  GlobalKey keyFor(LandingSectionId section);
}
