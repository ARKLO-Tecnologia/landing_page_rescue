import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/app.dart';
import 'package:rescue_pitchtech/bootstrap.dart';

Future<void> main() async {
  await bootstrap();
  runApp(const LandingPageApp());
}
