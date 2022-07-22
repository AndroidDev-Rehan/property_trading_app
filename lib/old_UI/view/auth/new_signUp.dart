import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/old_UI/utils/app-color.dart';
import 'package:property_trading_app/old_UI/view/auth/docverfication.dart';
import 'package:property_trading_app/old_UI/view/global_widgets/custom_button.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../utils/app-color.dart';

import '../../../utils/text_style.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: darkMain,
          title: const Text("Account"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(

                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: darkMain, width: 3),
                    color: darkMain

                  ),
                  padding: const EdgeInsets.all(16),
                  child: const Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  )),
              const SizedBox(
                height: 20,
              ),
              textFieldWithLabel("Your Name", context),
              textFieldWithLabel("Bank Account", context),
              textFieldWithLabel("Email", context),
              textFieldWithLabel("Password", context),
              textFieldWithLabel("Confirm Password", context),
              textFieldWithLabel("Phone Number", context),
              textFieldWithLabel("Your Address", context),
              const SizedBox(height: 30,),
              CustomElevatedButton(text: "Save Changes", onPressed: (){
                // Get.to(const DocVer());
              }, roundness: 10,verticalPadding: 10,)
              

            ],
          ),
        ),
      ),
    );
  }

  Widget textFieldWithLabel(String label, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, right: 40, left: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.black),),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            decoration: const InputDecoration(
              // label: Text(label),
              border: OutlineInputBorder(),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 10)
            ),
          ),
        ],
      ),
    );
  }
}
