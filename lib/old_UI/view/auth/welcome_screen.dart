import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/old_UI/utils/app-color.dart';
import 'package:property_trading_app/old_UI/view/auth/new_signUp.dart';
import 'package:property_trading_app/old_UI/view/auth/signin_options.dart';

import '../global_widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final double screenSize = Get.width;
    print(screenSize);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF133c4c)
                  // color: Theme.of(context).primaryColor,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Center(child: Image.asset("assets/images/logo.png"))),
                    Container(
                      width: screenSize,
                      child:  Padding(
                        padding: EdgeInsets.only(left: 20.0, bottom: 20, right: screenSize*0.05102),
                        child: Text(
                          "Help Millions of People, everywhere, everytime. ",
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenSize*0.077,
                            fontWeight: FontWeight.bold),),
                      ),
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
