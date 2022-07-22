import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../utils/app-color.dart';


class SignInOptionsScreen extends StatelessWidget {
  SignInOptionsScreen({Key? key}) : super(key: key);
  Size buttonsize=  Size(Get.width*0.7,Get.height*0.07);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          color: darkMain,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomElevatedButton(text: "Sign In With Phone", onPressed: (){

              }, color: Colors.white, fixedSize: buttonsize,textColor: darkMain, imageIcon: Image.asset("assets/images/phone1.png", height: 50, width: 40),),
              const SizedBox(height: 20,),
              CustomElevatedButton(text: "Sign In With Google", onPressed: (){}, fixedSize: buttonsize,textColor: darkMain, color:  Colors.white,imageIcon: Image.asset("assets/images/google.png",height: 50, width: 50,)),
              const SizedBox(height: 20,),
              CustomElevatedButton(text: "Sign In With Apple ", onPressed: (){}, fixedSize: buttonsize,textColor: darkMain, color:  Colors.white,imageIcon: Image.asset("assets/images/apple-logo.png", height: 40, width: 50),),
              const SizedBox(height: 60,),
              RichText(text: TextSpan(style: TextStyle(color: Colors.white,fontSize: 20),text: 'Have an account ?',children: [TextSpan(text:'  Login',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold))]))



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


  const CustomElevatedButton({Key? key, required this.text, required this.onPressed, this.color, this.roundness, this.horizontalPadding, this.verticalPadding, this.border = false, this.textColor, this.fixedSize, this.imageIcon, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ElevatedButton(
          onPressed: (){
            onPressed();
          },
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: horizontalPadding ?? 0, vertical: verticalPadding ?? 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                (imageIcon != null) ? imageIcon! : SizedBox(),
                (iconData != null) ? Icon(iconData) : SizedBox(),
                ((imageIcon != null) || (iconData!=null) )  ? SizedBox(width: 10,) : SizedBox(width: 0,),
                Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: textColor),),
              ],
            ),
          ),
          style: ElevatedButton.styleFrom(
              primary: color ?? darkMain,
              shape: StadiumBorder(),
              side: border ? BorderSide(color: Theme.of(context).primaryColor) : null,
              fixedSize: fixedSize
            // fixedSize: const Size(double.infinity, 50),
          )
      ),
    );
  }
}