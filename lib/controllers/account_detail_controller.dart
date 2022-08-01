import 'package:cloud_firestore/cloud_firestore.dart';
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
      Get.snackbar("Success", "Accepted");


    }
    catch (e){
      Get.snackbar("Failed", e.toString());
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
      Get.snackbar("Success", "Rejected");

    }
    catch (e){
      Get.snackbar("Failed", e.toString());
    }
    loading.value = false;

  }

}