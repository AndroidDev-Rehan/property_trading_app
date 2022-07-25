import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/new_UI_screens/doc_verification/document_verification.dart';
import 'package:property_trading_app/utils/app-color.dart';

import '../../global_widgets/custom_button.dart';
import '../../global_widgets/custom_text.dart';
import '../verification/verification.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: darkMain,
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                // height: Get.height * 0.4,
                // width: Get.width ,
                // fit: BoxFit.fill,
              ),
              SizedBox(height: 10,),
              CustomText(text: 'First create your account', size: 30),
              const SizedBox(height: 30,),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                child: TextField(style: TextStyle(color: Colors.white,fontSize: 17),
                  decoration: InputDecoration(
                      hintText: 'Full Name/User Name',
                      hintStyle: TextStyle(fontSize: 17, color: Colors.white),
                      fillColor: Colors.grey,

                      focusedBorder:UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.white, width: 2)) ,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.white, width: 2))),),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                child: TextField(style: TextStyle(color: Colors.white,fontSize: 17),
                  decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(fontSize: 17, color: Colors.white),


                      focusedBorder:UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.white, width: 2)) ,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.white, width: 2))),),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                child: TextField(style: TextStyle(color: Colors.white,fontSize: 17),
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.remove_red_eye_rounded,color: Colors.white,size: 25,),
                      hintText: 'Password',
                      hintStyle: TextStyle(fontSize: 17, color: Colors.white),


                      focusedBorder:UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.white, width: 2)) ,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.white, width: 2))),),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                child: TextField(style: TextStyle(color: Colors.white,fontSize: 17),
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.remove_red_eye_rounded,color: Colors.white,size: 25,),
                      hintText: 'Confirm your Password',
                      hintStyle: TextStyle(fontSize: 17, color: Colors.white),


                      focusedBorder:UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.white, width: 2)) ,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.white, width: 2))),),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                child: TextField(style: TextStyle(color: Colors.white,fontSize: 17),
                  decoration: InputDecoration(

                      hintText: 'Phone Number',
                      hintStyle: TextStyle(fontSize: 17, color: Colors.white),


                      focusedBorder:UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.white, width: 2)) ,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.white, width: 2))),),
              ),
              SizedBox(height: 40,),
              CustomElevatedButton(
                text: "Sign Up",
                onPressed: (){
                  Get.to(DocumentVerificationScreen());
                },
                fixedSize: Size(Get.width*0.5,Get.height*0.0561,),
                color: mainGolden,
                textColor: darkMain,
                // suffixIcon: const Icon(Icons.arrow_forward),

              ),
SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
