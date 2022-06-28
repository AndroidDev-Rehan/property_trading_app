import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:nb_utils/nb_utils.dart';
import 'package:property_trading_app/view/auth/login.dart';
import 'package:property_trading_app/view/auth/signup.dart';

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
          primaryColor: Colors.amberAccent,
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromRGBO(10, 11, 60, 1), primary:Colors.amberAccent )

      ),
      // navigatorKey: navigatorKey,
      home: const Signup(),
    );
  }
}

