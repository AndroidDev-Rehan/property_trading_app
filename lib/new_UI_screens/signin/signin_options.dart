import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/collect_user_info/collect_user_info.dart';
import 'package:property_trading_app/global_widgets/custom_text.dart';
import 'package:property_trading_app/new_UI_screens/doc_verification/document_verification.dart';
import 'package:property_trading_app/new_UI_screens/signin/email_signin.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:property_trading_app/new_UI_screens/signup/signup.dart';
import '../../../utils/app-color.dart';
import '../../controllers/google_signin_controller.dart';
import '../dashboard/dashboard.dart';
import '../otp/otpscreen.dart';
import '../verification/verification.dart';


class SignInOptionsScreen extends StatefulWidget {
  SignInOptionsScreen({Key? key}) : super(key: key);

  @override
  State<SignInOptionsScreen> createState() => _SignInOptionsScreenState();
}

class _SignInOptionsScreenState extends State<SignInOptionsScreen> {
  Size buttonsize=  Size(Get.width*0.7,Get.height*0.07);

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          color: darkMain,
          child: loading ? Center(
            child: CircularProgressIndicator(),
          ) : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomElevatedButton(
                text: "Sign In With Email",
                textStyle: TextStyle(fontSize: Get.width*0.037558, fontWeight: FontWeight.bold, color: darkMain),
                onPressed: (){
                Get.to( EmailSignInScreen());
                },
                color: Colors.white, fixedSize: buttonsize,textColor: darkMain,
                imageIcon: Image.asset("assets/images/phone1.png", height: 50, width: 40),

              ),
              const SizedBox(height: 20,),
              CustomElevatedButton(
                  text: "Sign In With Google",
                  textStyle: TextStyle(fontSize: Get.width*0.037558, fontWeight: FontWeight.bold, color: darkMain),
                  onPressed: () async{
                    setState((){
                      loading = true;
                    });
                    User? user = await GoogleSignInController.signInWithGoogle(context: context);
                    if(user!=null) {
                      DocumentSnapshot<Map> documentSnapshot = await FirebaseFirestore.instance.collection("users").doc(user.uid).get();
                      Map? map = documentSnapshot.data();

                      if(!documentSnapshot.exists){
                        Get.offAll(const CollectUserInfo());
                      }

                      // if( (map!["documentsSubmitted"] ==null) ||  (!map["documentsSubmitted"]) ){
                      String phoneNo = FirebaseAuth.instance.currentUser!.phoneNumber!;
                      await FirebaseAuth.instance.signOut();
                      Get.offAll(OtpScreen(phoneno: phoneNo ,login: true,));

                      // Get.snackbar("Success", "Login");
                      // print(user);
                    }

                    setState((){
                      loading = false;
                    });


                    // Get.to( DocumentVerificationScreen());

                  }, fixedSize: buttonsize,textColor: darkMain, color:  Colors.white,imageIcon: Image.asset("assets/images/google.png",height: 50, width: 50,)),
              const SizedBox(height: 20,),
              CustomElevatedButton(text: "Sign In With Apple ",
                textStyle: TextStyle(fontSize: Get.width*0.037558, fontWeight: FontWeight.bold, color: darkMain),
                onPressed: () async{
                }, fixedSize: buttonsize,textColor: darkMain, color:  Colors.white,imageIcon: Image.asset("assets/images/apple-logo.png", height: 40, width: 50),),
              const SizedBox(height: 60,),
              InkWell(
                  onTap: (){
                    Get.to(SignUp());
                  },
                  child: CustomText(text: 'Dont have an account ?  Sign Up', size: 20))


            ],
          ),
        ),
      ),
    );
  }
}



class CustomElevatedButton extends StatelessWidget {

  final String text;
  final Function onPressed;
  final Color? color;
  final double? roundness;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? textColor;
  final bool border;
  final Size? fixedSize;
  final Image? imageIcon;
  final IconData? iconData;
  final TextStyle? textStyle;


  const CustomElevatedButton({Key? key, required this.text, required this.onPressed, this.color, this.roundness, this.horizontalPadding, this.verticalPadding, this.border = false, this.textColor, this.fixedSize, this.imageIcon, this.iconData, this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ElevatedButton(
          onPressed: (){
            onPressed();
          },
          style: ElevatedButton.styleFrom(
              primary: color ?? darkMain,
              shape: StadiumBorder(),
              side: border ? BorderSide(color: Theme.of(context).primaryColor) : null,
              fixedSize: fixedSize
            // fixedSize: const Size(double.infinity, 50),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: horizontalPadding ?? 0, vertical: verticalPadding ?? 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                (imageIcon != null) ? imageIcon! : SizedBox(),
                (iconData != null) ? Icon(iconData) : SizedBox(),
                ((imageIcon != null) || (iconData!=null) )  ? SizedBox(width: 10,) : SizedBox(width: 0,),
                Text(text, style: textStyle ?? TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: textColor),),
              ],
            ),
          )
      ),
    );
  }
}