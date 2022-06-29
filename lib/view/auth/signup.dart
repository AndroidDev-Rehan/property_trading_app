import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:property_trading_app/view/auth/login.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:property_trading_app/view/auth/widget/otpdialog.dart';

import '../../utils/app-color.dart';
import '../../utils/text_style.dart';



class Signup extends StatefulWidget {


  const Signup({Key? key}) : super(key: key);
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.amberAccent,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [lightBlueStart, lightBlueEnd],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: MediaQuery.of(context).size.height / 1.10,
                  right: MediaQuery.of(context).size.width / 5,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(45 / 360),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: rectColorLightBlue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height / 1.20,
                  right: MediaQuery.of(context).size.width / 13,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(45 / 360),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                        color: rectColorLightBlue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height / 1.4,
                  right: MediaQuery.of(context).size.width / 4.8,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(45 / 360),
                    child: Container(
                      width: 75,
                      height: 75,
                      decoration: const BoxDecoration(
                        color: rectColorLightBlue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height / 2.4,
                  left: MediaQuery.of(context).size.width / 1.33,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      color: rectColorLightBlue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(150),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2.5,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(alignment:Alignment.centerRight,child: Image.asset("assets/images/g_marketing_logo.png", scale: 3.5,color:yellowmain,))                  // SvgPicture.asset('assets/images/loginicon.svg'),
                 , const SizedBox(height: 5),
                  const Text('Create, Your Account', style: welcomeStyle),

                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.7,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: const BoxDecoration(
                gradient: backgroundGradient,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: textFieldLabel,
                      fillColor: Colors.white,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: textFieldLabel,
                      fillColor: Colors.white,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: textFieldLabel,
                      fillColor: Colors.white,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Phone No',
                      labelStyle: textFieldLabel,
                      fillColor: Colors.white,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  RaisedButton(
                    onPressed: () {

                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                       color: yellowmain
                      ),
                      child: const Center(
                        child: Text(
                          'SignUp',
                          style: loginButtonLabel,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: (){
                      Get.to(LoginScreen());
                    },
                      child: const Text('Already have a Account? Sign in', style: forgotPassword))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
