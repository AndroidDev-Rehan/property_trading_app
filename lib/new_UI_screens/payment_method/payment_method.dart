import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:property_trading_app/old_UI/view/map/detailscreen.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../utils/app-color.dart';

import '../../utils/app-color.dart';

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // SizedBox(height: Get.height/4,),
                    CustomElevatedButton(text: "Cash in Office", onPressed: (){}, color: Colors.white, fixedSize: const Size(265,65),iconData: Icons.check_box_outline_blank,),
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
