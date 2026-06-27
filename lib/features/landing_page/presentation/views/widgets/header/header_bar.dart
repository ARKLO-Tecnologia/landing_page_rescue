import 'package:flutter/material.dart';

import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/header/header_logo.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/header/header_nav_config.dart';
import 'package:rescue_pitchtech/features/landing_page/presentation/views/widgets/header/header_nav_item.dart';
import 'package:rescue_pitchtech/shared/navigation/landing_section_id.dart';
import 'package:rescue_pitchtech/shared/theme/app_theme.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    super.key,
    required this.height,
    required this.logoHeight,
    required this.showMenu,
    required this.onSectionSelected,
  });

  final double height;
  final double logoHeight;
  final bool showMenu;
  final ValueChanged<LandingSectionId> onSectionSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        height: height,
        padding: EdgeInsets.symmetric(
          horizontal: showMenu ? 16 : 40,
          vertical: showMenu ? 8 : 12,
        ),
        color: AppColors.background,
        child: showMenu ? _buildMobileLayout(context) : _buildDesktopLayout(),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HeaderLogo(height: logoHeight),
        Builder(
          builder: (innerContext) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white, size: 26),
            tooltip: 'Abrir menu',
            onPressed: () => Scaffold.of(innerContext).openEndDrawer(),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HeaderLogo(height: logoHeight),
        const SizedBox(width: 24),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: constraints.maxWidth),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: HeaderNavConfig.navItems
                        .map(
                          (section) => HeaderNavItem(
                            title: section.label,
                            onPressed: () => onSectionSelected(section),
                          ),
                        )
                        .toList(),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
