import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:property_trading_app/models/app_user.dart';

class SignUpController extends GetxController{
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController= TextEditingController();
  final TextEditingController confirmPassController= TextEditingController();
  final TextEditingController phoneNoController= TextEditingController();


  Future<bool> signUp() async{
    try{
     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passController.text);

    AppUser appUser = AppUser(username: userNameController.text, password: passController.text, email: emailController.text, phone: phoneNoController.text);
     await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).set(appUser.toMap());
     print("current user after signing up: ${FirebaseAuth.instance.currentUser}");
     return true;
    }
    catch(e){
      Get.snackbar("Failed", e.toString());
      print(e);
      return false;
    }
  }

  bool isValidEmail(String email){
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }


}