import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/new_UI_screens/chat/chat.dart';

import '../../global_widgets/custom_app_bar.dart';
import '../../utils/app-color.dart';

class OtherUserProfileScreen extends StatelessWidget {
  const OtherUserProfileScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double paddingRes30 = Get.width*0.070093;

    return Scaffold(
      appBar: buildCustomAppBar(),
      backgroundColor: darkMain,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: paddingRes30),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Icon(Icons.arrow_back_ios_sharp, color: mainGolden,),
                ),
                InkWell(
                  onTap: (){
                    Get.to(ChatPage());
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Image.asset("assets/images/Oval.png"),
                      SizedBox(height: 3,),
                      Text("Martha Craig", style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),),
                      SizedBox(height: 3,),
                      Text("Messenger", style: TextStyle(fontSize: 15, color: Colors.grey),),

                    ],
                  ),
                ),
                Icon(Icons.arrow_back_ios_sharp, color: darkMain,),

              ],
            ),
            SizedBox(height: Get.height* 0.0777,),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24 ),
                width: double.infinity,
                color: Colors.white,
                child: const Text("Username", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24 ),
                width: double.infinity,
                color: Colors.white,
                child: const Text("Address", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24 ),
                width: double.infinity,
                color: Colors.white,
                child: const Text("Files", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
              ),
            ),


          ],
        ),
      ),
    );
  }
}

