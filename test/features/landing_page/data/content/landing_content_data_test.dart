import 'package:flutter_test/flutter_test.dart';
import 'package:rescue_pitchtech/features/landing_page/data/content/landing_content_data.dart';
import 'package:rescue_pitchtech/shared/config/environment.dart';

void main() {
  group('LandingContentData', () {
    test('defaultContent usa Environment como fonte de contato', () {
      const content = LandingContentData.defaultContent;

      expect(content.contactPhone, Environment.contactPhone);
      expect(content.contactEmail, Environment.contactEmail);
      expect(content.ctaTitle, isNotEmpty);
      expect(content.ctaSubtitle, isNotEmpty);
    });
  });
}
