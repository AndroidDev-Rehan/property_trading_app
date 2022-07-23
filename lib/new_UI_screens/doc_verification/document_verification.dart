import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/global_widgets/custom_button.dart';
import '../../utils/app-color.dart';
import '../verification/verification.dart';

class DocumentVerificationScreen extends StatelessWidget {
  const DocumentVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMain,
      // appBar: buildCustomAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Submit Documents", style: TextStyle(color: mainGolden, fontSize: 25, fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              const Text("We need to verify your identity. Please submit the documents below to verify your identity", style: TextStyle(color: mainGolden, fontSize: 14, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
              const SizedBox(height: 40,),
              CustomElevatedButton(
                text: "  Photo ID  ",
                onPressed: (){},
                prefixIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Step 1",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                    SizedBox(height: 3,),
                    Icon(Icons.person_pin_sharp),
                  ],
                ),
                iconSpacing: 20,
                fixedSize: Size(Get.width*0.6*1.1,Get.height*0.0561*1.5,),
                color: mainGolden,
                textColor: darkMain,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: const Icon(Icons.upload_sharp),
                ),

              ),
              const SizedBox(height: 20,),
              CustomElevatedButton(
                text: "Take a Selfie",
                onPressed: (){},
                prefixIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Step 2",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                    SizedBox(height: 3,),
                    Icon(Icons.photo),
                  ],
                ),
                fixedSize: Size(Get.width*0.6*1.1,Get.height*0.0561*1.5,),
                color: mainGolden,
                textColor: darkMain,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: const Icon(Icons.upload_sharp),
                ),

              ),
              const SizedBox(height: 40,),
              CustomElevatedButton(
                text: "Next Step",
                onPressed: (){
                  Get.to(VerificationScreen());
                },
                fixedSize: Size(Get.width*0.55,Get.height*0.0561,),
                color: mainGolden,
                textColor: darkMain,
                suffixIcon: const Icon(Icons.arrow_forward),

              ),
              const SizedBox(height: 30,),
              const Text("Why this needed?", style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}
