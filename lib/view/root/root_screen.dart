import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:property_trading_app/utils/app-color.dart';
import 'package:property_trading_app/view/home/home_screen.dart';

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
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          color: blueMain,
          backgroundColor: yellowEnd.withOpacity(0.8),
          buttonBackgroundColor: blueMain,
          items: const <Widget>[
            Icon(Icons.add, size: 30, color: Colors.white,),
            Icon(Icons.list, size: 30,color: Colors.white),
            Icon(Icons.compare_arrows, size: 30, color: Colors.white),
          ],
          onTap: (index) {
            // setState((){
            //   selectedIndex = index;
            // });
            //Handle button tap
          },
        ),
        body: (selectedIndex==0) ? const HomeScreen() : Container(color: Colors.blueAccent),
      ),
    );
  }
}
