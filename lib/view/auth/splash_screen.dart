import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:property_trading_app/view/auth/new_signUp.dart';
import 'package:property_trading_app/view/auth/welcome_screen.dart';

class CustomSplashScreen extends StatelessWidget {
  const CustomSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/logo.png',
      nextScreen: WelcomeScreen(),
      splashTransition: SplashTransition.slideTransition,
      splashIconSize: 200,
    );
  }
}
