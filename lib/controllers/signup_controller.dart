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

import '../collect_user_info/collect_user_info.dart';
import '../new_UI_screens/dashboard/dashboard.dart';

class SignUpController extends GetxController {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
 TextEditingController otpcode=TextEditingController();
  Rx<String> smscode=''.obs;
  Rx<int?> token=0.obs;
  var secTimer=00.obs;
  StopWatchTimer? stopWatchTimer ;

  Future<bool> signUp() async {
    try {
      
      QuerySnapshot<Map> x = await FirebaseFirestore.instance.collection("users").where("phone",isEqualTo: phoneNoController.text).get();
      if(x.docs.isNotEmpty){
        Get.snackbar("Error", "Number already registered with other account.", backgroundColor: Colors.white);
        return false;
      }


      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: emailController.text, password: passController.text);

      if(userCredential.user!=null) {

        AppUser appUser = AppUser(
          username: userNameController.text,
          password: passController.text,
          email: emailController.text,
          phone: phoneNoController.text,
          id: userCredential.user!.uid,
        );


        await FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set(appUser.toMap());
        print(
            "current user after signing up: ${FirebaseAuth.instance.currentUser}");
        return true;
      }
      return false;
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

        verificationCompleted: (PhoneAuthCredential authCredential) {
          otpcode.text=authCredential.smsCode.toString();
        },
        verificationFailed: (FirebaseAuthException authException) {},
        codeSent: (String verificationId, int? forceResendingToken) {
          Get.snackbar("Success","Otp Sent", backgroundColor: Colors.white);
          // Toast.show("Otp Sent",backgroundColor: Colors.white, duration: Toast.lengthShort, gravity:  Toast.lengthLong);
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
        verificationId: smscode.value, smsCode: otpcode.text))
        .then((result) async {
      Get.to(()=>DocumentVerificationScreen());
    }).catchError((e) {
      Get.snackbar('Invalid Otp', e.toString(),        backgroundColor: Colors.white
      );
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
        verificationId: smscode.value, smsCode: otpcode.text))
        .then((result) async {
      DocumentSnapshot<Map> documentSnapshot = await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();
      Map? map = documentSnapshot.data();

      if(!documentSnapshot.exists){
        Get.offAll(const CollectUserInfo());
      }

      // if( (map!["documentsSubmitted"] ==null) ||  (!map["documentsSubmitted"]) ){
      else if( !(map!["documentsSubmitted"] ?? false)  ){
        Get.offAll(DocumentVerificationScreen());
      }

      else if(! map["activated"] ){
        Get.offAll(VerificationScreen());
      }

      else{
        Get.offAll(const RootScreen());
      }
      // Get.snackbar("Success", "Login");
      // print(user);
    }).catchError((e) {
      Get.snackbar('Invalid Otp', e.toString(),        backgroundColor: Colors.white
      );
    });
  }


}
