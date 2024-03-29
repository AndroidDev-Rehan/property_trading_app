import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/controllers/google_signin_controller.dart';
import 'package:property_trading_app/utils/app-color.dart';

import '../../global_widgets/custom_button.dart';
import '../../global_widgets/custom_text.dart';
import '../new_UI_screens/otp/otpscreen.dart';

class CollectUserInfo extends StatefulWidget {
  const CollectUserInfo({Key? key, required this.user}) : super(key: key);
  final User user;


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
                          style: const TextStyle(color: Colors.white, fontSize: 17),
                          decoration: const InputDecoration(
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
                const SizedBox(
                  height: 40,
                ),
                loading ? const SizedBox(
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

                      bool success = await googleSignInController.uploadInfo(widget.user,context);

                      setState((){
                        loading = false;
                      });

                      if(success){
                        Get.snackbar("Success", "Info Submitted", backgroundColor: Colors.white);

                        // try{
                        //   await GoogleSignInController.signOut();
                        // }
                        // catch(e){
                        //   print(e);
                        // }


                        Get.to(OtpScreen(phoneno: '+92${googleSignInController.phoneNoController.text.substring(1)}', user: widget.user,));
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
                const SizedBox(
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