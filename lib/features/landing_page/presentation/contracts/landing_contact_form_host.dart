import 'package:flutter/foundation.dart';

import 'package:rescue_pitchtech/features/landing_page/domain/entities/landing_content.dart';

/// Contrato do formulário de contato e conteúdo dinâmico da CTA (DIP).
abstract interface class LandingContactFormHost implements Listenable {
  LandingContent? get content;

  String? get formError;

  bool get isSubmitting;

  bool get submitSuccess;

  int get formResetKey;

  void setContactName(String value);

  void setContactEmail(String value);

  Future<void> submitDemoRequest();
}
