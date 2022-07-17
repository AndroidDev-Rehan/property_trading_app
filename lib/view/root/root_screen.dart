import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:property_trading_app/utils/app-color.dart';
import 'package:property_trading_app/view/profile_screen.dart';

import '../auth/widget/CustomTextField.dart';
import '../home/graphscreen.dart';
import '../home/new_home_screen.dart';
import '../home/old_home_screen.dart';
import '../p2p/p2ptrade.dart';


class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {

  int selectedIndex = 0;
  PersistentTabController   _controller = PersistentTabController(initialIndex: 0);


  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: [ const NewHomeScreen() , const P2pTrade() ,ProfileScreen(),],
      items:
      [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: ("Home"),
          activeColorPrimary: darkMain,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.add_chart),
          title: ("P2P"),
          activeColorPrimary: darkMain,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: ("Profile"),
          activeColorPrimary:darkMain,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ],

      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        border: Border.all(color: mainGolden,width: 2),
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 50),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 50),
      ),
      navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    );

  }
}
