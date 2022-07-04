import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:property_trading_app/utils/app-color.dart';
import 'package:property_trading_app/view/auth/phone_signin.dart';
import 'package:property_trading_app/view/global_widgets/custom_button.dart';

class SignInOptionsScreen extends StatelessWidget {
  const SignInOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: darkMain,
              )),
          Expanded(
            flex: 3,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // SizedBox(height: Get.height/4,),
                  CustomElevatedButton(text: "Sign In With Google", onPressed: (){}, color: darkMain, fixedSize: Size(265,65),imageIcon: Image.asset("assets/images/google.png",height: 50, width: 50,)),
                  const SizedBox(height: 20,),
                  CustomElevatedButton(text: "Sign In With Apple ", onPressed: (){}, color: darkMain, fixedSize: Size(265,65),imageIcon: Image.asset("assets/images/apple-logo.png", height: 40, width: 50),),
                  const SizedBox(height: 20,),
                  CustomElevatedButton(text: "Sign In With Phone", onPressed: (){
                    Get.to(PhoneSignInScreen());
                  }, color: darkMain, fixedSize: Size(265,65), imageIcon: Image.asset("assets/images/phone1.png", height: 50, width: 40),),
                  const SizedBox(height: 20,),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
