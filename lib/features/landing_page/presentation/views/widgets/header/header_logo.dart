import 'package:flutter/material.dart';
import 'package:rescue_design_system/foundations/assets/rescue_assets.dart';

/// Logo do header — dimensionada só pela altura para não cortar o wordmark.
class HeaderLogo extends StatelessWidget {
  const HeaderLogo({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      RescueAssets.logoLight,
      package: RescueAssets.package,
      height: height,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.high,
      semanticLabel: 'Rescue',
    );
  }
}
