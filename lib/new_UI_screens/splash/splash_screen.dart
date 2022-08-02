import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/new_UI_screens/verification/verification.dart';
import '../../../utils/app-color.dart';
import '../welcome/welcome_screen.dart';
import 'package:property_trading_app/collect_user_info/collect_user_info.dart';
import 'package:property_trading_app/new_UI_screens/dashboard/dashboard.dart';
import 'package:property_trading_app/new_UI_screens/doc_verification/document_verification.dart';
import 'package:property_trading_app/new_UI_screens/welcome/welcome_screen.dart';

class CustomSplashScreen extends StatefulWidget {
  const CustomSplashScreen({Key? key}) : super(key: key);

  @override
  State<CustomSplashScreen> createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    screenFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMain,
      body: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 1, end: 0),
        duration: const Duration(seconds: 3),
        // child is *optional* so we can pass null or omit it
        child: null,
        // builder is *required*
        // note that the third argument is an (optional) child
        builder: (BuildContext context, double value, Widget? child) {
          return Transform.translate(
            offset: Offset((MediaQuery.of(context).size.width)*value,0 ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Text('Above Everyone Hello HI',style: TextStyle(fontSize: 18,color: Colors.white,fontStyle: FontStyle.italic),),
                // const SizedBox(height: 20,),
                Image.asset('assets/images/glogo1.png',),
                const SizedBox(height: 20,),
                const Text('Above the crowd in Property',style: TextStyle(fontSize: 18,color: Colors.white,fontStyle: FontStyle.italic),)
              ],
            ),
          );
        },
      ),

    );
  }

  screenFunction() async {
   Widget widget = await returnRightScreen();
   await Future.delayed(Duration(seconds: 5));
   Get.offAll(()=>widget);
  }

  Future<Widget> returnRightScreen()async{
    if (FirebaseAuth.instance.currentUser == null ){
      return const WelcomeScreen();
    }

    DocumentSnapshot<Map<String,dynamic>> documentSnapshot = await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();
    Map? map = documentSnapshot.data() ;

    if(!documentSnapshot.exists){
      return const CollectUserInfo();
    }

    // if( (map!["documentsSubmitted"] ==null) ||  (!map["documentsSubmitted"]) ){
    if( !(map!["documentsSubmitted"] ?? false)  ){
      return DocumentVerificationScreen();
    }

    if(! map["activated"] ){
      return VerificationScreen();
    }


    return const RootScreen();

  }

}