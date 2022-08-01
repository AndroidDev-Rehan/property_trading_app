import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/utils/CollectionNames.dart';

class AccountDetailController extends GetxController{
  Rx<bool> loading = false.obs;


  Future<void> accept(String id) async{
    loading.value = true;

    try{

      await FirebaseFirestore.instance.collection("users").doc(id).update({
        "activated" : true
      });

      await FirebaseFirestore.instance
          .collection(CollectionNames.userRequests)
          .doc(id)
          .delete();

      Get.back();
      Get.snackbar("Success", "Accepted",        backgroundColor: Colors.white
      );


    }
    catch (e){
      Get.snackbar("Failed", e.toString(),        backgroundColor: Colors.white
      );
    }
    loading.value = false;

  }


  Future<void> reject(String id) async{
    loading.value = true;

    try{
      await FirebaseFirestore.instance
          .collection(CollectionNames.userRequests)
          .doc(id)
          .delete();

      Get.back();
      Get.snackbar("Success", "Rejected",        backgroundColor: Colors.white
      );

    }
    catch (e){
      Get.snackbar("Failed", e.toString(),        backgroundColor: Colors.white
      );
    }
    loading.value = false;

  }

}