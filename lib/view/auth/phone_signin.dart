import 'package:flutter/material.dart';
import 'package:property_trading_app/view/auth/widget/CustomTextField.dart';
import 'package:property_trading_app/view/global_widgets/custom_button.dart';
import 'package:get/get.dart';

import '../../utils/app-color.dart';


class PhoneSignInScreen extends StatelessWidget {
  const PhoneSignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                width: Get.width,
                color: darkMain,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset("assets/images/logo.png", height: 150, width: 150,)),
              )),
          Expanded(
            flex: 3,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomTextField(label: "PHNONE", labelStyle: TextStyle(color: mainGolden, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 0,),
                  const CustomTextField(label: "PASSWORD", labelStyle: TextStyle(color: mainGolden, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10,),
                  CustomElevatedButton(text: "LOGIN", onPressed: (){}, verticalPadding: 10, horizontalPadding: 10,roundness: 10),
                  const SizedBox(height: 100,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
