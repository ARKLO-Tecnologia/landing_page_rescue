import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/cta/contact_info_item.dart';
import 'package:rescue_pitchtech/shared/utils/url_launcher_service.dart';

class PhoneContactItem extends StatelessWidget {
  const PhoneContactItem({super.key, required this.phone});

  final String phone;

  @override
  Widget build(BuildContext context) {
    return ContactInfoItem(
      icon: Icons.phone_outlined,
      text: phone,
      onTap: () => UrlLauncherService.openPhone(phone),
    );
  }
}
