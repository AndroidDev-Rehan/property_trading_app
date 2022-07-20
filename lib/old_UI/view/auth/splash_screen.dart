import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:property_trading_app/old_UI/utils/app-color.dart';
import 'package:property_trading_app/old_UI/view/auth/new_signUp.dart';
import 'package:property_trading_app/old_UI/view/auth/welcome_screen.dart';

class CustomSplashScreen extends StatelessWidget {
  const CustomSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: darkMain,
      splash: 'assets/images/logo.png',
      nextScreen: const WelcomeScreen(),
      splashTransition: SplashTransition.slideTransition,
      splashIconSize: 200,
    );
  }
}
