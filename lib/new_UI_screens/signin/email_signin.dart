import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/custom_button.dart';
import '../../old_UI/view/auth/widget/CustomTextField.dart';
import '../../utils/app-color.dart';
import '../doc_verification/document_verification.dart';

class EmailSignInScreen extends StatefulWidget {
  const EmailSignInScreen({Key? key}) : super(key: key);

  @override
  State<EmailSignInScreen> createState() => _EmailSignInScreenState();
}

class _EmailSignInScreenState extends State<EmailSignInScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkMain,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: Get.height/2,
                color: darkMain,
                child: Align(
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/glogo1.png",
                      // height: 150, width: 150,
                    )

                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                     CustomTextField(label: "EMAIL", labelStyle: TextStyle(
                      color: Colors.white,
                      // color: mainGolden,
                        fontWeight: FontWeight.bold),
                      controller: emailController,

                    ),
                    const SizedBox(height: 0,),
                     CustomTextField(
                        label: "PASSWORD", labelStyle: TextStyle(
                        color: Colors.white,
                        // color: mainGolden,
                        fontWeight: FontWeight.bold),
                     controller: passController,
                     ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        loading ?
                            SizedBox(height: 40,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),):
                        CustomElevatedButton(
                            text: "LOGIN",

                            onPressed: () async{
                              setState((){
                                loading = true;
                              });
                              await _login(context);
                              if(mounted){
                              setState(() {
                                loading = false;
                              });
                            }
                          }, verticalPadding: 10, horizontalPadding: 10,

                            // roundness: 10

                        ),
                      ],
                    ),
                    const SizedBox(height: 100,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _login(BuildContext context) async{
    try{

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passController.text);
      Get.offAll(DocumentVerificationScreen());
    }
    catch(e){
      showAlert(context,e.toString());
    }
  }

  void showAlert(BuildContext context, String content) {
    Widget okButton = FlatButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    AlertDialog dialog = AlertDialog(
        title: const Text('Alert Dialog'),
        actions: [ okButton,],
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Error: $content'),
            ],
          ),
        )
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}


