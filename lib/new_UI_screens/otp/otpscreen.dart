import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/utils/app-color.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:toast/toast.dart';

import '../../controllers/signup_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../global_widgets/custom_button.dart';
import '../../global_widgets/custom_text.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({Key? key,required this.phoneno,this.login=false}) : super(key: key);
  String phoneno;
  bool login;


  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  SignUpController signUpController = SignUpController();
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusNode focusNode3 = new FocusNode();
  FocusNode focusNode4 = new FocusNode();
  FocusNode focusNode5 = new FocusNode();
  @override
  void initState() {
    signUpController.stopWatchTimer=StopWatchTimer(
      mode: StopWatchMode.countDown,

      onChangeRawSecond: (value) => signUpController.secTimer.value=value,

    );
    signUpController.registerUserWithPhonenumber(widget.phoneno);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      body: Container(
        color: darkMain,
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.all(15),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40,),

            InkWell(
              onTap: (){
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration:
                const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 30,
                  color: darkMain,
                ),
              ),
            ),
            SizedBox(height: 100,),
            Text(
              'Enter the code',
              style: TextStyle(
                  color: mainGolden, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30,),
            CustomText(text: 'Enter the 4 digit code that we just sent to ${widget.phoneno}', size: 18),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: PinCodeTextField(
                controller: signUpController.otpcode,

                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  disabledColor: Colors.white,
                  inactiveColor: Colors.white,
                  activeColor: Colors.white,
                  selectedFillColor: Colors.white,
                  errorBorderColor: Colors.black,
                  inactiveFillColor: Colors.white,
                  selectedColor: Colors.black,

                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeFillColor: Colors.white,
                  borderWidth: 1,
                ),
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {

                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                }, appContext: context,
              ),
            ),
            SizedBox(height: 10,),
            CustomElevatedButton(
              text: "Verify",
              textStyle: TextStyle(fontSize: Get.width*0.037558, fontWeight: FontWeight.bold, color: darkMain),
              onPressed: (){
                widget.login?signUpController.verifyLoginOtp():signUpController.verifyOtp();

              },
              color: Colors.white, fixedSize: Size(Get.width*0.7,Get.height*0.07),textColor: darkMain,
            ),
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: Row(mainAxisSize:MainAxisSize.min,children: [Icon(Icons.timelapse,size: 35,color: darkMain,),SizedBox(width: 10,),Obx(()=> Text('00:${signUpController.secTimer.value<10?0:''}${signUpController.secTimer.value}',style: TextStyle(color: darkMain,fontSize: 20),))],),
              ),
            ),
            SizedBox(height: 20,),

            InkWell(onTap:(){signUpController.registerUserWithPhonenumber(widget.phoneno);},child: Center(child: CustomText(text: 'Didn’t receive the OTP? Resend OTP', size: 18)))
            ,SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }

}

