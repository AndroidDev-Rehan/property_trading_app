import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:property_trading_app/utils/constants.dart';

import '../models/app_user.dart';

class GoogleSignInController extends GetxController{

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();


  Future<bool> uploadInfo(User user, BuildContext context) async{
    try{

      QuerySnapshot<Map> x = await FirebaseFirestore.instance.collection("users").where("phone",isEqualTo: phoneNoController.text).get();
      if(x.docs.isNotEmpty){
        await showAlert("Number already registered with other account.");
        // Get.snackbar("Error", "Number already registered with other account.", backgroundColor: Colors.white);
        return false;
      }


      AppUser appUser = AppUser(
        username: userNameController.text,
        password: "",
        email: user.email!,
        phone: phoneNoController.text,
        id: user.uid,
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .set(appUser.toMap());

      return true;
    }
    catch(e){
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.white);
      rethrow;
      return false;
    }
  }


  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
        await auth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {
        print(e);
      }
    }

    else{
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
          await auth.signInWithCredential(credential);

          user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            await showAlert("Request Failed, ${e.code}");
            // Get.snackbar("Request Failed", e.code,         backgroundColor: Colors.white);
          } else if (e.code == 'invalid-credential') {
            await showAlert("Request Failed, ${e.code}");
            // Get.snackbar("Request Failed", e.code,         backgroundColor: Colors.white);
          }
        } catch (e) {
          await showAlert("Request Failed, ${e.toString()}");

          // Get.snackbar("Request Failed", e.toString(),        backgroundColor: Colors.white
          // );
        }
      }
    }
    return user;
  }


  static Future<void> signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      // if (!kIsWeb) {
      // }
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
      print("Current User with google sign in:");
      print(googleSignIn.currentUser);
    } catch (e) {
      Get.snackbar("Google signout error", e.toString(),        backgroundColor: Colors.white
      );
    }
  }

}