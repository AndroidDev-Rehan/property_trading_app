import "package:flutter/material.dart";
import 'package:property_trading_app/utils/app-color.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMain,
      body: Center(
        child: Image.asset("assets/images/glogo.png"),
      ),
    );
  }
}
