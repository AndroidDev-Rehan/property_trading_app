import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:property_trading_app/view/auth/docverfication.dart';
// import 'package:nb_utils/nb_utils.dart';
import 'package:property_trading_app/view/auth/new_signUp.dart';
import 'package:property_trading_app/view/auth/phone_signin.dart';
import 'package:property_trading_app/view/auth/signin_options.dart';
import 'package:property_trading_app/view/auth/welcome_screen.dart';
import 'package:property_trading_app/view/home/graphscreen.dart';
import 'package:property_trading_app/view/home/home_screen.dart';
import 'package:property_trading_app/view/home/tradinghome.dart';
import 'package:property_trading_app/view/home/tradingsubcategory.dart';
import 'package:property_trading_app/view/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(209, 173, 93 ,1),
        // primaryColor: Color(0xFF133c4c),
          // primaryColor: Colors.amberAccent,
          // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromRGBO(10, 11, 60, 1), primary:Colors.amberAccent )

      ),
      // navigatorKey: navigatorKey,
      home: ProfileScreen(),
    );
  }
}
