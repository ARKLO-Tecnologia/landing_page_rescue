import 'package:flutter/foundation.dart';

/// Contrato de leitura do estado global da tela (DIP — testável com mock).
abstract interface class LandingPageScreenState implements Listenable {
  bool get isLoading;

  bool get hasContent;

  String? get contentError;
}
