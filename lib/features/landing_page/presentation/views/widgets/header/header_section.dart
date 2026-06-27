import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/header/header_bar.dart';
import 'package:rescue_pitchtech/shared/extensions/responsive_context.dart';
import 'package:rescue_pitchtech/shared/navigation/landing_section_id.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required this.onSectionSelected});

  final ValueChanged<LandingSectionId> onSectionSelected;

  @override
  Widget build(BuildContext context) {
    return HeaderBar(
      height: context.responsiveValue(
        phone: 64.0,
        tablet: 72.0,
        desktop: 84.0,
      ),
      logoHeight: context.responsiveValue(
        phone: 36.0,
        tablet: 40.0,
        desktop: 44.0,
      ),
      showMenu: context.isLandingMobile,
      onSectionSelected: onSectionSelected,
    );
  }
}
