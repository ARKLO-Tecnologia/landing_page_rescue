import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/features/landing_page/presentation/contracts/landing_contact_form_host.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/contracts/landing_page_screen_state.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/landing_page/landing_content_view.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/landing_page/landing_error_view.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/landing_page/landing_loading_view.dart';
import 'package:rescue_pitchtech/shared/navigation/landing_section_anchor_registry.dart';
import 'package:rescue_pitchtech/shared/navigation/landing_section_id.dart';

/// Roteia o estado global da tela para sub-views isoladas (SRP).
class LandingPageStateRouter extends StatelessWidget {
  const LandingPageStateRouter({
    super.key,
    required this.screenState,
    required this.onRetry,
    required this.formHost,
    required this.sectionAnchors,
    required this.onSectionSelected,
  });

  final LandingPageScreenState screenState;
  final VoidCallback onRetry;
  final LandingContactFormHost formHost;
  final LandingSectionAnchorRegistry sectionAnchors;
  final ValueChanged<LandingSectionId> onSectionSelected;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: screenState,
      builder: (context, _) {
        if (screenState.isLoading && !screenState.hasContent) {
          return const LandingLoadingView();
        }

        if (screenState.contentError != null && !screenState.hasContent) {
          return LandingErrorView(
            message: screenState.contentError!,
            onRetry: onRetry,
          );
        }

        return LandingContentView(
          formHost: formHost,
          sectionAnchors: sectionAnchors,
          onSectionSelected: onSectionSelected,
        );
      },
    );
  }
}
