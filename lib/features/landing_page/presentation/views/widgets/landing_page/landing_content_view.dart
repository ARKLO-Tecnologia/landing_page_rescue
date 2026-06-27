import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/features/landing_page/presentation/contracts/landing_contact_form_host.dart';
import 'package:rescue_pitchtech/shared/navigation/landing_section_anchor_registry.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/landing_navigation_drawer.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/landing_sections.dart';
import 'package:rescue_pitchtech/shared/navigation/landing_section_id.dart';
import 'package:rescue_pitchtech/shared/theme/app_theme.dart';

/// Conteúdo principal da landing — scaffold, drawer e seções.
class LandingContentView extends StatelessWidget {
  const LandingContentView({
    super.key,
    required this.formHost,
    required this.sectionAnchors,
    required this.onSectionSelected,
  });

  final LandingContactFormHost formHost;
  final LandingSectionAnchorRegistry sectionAnchors;
  final ValueChanged<LandingSectionId> onSectionSelected;

  @override
  Widget build(BuildContext context) {
    // MediaQuery.sizeOf ignora inset do teclado — evita colapsar minHeight
    // quando o formulário recebe foco no mobile.
    final viewportHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppColors.background,
      endDrawer: LandingNavigationDrawer(
        onSectionSelected: onSectionSelected,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: viewportHeight),
          child: LandingSections(
            formHost: formHost,
            sectionAnchors: sectionAnchors,
            onSectionSelected: onSectionSelected,
          ),
        ),
      ),
    );
  }
}
