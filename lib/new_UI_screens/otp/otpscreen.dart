import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/utils/app-color.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:toast/toast.dart';

import '../../controllers/signup_controller.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters:[
                        LengthLimitingTextInputFormatter(1),
                      ],
                      style: TextStyle(color: darkMain,fontSize: 25),
                      onChanged: (S){
                        if (S.length == 1) {
                          signUpController.otpcode.value =
                              S + signUpController.otpcode.value.substring(1);
                          FocusScope.of(context).requestFocus(focusNode1);
                        }
                      },
                      decoration: InputDecoration(border: InputBorder.none,contentPadding: EdgeInsets.all(8)),


                    ),
                  ),
                ),
                SizedBox(width: 15,),
                Container(
                  width: 40,height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: TextField(
                      focusNode: focusNode1,
                      keyboardType: TextInputType.number,
                      onChanged: (S){
    if (S.length == 1) {
                        signUpController.otpcode.value=signUpController.otpcode.value.substring(0,1)+S + signUpController.otpcode.value.substring(2);
                        FocusScope.of(context).requestFocus(focusNode2);}
                      },
                      inputFormatters:[
                        LengthLimitingTextInputFormatter(1),
                      ],
                      style: TextStyle(color: darkMain,fontSize: 25),
                      decoration: InputDecoration(border: InputBorder.none,contentPadding: EdgeInsets.all(8)),


                    ),
                  ),
                ),
                SizedBox(width: 15,),
                Container(
                  width: 40,height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child:Center(
                    child: TextField(
                      focusNode: focusNode2,
                      keyboardType: TextInputType.number,
                      onChanged: (S){
    if (S.length == 1) {
                       signUpController.otpcode.value=signUpController.otpcode.value.substring(0,2)+S + signUpController.otpcode.value.substring(3);

                        FocusScope.of(context).requestFocus(focusNode3);}
                      },
                      inputFormatters:[
                        LengthLimitingTextInputFormatter(1),
                      ],
                      style: TextStyle(color: darkMain,fontSize: 25),
                      decoration: InputDecoration(border: InputBorder.none,contentPadding: EdgeInsets.all(8)),


                    ),
                  ),
                ),
                SizedBox(width: 15,),
                Container( width: 40,height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: TextField(focusNode: focusNode3,
                      keyboardType: TextInputType.number,
                      onChanged: (S){
    if (S.length == 1) {
                       signUpController.otpcode.value=signUpController.otpcode.value.substring(0,3)+S + signUpController.otpcode.value.substring(3);

                        FocusScope.of(context).requestFocus(focusNode4);}
                      },
                      inputFormatters:[
                        LengthLimitingTextInputFormatter(1),
                      ],
                      style: TextStyle(color: darkMain,fontSize: 25),
                      decoration: InputDecoration(border: InputBorder.none,contentPadding: EdgeInsets.all(5)),


                    ),
                  ),
                ),
                SizedBox(width: 15,),
                Container(
                  width: 40,height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child:Center(
                    child: TextField(focusNode: focusNode4,
                      keyboardType: TextInputType.number,
                      onChanged: (S){
    if (S.length == 1) {
                        signUpController.otpcode.value=signUpController.otpcode.value.substring(0,4)+S + signUpController.otpcode.value.substring(4);
                        FocusScope.of(context).requestFocus(focusNode5);}
                      },
                      inputFormatters:[
                        LengthLimitingTextInputFormatter(1),
                      ],
                      style: TextStyle(color: darkMain,fontSize: 25),
                      decoration: InputDecoration(border: InputBorder.none,contentPadding: EdgeInsets.all(8)),


                    ),
                  ),
                ),
                SizedBox(width: 15,),
                Container( width: 40,height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      focusNode: focusNode5,
                      onChanged: (S){
    if (S.length == 1) {
                        signUpController.otpcode.value=signUpController.otpcode.value.substring(0,5) +S;}

                      },
                      onSubmitted: (s){ widget.login?signUpController.verifyLoginOtp():signUpController.verifyOtp();},

                      inputFormatters:[
                        LengthLimitingTextInputFormatter(1),
                      ],
                      style: TextStyle(color: darkMain,fontSize: 25),
                      decoration: InputDecoration(border: InputBorder.none,contentPadding: EdgeInsets.all(10)),


                    ),
                  ),
                )
              ],
            ),
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(5),
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

