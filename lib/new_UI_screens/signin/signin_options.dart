import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/old_UI/utils/app-color.dart';
import 'package:property_trading_app/old_UI/view/auth/phone_signin.dart';
import 'package:property_trading_app/old_UI/view/global_widgets/custom_button.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../utils/app-color.dart';
import '../../../utils/text_style.dart';

class SignInOptionsScreen extends StatelessWidget {
  SignInOptionsScreen({Key? key}) : super(key: key);
  Size buttonsize=  Size(Get.width*0.7,Get.height*0.07);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          color: darkMain,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomElevatedButton(text: "Sign In With Phone", onPressed: (){
                Get.to(PhoneSignInScreen());
              }, color: Colors.white, fixedSize: buttonsize,textColor: darkMain, imageIcon: Image.asset("assets/images/phone1.png", height: 50, width: 40),),
              const SizedBox(height: 20,),
              CustomElevatedButton(text: "Sign In With Google", onPressed: (){}, fixedSize: buttonsize,textColor: darkMain, color:  Colors.white,imageIcon: Image.asset("assets/images/google.png",height: 50, width: 50,)),
              const SizedBox(height: 20,),
              CustomElevatedButton(text: "Sign In With Apple ", onPressed: (){}, fixedSize: buttonsize,textColor: darkMain, color:  Colors.white,imageIcon: Image.asset("assets/images/apple-logo.png", height: 40, width: 50),),
              const SizedBox(height: 60,),
              RichText(text: TextSpan(style: TextStyle(color: Colors.white,fontSize: 20),text: 'Have an account ?',children: [TextSpan(text:'  Login',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold))]))



            ],
          ),
        ),
      ),
    );
  }
}
