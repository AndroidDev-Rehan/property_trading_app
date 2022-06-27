import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app-color.dart';
import '../../utils/text_style.dart';



class Login extends StatefulWidget {


  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              height: MediaQuery.of(context).size.height / 2,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SvgPicture.asset('assets/images/loginicon.svg'),
                  const SizedBox(height: 25),
                  const Text('Welcome,', style: welcomeStyle),
                  const Text('Sign in to continue', style: welcomeSubStyle),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: const BoxDecoration(
                color: blueMain,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    initialValue: 'hello@work.com',
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
                    initialValue: '123456',
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: textFieldLabel,
                      fillColor: Colors.white,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(top: 18.0),
                        child: Icon(Icons.remove_red_eye, color: Colors.white, size: 20,),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, 'bitcoin', (Route<dynamic> route) => false);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [yellowStart, yellowEnd],
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Login',
                          style: loginButtonLabel,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Forgot your password?', style: forgotPassword)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}