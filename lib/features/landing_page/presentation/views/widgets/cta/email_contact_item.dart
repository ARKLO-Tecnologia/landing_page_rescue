import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/cta/contact_info_item.dart';
import 'package:rescue_pitchtech/shared/utils/url_launcher_service.dart';

class EmailContactItem extends StatelessWidget {
  const EmailContactItem({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return ContactInfoItem(
      icon: Icons.email_outlined,
      text: email,
      onTap: () => UrlLauncherService.openEmail(email),
    );
  }
}
