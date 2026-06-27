import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/header/header_logo.dart';
import 'package:rescue_pitchtech/shared/navigation/landing_section_id.dart';
import 'package:rescue_pitchtech/shared/theme/app_theme.dart';

class LandingNavigationDrawer extends StatelessWidget {
  const LandingNavigationDrawer({
    super.key,
    required this.onSectionSelected,
  });

  final ValueChanged<LandingSectionId> onSectionSelected;

  static const _items = [
    LandingSectionId.features,
    LandingSectionId.triage,
    LandingSectionId.protocols,
    LandingSectionId.decisionTrack,
    LandingSectionId.mobile,
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: HeaderLogo(height: 40),
            ),
            const Divider(color: Colors.white24, height: 1),
            Expanded(
              child: ListView(
                children: [
                  for (final section in _items)
                    ListTile(
                      title: Text(
                        section.label,
                        style: const TextStyle(color: Colors.white),
                      ),
                      onTap: () => onSectionSelected(section),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
