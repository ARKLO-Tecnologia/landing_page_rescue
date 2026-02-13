import 'package:flutter/foundation.dart';

class LandingPageViewModel extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  Future<void> init() async {
    _setLoading(true);

    // Futuramente você pode chamar casos de uso aqui,
    // por exemplo: await _getLandingContentUseCase();

    _setLoading(false);
  }

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}

