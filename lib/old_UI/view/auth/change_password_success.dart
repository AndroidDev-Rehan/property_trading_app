import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../global_widgets/custom_button.dart';

class ChangedPassSuccess extends StatelessWidget {
  const ChangedPassSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/logo.png", scale: 5,),
            SizedBox(height: 20,),
            Text("Congrats!!", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30
            ),),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Text("You have successfully changed password, please use new password for login", style: TextStyle(fontSize: 14), textAlign: TextAlign.center,),
            ),
            SizedBox(height: 30,),
            CustomElevatedButton(text: "Login Now", onPressed: (){}, roundness: 5, horizontalPadding: Get.width*0.178571428, verticalPadding: 15,),
          ],

        ),
      ),
    );
  }
}
