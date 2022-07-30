import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/controllers/signup_controller.dart';
import 'package:property_trading_app/new_UI_screens/doc_verification/document_verification.dart';
import 'package:property_trading_app/new_UI_screens/otp/otpscreen.dart';
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
  SignUpController signUpController = SignUpController();

  final GlobalKey<FormState> _key =   GlobalKey<FormState>();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: darkMain,
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  // height: Get.height * 0.4,
                  // width: Get.width ,
                  // fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(text: 'First create your account', size: 30),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                  child: TextFormField(
                    validator: (value){
                      if(value == null || value.trim().isEmpty){
                        return "Field is required";
                      }
                      return null;
                    },
                    controller: signUpController.userNameController,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                    decoration: InputDecoration(
                        hintText: 'Full Name/User Name',
                        hintStyle: TextStyle(fontSize: 17, color: Colors.white),
                        fillColor: Colors.grey,
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                  child: TextFormField(
                    validator: (value){
                      if(value == null || value.trim().isEmpty){
                        return "Field is required";
                      }
                      if(!signUpController.isValidEmail(value.trim())){
                        return "not a valid email";
                      }

                      return null;
                    },

                    style: TextStyle(color: Colors.white, fontSize: 17),
                    controller: signUpController.emailController,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(fontSize: 17, color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                  child: TextFormField(
                    validator: (value){
                      if(value == null || value.trim().isEmpty){
                        return "Field is required";
                      }
                      return null;
                    },

                    controller: signUpController.passController,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.remove_red_eye_rounded,
                          color: Colors.white,
                          size: 25,
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(fontSize: 17, color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2)),

                    ),
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                  child: TextFormField(
                    validator: (value){
                      if(value == null || value.trim().isEmpty){
                        return "Field is required";
                      }
                      if(value!=signUpController.passController.text){
                        return "Password does not match.";
                      }
                      return null;
                    },

                    controller: signUpController.confirmPassController,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.remove_red_eye_rounded,
                          color: Colors.white,
                          size: 25,
                        ),
                        hintText: 'Confirm your Password',
                        hintStyle: TextStyle(fontSize: 17, color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2))),
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                  child: TextFormField(
                    validator: (value){
                      if(value == null || value.trim().isEmpty){
                        return "Field is required";
                      }
                      return null;
                    },
                    controller: signUpController.phoneNoController,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                    decoration: InputDecoration(
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(fontSize: 17, color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2))),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                loading ? SizedBox(
                  height: 40,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ):
                CustomElevatedButton(
                  text: "Sign Up",
                  onPressed: () async{
                    if(_key.currentState!.validate()){
                      setState((){
                        loading = true;
                      });

                      final bool success = await signUpController.signUp();

                      setState((){
                        loading = false;
                      });

                      if(success){
                        Get.to(OtpScreen(phoneno: '+92${signUpController.phoneNoController.text.substring(1)}',));
                      }
                      else{
                        print("sign up failed");
                      }

                    }
                  },
                  fixedSize: Size(
                    Get.width * 0.5,
                    Get.height * 0.0561,
                  ),
                  color: mainGolden,
                  textColor: darkMain,
                  // suffixIcon: const Icon(Icons.arrow_forward),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}
