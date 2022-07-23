import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/global_widgets/custom_button.dart';

import '../../global_widgets/custom_app_bar.dart';
import '../../utils/app-color.dart';

class ProfileTransferScreen extends StatelessWidget {
  const ProfileTransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Get.width);
    double paddingRes30 = Get.width*0.070093;

    return Scaffold(
      appBar: buildCustomAppBar(),
      backgroundColor: darkMain,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: paddingRes30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Icon(Icons.arrow_back, color: mainGolden,),
                  ),
                ],
              ),
              SizedBox(height: Get.height* 0.0777 * 0.65,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingRes30, vertical: 18),
                child: _buildCustomTextField("User Id", readOnly: true),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingRes30, vertical: 18),
                child: _buildCustomTextField("Enter Category"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingRes30, vertical: 18),
                child: _buildCustomTextField("Enter Sub Category", readOnly: true),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingRes30, vertical: 18),
                child: _buildCustomTextField("Enter File Number"),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: paddingRes30, vertical: 8),
              //   child: _buildCustomTextField("Your DOB"),
              // ),
              const SizedBox(height: 20,),
              CustomElevatedButton(
                text: "Transfer File",
                onPressed: (){},
                fixedSize: Size(Get.width*0.644859813,Get.height*0.0561,),
                color: mainGolden,
                textColor: darkMain,

              ),
              const SizedBox(height: 20,)



            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomTextField(String hintText, {bool readOnly = false}){
    return TextFormField(
      readOnly: readOnly,
      decoration:  InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
        border: const OutlineInputBorder(
          // borderSide: const BorderSide(color: darkMain, ),
          // borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: const OutlineInputBorder(
          // borderSide: const BorderSide(color: darkMain, ),
          // borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: const OutlineInputBorder(
          // borderSide: const BorderSide(color: darkMain, ),
          // borderRadius: BorderRadius.circular(30),
        ),
        disabledBorder: const OutlineInputBorder(
          // borderSide: const BorderSide(color: darkMain, ),
          // borderRadius: BorderRadius.circular(30),
        ),

        // isDense: true,
        filled: true,
        contentPadding: const EdgeInsets.only(top: 5, left: 15),
        fillColor: Colors.white,
      ),
      style: const TextStyle(
        color: Colors.black,

      ),
      cursorColor: Colors.black,
    );
  }
}
