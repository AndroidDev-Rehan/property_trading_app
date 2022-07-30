import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/new_UI_screens/signin/signin_options.dart';
import 'package:property_trading_app/new_UI_screens/signup/signup.dart';
import '../../../utils/app-color.dart';

import '../../../utils/text_style.dart';
import '../../global_widgets/custom_text.dart';
import '../signin/email_signin.dart';



class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final double screenSize = Get.width;
    print(screenSize);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: darkMain
          // color: Theme.of(context).primaryColor,
        ),
        height: Get.height,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenSize,
              child:  Padding(
                padding: EdgeInsets.only(left: 20.0, bottom: 20, right: screenSize*0.05102),
                child: CustomText(text: 'Stay on top of your finance with us. ', size: 35),
              ),
            ),
            SizedBox(height: 20),
            InkWell(onTap:(){Get.to(()=>SignInOptionsScreen());},
                child: Container(margin:EdgeInsets.symmetric(horizontal: 15),width:Get.width,height: 50,decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color:Colors.white),child: Center(child: Text('Login',style: TextStyle(color:darkMain,fontSize: 25),)),)),
            SizedBox(height: 30),
            InkWell(
                onTap: (){
                  Get.to(SignUp());
                },
                child: Container(margin:EdgeInsets.symmetric(horizontal: 15),width:Get.width,height: 50,decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color:Colors.white),child: Center(child: Text('Create account',style: TextStyle(color:darkMain,fontSize: 25),)),)),

          ],

        ),
      ),
    );
  }
}
