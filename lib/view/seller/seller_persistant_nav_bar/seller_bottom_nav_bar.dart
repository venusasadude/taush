import 'package:taush/view/seller/inventory/inventory_screen.dart';
import 'package:taush/view/seller/monitor/monitor_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../utils/colors.dart';

class SellerBottomNavBar extends StatefulWidget {
  const SellerBottomNavBar({super.key});

  @override
  State<SellerBottomNavBar> createState() => _SellerBottomNavBarState();
}

class _SellerBottomNavBarState extends State<SellerBottomNavBar> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  /// ----------  V5: screens & items are merged into *tabs* ----------
  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const InventoryScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.inventory_2_outlined),
            title: 'Inventory',
            activeForegroundColor: teal,
            inactiveForegroundColor: black,
          ),
        ),
        PersistentTabConfig(
          screen: const MonitorScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.bar_chart_outlined),
            title: 'Monitor',
            activeForegroundColor: teal,
            inactiveForegroundColor: black,
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      tabs: _tabs(),

      // ----------  params renamed / removed ----------
      avoidBottomPadding: true, // was confineInSafeArea
      backgroundColor: Colors.white, // now colours the whole view
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarOverlap: NavBarOverlap.none(),

      // ----------  animations ----------
      screenTransitionAnimation: const ScreenTransitionAnimation(
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),

      // ----------  pick a style (old style3 → Style4BottomNavBar) ----------
      navBarBuilder: (navBarConfig) => Style4BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
