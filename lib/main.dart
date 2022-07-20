import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:property_trading_app/new_UI_screens/signup/signup.dart';
import 'package:property_trading_app/new_UI_screens/splash/splash_screen.dart';
import 'package:property_trading_app/old_UI/view/auth/docverfication.dart';
// import 'package:nb_utils/nb_utils.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'new_UI_screens/payment_method/payment_method.dart';
import 'old_UI/view/auth/splash_screen.dart';
import 'old_UI/view/home/tradingsubcategory.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeDateFormatting().then((_) => runApp(const MyApp()));

  // await initialize();
  // runApp(const MyApp());
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
      home: SignUp(),
    );
  }
}
