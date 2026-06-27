import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/features/landing_page/domain/entities/landing_content.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/contracts/landing_contact_form_host.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/cta/contact_form_card.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/cta/email_contact_item.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/cta/phone_contact_item.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/cta/store_download_buttons.dart';
import 'package:rescue_pitchtech/shared/extensions/responsive_context.dart';
import 'package:rescue_pitchtech/shared/theme/app_theme.dart';
import 'package:rescue_pitchtech/shared/theme/app_text_styles.dart';
import 'package:rescue_pitchtech/shared/widgets/responsive_split_layout.dart';
import 'package:rescue_pitchtech/shared/widgets/section_content.dart';

class CtaSectionContent extends StatelessWidget {
  const CtaSectionContent({
    super.key,
    required this.formHost,
    required this.content,
  });

  final LandingContactFormHost formHost;
  final LandingContent content;

  @override
  Widget build(BuildContext context) {
    final isStacked = context.isStackedLayout;
    final textAlign = isStacked ? TextAlign.center : TextAlign.left;
    final crossAxisAlignment =
        isStacked ? CrossAxisAlignment.center : CrossAxisAlignment.start;

    return ColoredBox(
      color: AppColors.background,
      child: Column(
        children: [
          const Divider(color: Colors.white10, height: 1),
          SectionContent(
            child: Column(
              crossAxisAlignment: crossAxisAlignment,
              children: [
                Text(
                  content.ctaTitle,
                  textAlign: textAlign,
                  style: AppTextStyles.sectionTitle(
                    context,
                    color: Colors.white,
                    mobileSize: 24,
                    desktopSize: 30,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  content.ctaSubtitle,
                  textAlign: textAlign,
                  style: const TextStyle(fontSize: 15, color: Colors.white70),
                ),
                const SizedBox(height: 48),
                ResponsiveSplitLayout(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  gapMobile: 32,
                  gapTablet: 40,
                  gapDesktop: 48,
                  start: Align(
                    alignment:
                        isStacked ? Alignment.center : Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PhoneContactItem(phone: content.contactPhone),
                        const SizedBox(height: 16),
                        EmailContactItem(email: content.contactEmail),
                      ],
                    ),
                  ),
                  end: ContactFormCard(formHost: formHost),
                ),
                const SizedBox(height: 64),
                const Text(
                  'Baixe nosso aplicativo',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                StoreDownloadButtons(
                  alignment: isStacked
                      ? WrapAlignment.center
                      : WrapAlignment.start,
                ),
              ],
            ),
          ),
          const Divider(color: Colors.white10, height: 1),
        ],
      ),
    );
  }
}
