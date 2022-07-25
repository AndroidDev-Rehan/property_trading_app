
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:property_trading_app/new_UI_screens/home/ads_screen.dart';
import 'package:property_trading_app/new_UI_screens/p2p/addP2PScreen.dart';
import 'package:property_trading_app/new_UI_screens/p2p/p2p_screen.dart';
import 'package:property_trading_app/new_UI_screens/profile/profile_screen.dart';


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
        screens:  [ AdsPage() , P2PScreen(), Home() , ProfileScreen(), ],
        items:
        [
          PersistentBottomNavBarItem(
            icon:  true ? const Icon(Icons.home, color: darkMain, size: 30,) : Container(
                // padding:const EdgeInsets.symmetric(vertical: 7),
                child: SvgPicture.asset("assets/images/home.svg",
                  // width: 25,height: 25,fit: BoxFit.fill,color: darkMain,
                )),
            activeColorPrimary: darkMain,
            inactiveColorPrimary: CupertinoColors.systemGrey,
          ),
          PersistentBottomNavBarItem(
            icon: true ? const Icon(Icons.group, color: darkMain, size: 30,) : Container(
                // padding:const EdgeInsets.symmetric(vertical: 5),
                child: SvgPicture.asset('assets/images/p2p.svg',
                  // width: 40,fit: BoxFit.fill,
                )),

            activeColorPrimary: darkMain,
            inactiveColorPrimary: CupertinoColors.systemGrey,
          ),
          PersistentBottomNavBarItem(
            icon:  const Icon(Icons.details,color: darkMain,size: 27,),

            activeColorPrimary:darkMain,
            inactiveColorPrimary: CupertinoColors.systemGrey,
          ),
          PersistentBottomNavBarItem(
          icon:  Container(child: Icon(Icons.account_circle_rounded,color: darkMain,size: 30,)),

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
gradient:LinearGradient(begin: Alignment.topCenter,end:Alignment.bottomCenter,colors: [Colors.black26,mainGolden,mainGolden],stops: [0.1,0.15,1],),


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
