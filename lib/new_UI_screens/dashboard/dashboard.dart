
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


import '../../../utils/app-color.dart';
import '../../old_UI/view/p2p/p2ptrade.dart';
import '../home/home.dart';


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
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: [ const Home() , Container() ,Container(),],
        items:
        [
          PersistentBottomNavBarItem(
            icon:  Container(padding:EdgeInsets.symmetric(vertical: 7),child: Image.asset('assets/images/homeicon.png',width: 25,height: 25,fit: BoxFit.fill,color: darkMain,)),



            activeColorPrimary: darkMain,
            inactiveColorPrimary: CupertinoColors.systemGrey,
          ),
          PersistentBottomNavBarItem(
          icon:   Container(padding:EdgeInsets.symmetric(vertical: 5),child: Image.asset('assets/images/p2picon.png',width: 40,fit: BoxFit.fill,)),

            activeColorPrimary: darkMain,
            inactiveColorPrimary: CupertinoColors.systemGrey,
          ),PersistentBottomNavBarItem(

      icon:  Container(child: Icon(Icons.account_circle_rounded,color: darkMain,size: 40,)),

            activeColorPrimary:darkMain,
            inactiveColorPrimary: CupertinoColors.systemGrey,
          ),
        ],

        confineInSafeArea: true,
        backgroundColor: mainGolden, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
   // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(


          colorBehindNavBar: mainGolden,
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
        navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
      ),
    );

  }
}
