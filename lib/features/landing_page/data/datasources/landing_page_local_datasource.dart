import 'package:rescue_pitchtech/features/landing_page/data/content/landing_content_data.dart';
import 'package:rescue_pitchtech/features/landing_page/domain/entities/contact_request.dart';
import 'package:rescue_pitchtech/features/landing_page/domain/entities/landing_content.dart';

abstract interface class LandingPageLocalDataSource {
  Future<LandingContent> getLandingContent();

  Future<void> submitContactRequest(ContactRequest request);
}

class LandingPageLocalDataSourceImpl implements LandingPageLocalDataSource {
  const LandingPageLocalDataSourceImpl();

  @override
  Future<LandingContent> getLandingContent() async {
    return LandingContentData.defaultContent;
  }

  @override
  Future<void> submitContactRequest(ContactRequest request) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
  }
}
