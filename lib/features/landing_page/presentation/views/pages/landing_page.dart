import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/features/landing_page/presentation/viewmodels/landing_page_view_model.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/landing_page/landing_page_state_router.dart';
import 'package:rescue_pitchtech/injection_container.dart';
import 'package:rescue_pitchtech/shared/navigation/landing_scroll_controller.dart';
import 'package:rescue_pitchtech/shared/navigation/landing_section_id.dart';

/// Casca da landing page — ciclo de vida do ViewModel e coordenação de scroll.
class LandingPage extends StatefulWidget {
  const LandingPage({
    super.key,
    this.viewModel,
    this.sectionScroll,
  });

  /// Permite injeção explícita em widget tests (sem GetIt).
  final LandingPageViewModel? viewModel;

  /// Registro de âncoras de scroll — substituível em testes.
  final LandingScrollController? sectionScroll;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late final LandingPageViewModel _viewModel;
  late final LandingScrollController _sectionScroll;

  @override
  void initState() {
    super.initState();
    _viewModel = widget.viewModel ?? getIt<LandingPageViewModel>();
    _sectionScroll = widget.sectionScroll ?? LandingScrollController();
    _viewModel.init();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _scrollToSection(LandingSectionId section) {
    if (!mounted) return;

    _sectionScroll.scrollTo(
      context,
      section,
      isMounted: () => mounted,
    );
  }

  Future<void> _retryLoad() => _viewModel.init();

  @override
  Widget build(BuildContext context) {
    return LandingPageStateRouter(
      screenState: _viewModel,
      onRetry: _retryLoad,
      formHost: _viewModel,
      sectionAnchors: _sectionScroll,
      onSectionSelected: _scrollToSection,
    );
  }
}
