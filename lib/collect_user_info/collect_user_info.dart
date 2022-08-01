import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/controllers/google_signin_controller.dart';
import 'package:property_trading_app/new_UI_screens/doc_verification/document_verification.dart';
import 'package:property_trading_app/utils/app-color.dart';

import '../../global_widgets/custom_button.dart';
import '../../global_widgets/custom_text.dart';

class CollectUserInfo extends StatefulWidget {
  const CollectUserInfo({Key? key}) : super(key: key);

  @override
  State<CollectUserInfo> createState() => _CollectUserInfoState();
}

class _CollectUserInfoState extends State<CollectUserInfo> {
  final GoogleSignInController googleSignInController = GoogleSignInController();

  final GlobalKey<FormState> _key =   GlobalKey<FormState>();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: darkMain,
        height: Get.height,
        width: Get.width,
        child: Form(
          key: _key,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                CustomText(text: 'First Enter your information', size: Get.width*0.063775, fontWeight: FontWeight.bold,),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                        child: TextFormField(
                          validator: (value){
                            if(value == null || value.trim().isEmpty){
                              return "Field is required";
                            }
                            return null;
                          },
                          controller: googleSignInController.userNameController,
                          style: const TextStyle(color: Colors.white, fontSize: 17),
                          decoration: const InputDecoration(
                              hintText: 'Full Name',
                              hintStyle: TextStyle(fontSize: 17, color: Colors.white),
                              fillColor: Colors.grey,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.white, width: 2)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.white, width: 2))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                        child: TextFormField(
                          validator: (value){
                            if(value == null || value.trim().isEmpty){
                              return "Field is required";
                            }
                            return null;
                          },
                          controller: googleSignInController.phoneNoController,
                          style: TextStyle(color: Colors.white, fontSize: 17),
                          decoration: InputDecoration(
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(fontSize: 17, color: Colors.white),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.white, width: 2)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.white, width: 2))),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                loading ? SizedBox(
                  height: 40,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ):
                CustomElevatedButton(
                  text: "Submit",
                  onPressed: () async{
                    if(_key.currentState!.validate()){
                      setState((){
                        loading = true;
                      });

                      bool success = await googleSignInController.uploadInfo();

                      setState((){
                        loading = false;
                      });

                      if(success){
                        Get.snackbar("Success", "Info Submitted",        backgroundColor: Colors.white
                        );
                        Get.to(DocumentVerificationScreen());
                      }

                    }
                  },
                  fixedSize: Size(
                    Get.width * 0.5,
                    Get.height * 0.0561,
                  ),
                  color: mainGolden,
                  textColor: darkMain,
                  // suffixIcon: const Icon(Icons.arrow_forward),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

