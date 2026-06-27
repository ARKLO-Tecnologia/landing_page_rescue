import 'package:flutter/foundation.dart';

/// Base para ViewModels MVVM — expõe [notifyListeners] via [setState].
abstract class ViewModel extends ChangeNotifier {
  @protected
  void setState() => notifyListeners();
}
