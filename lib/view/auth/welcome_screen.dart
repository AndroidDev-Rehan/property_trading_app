import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/utils/app-color.dart';
import 'package:property_trading_app/view/auth/new_signUp.dart';
import 'package:property_trading_app/view/auth/signin_options.dart';

import '../global_widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF133c4c)
                  // color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  children: [
                    Expanded(child: Center(child: Image.asset("assets/images/logo.png"))),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 20, right: 30),
                      child: Text("Help Millions of People, everywhere, everytime. ", style: TextStyle(
                          color: mainGolden,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),),
                    )
                  ],

                ),
              )),
          Expanded(
              flex: 2,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomElevatedButton(text: 'Login',onPressed: (){
                        Get.to(SignInOptionsScreen());
                      }, roundness: 10, horizontalPadding: 25, verticalPadding: 15,
                        color: Color(0xFF133c4c),

                      ),
                      CustomElevatedButton(text: 'Sign Up',onPressed: (){
                        Get.to(SignUpScreen());
                      }, roundness: 10, horizontalPadding: 25, verticalPadding: 15, color: Colors.white,border: true,textColor: mainGolden),
                    ],
                  ),
                ),
              )

          )
        ],
      ),
    );
  }
}
