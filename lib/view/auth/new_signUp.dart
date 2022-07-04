import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:property_trading_app/utils/app-color.dart';
import 'package:property_trading_app/view/global_widgets/custom_button.dart';
import 'package:property_trading_app/view/home/tradinghome.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: darkMain,
          title: Text("Account"),
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
                  padding: EdgeInsets.all(16),
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: white,
                  )),
              SizedBox(
                height: 20,
              ),
              textFieldWithLabel("Your Name", context),
              textFieldWithLabel("Bank Account", context),
              textFieldWithLabel("Email", context),
              textFieldWithLabel("Password", context),
              textFieldWithLabel("Phone Number", context),
              textFieldWithLabel("Your Address", context),
              SizedBox(height: 30,),
              CustomElevatedButton(text: "Save Changes", onPressed: (){
                Get.to(TradingHome());
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
          Text(label, style: TextStyle(color: Theme.of(context).primaryColor),),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            decoration: InputDecoration(
              // label: Text(label),
              border: OutlineInputBorder(),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 7)
            ),
          ),
        ],
      ),
    );
  }
}
