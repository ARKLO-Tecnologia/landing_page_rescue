import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/features/landing_page/presentation/contracts/landing_contact_form_host.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/cta/cta_section_content.dart';

class CtaSection extends StatelessWidget {
  const CtaSection({super.key, required this.formHost});

  final LandingContactFormHost formHost;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: formHost,
      builder: (context, _) {
        final content = formHost.content;
        if (content == null) return const SizedBox.shrink();

        return CtaSectionContent(formHost: formHost, content: content);
      },
    );
  }
}
