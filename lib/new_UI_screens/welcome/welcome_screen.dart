import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/new_UI_screens/signin/signin_options.dart';
import 'package:property_trading_app/new_UI_screens/signup/signup.dart';
import '../../../utils/app-color.dart';

import '../../global_widgets/custom_text.dart';
import '../admin/account_approval_requests.dart';



class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final double screenSize = Get.width;
    print(screenSize);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: darkMain
          // color: Theme.of(context).primaryColor,
        ),
        height: Get.height,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenSize,
              child:  Padding(
                padding: EdgeInsets.only(left: 20.0, bottom: 20, right: screenSize*0.05102),
                child: CustomText(text: 'Stay on top of your finance with us. ', size: 35),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
                onLongPress: () async{
                  await showAdminAlert(context);
                },
                onTap:(){
              Get.to(()=>SignInOptionsScreen());},
                child: Container(margin:EdgeInsets.symmetric(horizontal: 15),width:Get.width,height: 50,decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color:Colors.white),child: Center(child: Text('Login',style: TextStyle(color:darkMain,fontSize: 25),)),)),
            SizedBox(height: 30),
            InkWell(
                onTap: (){
                  Get.to(SignUp());
                },
                child: Container(margin:EdgeInsets.symmetric(horizontal: 15),width:Get.width,height: 50,decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color:Colors.white),child: Center(child: Text('Create account',style: TextStyle(color:darkMain,fontSize: 25),)),)),

          ],

        ),
      ),
    );
  }

  Future<void> showAdminAlert(BuildContext context) async{

    TextEditingController controller = TextEditingController();

    Widget okButton = FlatButton(
      child: const Text("OK"),
      onPressed: () {
        if(controller.text=="Admin123"){
          Navigator.of(context, rootNavigator: true).pop('dialog');
          Get.to(AccountApprovalRequests());
          return;
        }
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    AlertDialog dialog = AlertDialog(
        title: const Text('Secret Dialog'),
        actions: [ okButton,],
        content: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            controller: controller,
            obscureText: true,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              hintText: "ENTER PASSWORD",
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(30)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(30)

              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(30)

              ),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(30)
              ),
            ),
          ),
        )
    );
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

}
