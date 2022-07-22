import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/global_widgets/custom_button.dart';

import '../../global_widgets/custom_app_bar.dart';
import '../../utils/app-color.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Get.width);
    return Scaffold(
      backgroundColor: darkMain,
      appBar: buildCustomAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/verify_latest.png"),
              const SizedBox(height: 0,),
              Text("Congrats !!", style: TextStyle(color: mainGolden, fontSize: Get.width * 0.0636574, fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              Text("Your application has been successfully submitted. You will be notified your shortly", style: TextStyle(color: mainGolden, fontSize: Get.width*0.0356, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
              const SizedBox(height: 40,),
              CustomElevatedButton(
                text: "Login Now",
                onPressed: (){},
                fixedSize: Size(Get.width*0.644859813,Get.height*0.0561,),
                color: mainGolden,
                textColor: darkMain,

              ),



            ],
          ),
        ),
      ),
    );
  }
}
