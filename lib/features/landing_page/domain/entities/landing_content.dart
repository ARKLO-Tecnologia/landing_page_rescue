import 'package:equatable/equatable.dart';

/// Conteúdo dinâmico da landing (contato e CTA).
/// Textos das seções permanecem na View — conteúdo estático de marketing.
class LandingContent extends Equatable {
  const LandingContent({
    required this.contactPhone,
    required this.contactEmail,
    required this.ctaTitle,
    required this.ctaSubtitle,
  });

  final String contactPhone;
  final String contactEmail;
  final String ctaTitle;
  final String ctaSubtitle;

  @override
  List<Object?> get props =>
      [contactPhone, contactEmail, ctaTitle, ctaSubtitle];
}
