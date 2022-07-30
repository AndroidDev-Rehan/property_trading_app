import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:property_trading_app/new_UI_screens/splash/splash_screen.dart';
import 'package:toast/toast.dart';
import 'new_UI_screens/home/ads_screen.dart';
import 'new_UI_screens/signin/email_signin.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


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

    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(209, 173, 93 ,1),
      ),
      // navigatorKey: navigatorKey,
      home: CustomSplashScreen(),
    );
  }
}
