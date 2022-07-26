import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app-color.dart';
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
      backgroundColor: darkMain,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const Text('Above Everyone Hello HI',style: TextStyle(fontSize: 18,color: Colors.white,fontStyle: FontStyle.italic),),
          // const SizedBox(height: 20,),
          Image.asset('assets/images/glogo1.png',),
          const SizedBox(height: 20,),
          const Text('Above the crowd in Property',style: TextStyle(fontSize: 18,color: Colors.white,fontStyle: FontStyle.italic),)
        ],
      ),

    );
  }

  screenFunction() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.off(()=> const WelcomeScreen());
  }

}

