import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(color: outline),
          child: CurvedNavigationBar(
            height: 50,
            color: darkMain,


            backgroundColor: Colors.white,
            buttonBackgroundColor: darkMain,
            items: const <Widget>[
              Icon(Icons.home, size: 30, color: Colors.white,),
              Icon(Icons.add_chart, size: 30,color: Colors.white),
              Icon(Icons.person, size: 30, color: Colors.white),
            ],
            onTap: (index) {
              setState((){
                selectedIndex = index;
              });
              //Handle button tap
            },
          ),
        ),
        body: (selectedIndex==0) ? const NewHomeScreen() : selectedIndex==1 ? P2pTrade() : ProfileScreen(),
      ),
    );
  }
}
