import 'package:taush/view/user/cart/cart_screen.dart';
import 'package:taush/view/user/home/home_screen.dart';
import 'package:taush/view/user/menu/menu_screen.dart';
import 'package:taush/view/user/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart'; // <- needed for CupertinoIcons :contentReference[oaicite:0]{index=0}
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../utils/colors.dart';

class UserBottomNavBar extends StatefulWidget {
  const UserBottomNavBar({super.key});

  @override
  State<UserBottomNavBar> createState() => _UserBottomNavBarState();
}

class _UserBottomNavBarState extends State<UserBottomNavBar> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  /* ------------ V5: ONE list of PersistentTabConfig ------------- */
  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const HomeScreen(),
          item: ItemConfig(
            icon: const Icon(CupertinoIcons.home),
            title: 'Home',
            activeForegroundColor: teal,
            inactiveForegroundColor: black,
          ),
        ),
        PersistentTabConfig(
          screen: const ProfileScreen(),
          item: ItemConfig(
            icon: const Icon(CupertinoIcons.person),
            title: 'You',
            activeForegroundColor: teal,
            inactiveForegroundColor: black,
          ),
        ),
        PersistentTabConfig(
          screen: const CartScreen(),
          item: ItemConfig(
            icon: const Icon(CupertinoIcons.cart),
            title: 'Cart',
            activeForegroundColor: teal,
            inactiveForegroundColor: black,
          ),
        ),
        PersistentTabConfig(
          screen: const MenuScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.menu),
            title: 'Menu',
            activeForegroundColor: teal,
            inactiveForegroundColor: black,
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) => PersistentTabView(
        controller: _controller,
        tabs: _tabs(),

        /* ---- parameters renamed / dropped in V5 ---- */
        avoidBottomPadding:
            true, // was confineInSafeArea :contentReference[oaicite:1]{index=1}
        backgroundColor: Colors
            .white, // colours the whole view now :contentReference[oaicite:2]{index=2}
        resizeToAvoidBottomInset: true,
        stateManagement: true,

        /* ---- pick a style (old style3 → Style4BottomNavBar) ---- */
        navBarBuilder: (navBarConfig) => Style4BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
}
