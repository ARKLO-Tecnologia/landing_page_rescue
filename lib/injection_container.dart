import 'package:get_it/get_it.dart';

import 'package:rescue_pitchtech/features/landing_page/di/landing_page_injection.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  initLandingPageModule(getIt);
}
