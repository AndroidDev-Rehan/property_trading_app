
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:property_trading_app/new_UI_screens/splash/splash_screen.dart';
import 'package:property_trading_app/utils/binding.dart';




void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  MobileAds.instance.initialize();

  // await GoogleSignInController.signOut();

  print("Current User id with Firebase Auth: ${FirebaseAuth.instance.currentUser?.uid}");
  print("Current User with google sign in: ${GoogleSignIn().currentUser}");

  runApp(const MyApp());
  print("hi");

  // await initialize();
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("height: ${Get.height}");
    print("width: ${Get.width}");
    print("current User: ${FirebaseAuth.instance.currentUser}");

    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(209, 173, 93 ,1),
      ),
      // navigatorKey: navigatorKey,
      home:  CustomSplashScreen(),
      initialBinding: AuthBinding(),
    );
  }
}
