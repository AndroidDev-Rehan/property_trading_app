import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/global_widgets/custom_button.dart';

import '../../global_widgets/custom_app_bar.dart';
import '../../utils/app-color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Icon(Icons.arrow_back_ios_sharp, color: mainGolden,),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 8,),
                      Text("Bio-data", style: TextStyle(fontSize: 18, color: mainGolden),),
                      SizedBox(height: 30,),
                      Image.asset("assets/images/Oval.png"),
                      const SizedBox(height: 3,),
                      const Text("Martha Craig", style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 3,),
                      const Text("marthacraig@gmail.com", style: TextStyle(fontSize: 15, color: Colors.white),),

                    ],
                  ),
                  Icon(Icons.arrow_back_ios_sharp, color: darkMain,),

                ],
              ),
              SizedBox(height: Get.height* 0.0777 * 0.65,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingRes30, vertical: 8),
                child: _buildCustomTextField("Username", readOnly: true),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingRes30, vertical: 8),
                child: _buildCustomTextField("Password"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingRes30, vertical: 8),
                child: _buildCustomTextField("Email Address", readOnly: true),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingRes30, vertical: 8),
                child: _buildCustomTextField("Your Address"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingRes30, vertical: 8),
                child: _buildCustomTextField("Your DOB"),
              ),
              const SizedBox(height: 20,),
              CustomElevatedButton(
                text: "Update Profile",
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
          border: OutlineInputBorder(
            // borderSide: const BorderSide(color: darkMain, ),
            // borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            // borderSide: const BorderSide(color: darkMain, ),
            // borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            // borderSide: const BorderSide(color: darkMain, ),
            // borderRadius: BorderRadius.circular(30),
          ),
          disabledBorder: OutlineInputBorder(
            // borderSide: const BorderSide(color: darkMain, ),
            // borderRadius: BorderRadius.circular(30),
          ),

          // isDense: true,
          filled: true,
          contentPadding: EdgeInsets.only(top: 5, left: 15),
          fillColor: Colors.white,
      ),
      style: const TextStyle(
        color: Colors.black,

      ),
      cursorColor: Colors.black,
    );
  }


}
