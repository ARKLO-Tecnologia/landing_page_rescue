import 'package:flutter/widgets.dart';

import 'package:rescue_pitchtech/injection_container.dart';

/// Inicializa o ambiente antes de [runApp]: binding Flutter e dependências.
Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
}
