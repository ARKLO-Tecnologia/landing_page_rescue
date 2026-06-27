import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:rescue_pitchtech/shared/navigation/landing_section_anchor_registry.dart';
import 'package:rescue_pitchtech/shared/navigation/landing_section_id.dart';

typedef SectionScrollCallback = void Function(LandingSectionId section);

class LandingScrollController implements LandingSectionAnchorRegistry {
  LandingScrollController();

  final Map<LandingSectionId, GlobalKey> _keys = {
    for (final section in LandingSectionId.values) section: GlobalKey(),
  };

  @override
  GlobalKey keyFor(LandingSectionId section) => _keys[section]!;

  void scrollTo(
    BuildContext context,
    LandingSectionId section, {
    bool Function()? isMounted,
  }) {
    final scaffold = Scaffold.maybeOf(context);
    if (scaffold?.isEndDrawerOpen ?? false) {
      Navigator.of(context).pop();
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _ensureVisible(context, section, isMounted: isMounted);
      });
      return;
    }

    _ensureVisible(context, section, isMounted: isMounted);
  }

  void _ensureVisible(
    BuildContext context,
    LandingSectionId section, {
    bool Function()? isMounted,
  }) {
    if (isMounted != null && !isMounted()) return;

    final targetContext = _keys[section]?.currentContext;
    if (targetContext == null) return;

    Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOut,
      alignment: 0.05,
    );
  }
}
