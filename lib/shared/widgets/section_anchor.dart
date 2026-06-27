import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/shared/navigation/landing_section_id.dart';

class SectionAnchor extends StatelessWidget {
  const SectionAnchor({
    super.key,
    required this.section,
    required this.anchorKey,
    required this.child,
  });

  final LandingSectionId section;
  final GlobalKey anchorKey;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: anchorKey,
      child: Semantics(
        container: true,
        label: section.label,
        child: child,
      ),
    );
  }
}
