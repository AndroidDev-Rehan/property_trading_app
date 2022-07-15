import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:property_trading_app/view/map/detailscreen.dart';

import '../../utils/app-color.dart';
import '../auth/phone_signin.dart';
import '../global_widgets/custom_button.dart';

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    // SizedBox(height: Get.height/4,),
                    CustomElevatedButton(text: "Pay Using Credit Card", onPressed: (){}, color: darkMain, fixedSize: const Size(265,65),iconData: Icons.credit_card,),
                    const SizedBox(height: 20,),
                    CustomElevatedButton(text: "Pay Using Debit Card", onPressed: (){}, color: darkMain, fixedSize: const Size(265,65),iconData: CupertinoIcons.creditcard,),
                    const SizedBox(height: 20,),
                    CustomElevatedButton(text: "Pay Using Cash           ", onPressed: (){
                      Get.to(const DetailScreen());
                    }, color: darkMain, fixedSize: Size(265,65), iconData: Icons.money,),
                    const SizedBox(height: 20,),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
