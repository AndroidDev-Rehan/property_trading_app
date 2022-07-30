import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_trading_app/models/app_user.dart';
import 'package:property_trading_app/new_UI_screens/doc_verification/document_verification.dart';
import 'package:property_trading_app/new_UI_screens/verification/verification.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:toast/toast.dart';

class SignUpController extends GetxController {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
 var otpcode='      '.obs;
  Rx<String> smscode=''.obs;
  Rx<int?> token=0.obs;
  var secTimer=00.obs;
  StopWatchTimer? stopWatchTimer ;

  Future<bool> signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: emailController.text, password: passController.text);

      AppUser appUser = AppUser(
          username: userNameController.text,
          password: passController.text,
          email: emailController.text,
          phone: phoneNoController.text);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(appUser.toMap());
      print(
          "current user after signing up: ${FirebaseAuth.instance.currentUser}");
      return true;
    } catch (e) {
      Get.snackbar("Failed", e.toString());
      print(e);
      return false;
    }
  }

  Future registerUserWithPhonenumber(String Number) async {
    log('hhhhhhhhhhhhhhhhhhhhhhhhhh');

    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
        phoneNumber: Number,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential authCredential) {},
        verificationFailed: (FirebaseAuthException authException) {},
        codeSent: (String verificationId, int? forceResendingToken) {
          Toast.show("Otp Sent",backgroundColor: Colors.white, duration: Toast.lengthShort, gravity:  Toast.bottom);
          stopWatchTimer!.setPresetSecondTime(60);
          stopWatchTimer!.onExecute.add(StopWatchExecute.start);
          smscode.value = verificationId;
          token.value = forceResendingToken;
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  void verifyOtp() {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .currentUser!.linkWithCredential(PhoneAuthProvider.credential(
        verificationId: smscode.value, smsCode: otpcode.value))
        .then((result) async {
      Get.to(()=>DocumentVerificationScreen());
    }).catchError((e) {
      Get.snackbar('Invalid Otp', e.toString());
    });
  }

  bool isValidEmail(String email) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
  void verifyLoginOtp() {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .signInWithCredential(PhoneAuthProvider.credential(
        verificationId: smscode.value, smsCode: otpcode.value))
        .then((result) async {
      Get.to(()=>DocumentVerificationScreen());
    }).catchError((e) {
      Get.snackbar('Invalid Otp', e.toString());
    });
  }
}
