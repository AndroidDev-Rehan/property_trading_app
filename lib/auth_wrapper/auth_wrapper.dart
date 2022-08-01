import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:property_trading_app/collect_user_info/collect_user_info.dart';
import 'package:property_trading_app/new_UI_screens/dashboard/dashboard.dart';
import 'package:property_trading_app/new_UI_screens/doc_verification/document_verification.dart';
import 'package:property_trading_app/new_UI_screens/welcome/welcome_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: returnRightScreen(),
          builder: (context, index){

          })  ,
    );

  }



}
