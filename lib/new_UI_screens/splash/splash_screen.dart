import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import '../../../utils/app-color.dart';

import '../../../utils/text_style.dart';
import '../welcome/welcome_screen.dart';

class CustomSplashScreen extends StatefulWidget {
  const CustomSplashScreen({Key? key}) : super(key: key);

  @override
  State<CustomSplashScreen> createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    screenFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: darkMain,
        height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/glogo1.png',height: Get.height*0.4,width: Get.width,fit: BoxFit.fill,),
              SizedBox(height: 20,),
              Text('Above  The Crowd In Property',style: TextStyle(fontSize: 18,color: Colors.white,fontStyle: FontStyle.italic),)
            ],
          ),
      ),

    );
  }
  screenFunction() async {
    await Future.delayed(const Duration(seconds:8));
    return (
        Get.off(()=> WelcomeScreen()));
  }
}

