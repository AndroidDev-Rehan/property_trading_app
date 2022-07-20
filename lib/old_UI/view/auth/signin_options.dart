import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/old_UI/utils/app-color.dart';
import 'package:property_trading_app/old_UI/view/auth/phone_signin.dart';
import 'package:property_trading_app/old_UI/view/global_widgets/custom_button.dart';

class SignInOptionsScreen extends StatelessWidget {
  const SignInOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  width: Get.width,
                  color: darkMain,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset("assets/images/logo.png", height: 150, width: 150,)),
                )),
            Expanded(
              flex: 3,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomElevatedButton(text: "Sign In With Phone", onPressed: (){
                      Get.to(PhoneSignInScreen());
                    }, color: darkMain, fixedSize: Size(265,65), imageIcon: Image.asset("assets/images/phone1.png", height: 50, width: 40),),
                    const SizedBox(height: 20,),
                    CustomElevatedButton(text: "Sign In With Google", onPressed: (){}, color: darkMain, fixedSize: Size(265,65),imageIcon: Image.asset("assets/images/google.png",height: 50, width: 50,)),
                    const SizedBox(height: 20,),
                    CustomElevatedButton(text: "Sign In With Apple ", onPressed: (){}, color: darkMain, fixedSize: Size(265,65),imageIcon: Image.asset("assets/images/apple-logo.png", height: 40, width: 50),),
                    const SizedBox(height: 20,),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
