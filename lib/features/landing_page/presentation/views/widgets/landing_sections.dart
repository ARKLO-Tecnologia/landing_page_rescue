import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/features/landing_page/presentation/contracts/landing_contact_form_host.dart';
import 'package:rescue_pitchtech/shared/navigation/landing_section_anchor_registry.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/features_table_section.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/footer/footer_section.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/forensic_differential_section.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/header/header_section.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/hero_section.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/mobile_section.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/operation_flow_section.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/problem_section.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/solution_section.dart';
import 'package:rescue_pitchtech/shared/navigation/landing_section_id.dart';
import 'package:rescue_pitchtech/shared/widgets/section_anchor.dart';

class LandingSections extends StatelessWidget {
  const LandingSections({
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
    return Column(
      children: [
        HeaderSection(onSectionSelected: onSectionSelected),
        const HeroSection(),
        SectionAnchor(
          section: LandingSectionId.triage,
          anchorKey: sectionAnchors.keyFor(LandingSectionId.triage),
          child: const ProblemSection(),
        ),
        SectionAnchor(
          section: LandingSectionId.decisionTrack,
          anchorKey: sectionAnchors.keyFor(LandingSectionId.decisionTrack),
          child: const SolutionSection(),
        ),
        SectionAnchor(
          section: LandingSectionId.features,
          anchorKey: sectionAnchors.keyFor(LandingSectionId.features),
          child: const FeaturesTableSection(),
        ),
        const ForensicDifferentialSection(),
        SectionAnchor(
          section: LandingSectionId.protocols,
          anchorKey: sectionAnchors.keyFor(LandingSectionId.protocols),
          child: const OperationFlowSection(),
        ),
        SectionAnchor(
          section: LandingSectionId.mobile,
          anchorKey: sectionAnchors.keyFor(LandingSectionId.mobile),
          child: const MobileSection(),
        ),
        const FooterSection(),
      ],
    );
  }
}
