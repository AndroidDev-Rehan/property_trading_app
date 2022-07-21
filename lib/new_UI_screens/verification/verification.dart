import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/global_widgets/custom_button.dart';

import '../../global_widgets/custom_app_bar.dart';
import '../../utils/app-color.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMain,
      appBar: buildCustomAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/verify_img-removebg-preview.png"),
              SizedBox(height: 20,),
              Text("Congrats !!", style: TextStyle(color: mainGolden, fontSize: 25, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text("You have successfully changed password.\n Please use new password while login!", style: TextStyle(color: mainGolden, fontSize: 14, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
              SizedBox(height: 40,),
              CustomElevatedButton(
                text: "Login Now",
                onPressed: (){},
                fixedSize: Size(Get.width*0.644859813,Get.height*0.0561,),
                color: mainGolden,
                textColor: darkMain,

              )



            ],
          ),
        ),
      ),
    );
  }
}
