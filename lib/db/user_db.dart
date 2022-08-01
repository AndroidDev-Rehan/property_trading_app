import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:property_trading_app/models/app_user.dart';

class UserDatabase{
 Future<AppUser?> getCurrentUser() async{
   try{
      DocumentSnapshot<Map<String,dynamic>> documentSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      return AppUser.fromMap(documentSnapshot.data()!);
    }
    catch(e){
     Get.snackbar("Error",e.toString(),        backgroundColor: Colors.white
     );
     print(e);
     return null;
    }
  }
}