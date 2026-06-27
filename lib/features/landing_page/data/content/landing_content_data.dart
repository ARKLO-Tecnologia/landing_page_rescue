import 'package:rescue_pitchtech/features/landing_page/domain/entities/landing_content.dart';
import 'package:rescue_pitchtech/shared/config/environment.dart';

/// Fonte única do conteúdo dinâmico da landing (contato + CTA).
abstract final class LandingContentData {
  static const LandingContent defaultContent = LandingContent(
    contactPhone: Environment.contactPhone,
    contactEmail: Environment.contactEmail,
    ctaTitle: 'Pronto para elevar a gestão da sua emergência?',
    ctaSubtitle:
        'Agende uma demonstração e veja a rastreabilidade total em ação.',
  );
}
