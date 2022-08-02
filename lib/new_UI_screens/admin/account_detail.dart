import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/controllers/account_detail_controller.dart';
import 'package:property_trading_app/global_widgets/custom_app_bar.dart';
import 'package:property_trading_app/models/app_user_request.dart';
import 'package:property_trading_app/utils/app-color.dart';

import '../../global_widgets/custom_button.dart';
import '../../global_widgets/custom_text.dart';
import '../../utils/CollectionNames.dart';

class AccountDetailScreen extends StatelessWidget {
  AccountDetailScreen({Key? key, required this.userRequest}) : super(key: key);
  final UserRequest userRequest;

  final AccountDetailController accountDetailController = AccountDetailController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(),
      backgroundColor: darkMain,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => _buildAcceptOrReject()),
              const SizedBox(height: 20,),
              _buildTopRow(),
              const SizedBox(height: 10,),
              _buildLowerPortion(),
              const Divider(color: textColor,thickness: 2,),
              const SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAcceptOrReject(){
    return accountDetailController.loading.value ? SizedBox(
      height: 50,
      child: Center(child: CircularProgressIndicator()),)
        : Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomElevatedButton(
          text: "Accept",
          textStyle: const TextStyle(
              color: darkMain
          ),
          suffixIcon: Icon(Icons.check, color: Colors.green),
          onPressed: () async{
            await accountDetailController.accept(userRequest.user.id);

          },
          horizontalPadding: 6,
          verticalPadding: 0,
          color: Colors.green,
          roundness: 5,
        ),
        CustomElevatedButton(
          text: "Reject",
          textStyle: const TextStyle(
              color: darkMain
          ),
          // prefixIcon: Icon(Icons.close, color: Colors.red),
          suffixIcon: Icon(Icons.close, color: Colors.red),

          onPressed: () async {
            await accountDetailController.reject(userRequest.user.id);

          },
          horizontalPadding: 6,
          verticalPadding: 0,
          color: Colors.green,
          roundness: 5,
        ),


      ],
    );
  }


  Widget _buildTopRow() {
    return Row(
      children: [
        _buildPersonIcon(),
        const SizedBox(
          width: 10,
        ),
        CustomText(text: userRequest.user.username, size: 18, ),
      ],
    );
  }


  Widget _buildPersonIcon() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[700],
      ),
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(2),
        child: Icon(Icons.person, color: Colors.grey[700],),
      ),
    );
  }

  Widget _buildLowerPortion(){
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.email, color: Colors.white,),
              SizedBox(width: 20,),
              Text("Email:  ", style: TextStyle(color: Colors.white, fontSize: 15)),
              SizedBox(width: 20,),
              Text(userRequest.user.email, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Icon(Icons.phone, color: Colors.white,),
              SizedBox(width: 20,),
              Text("Phone: ", style: TextStyle(color: Colors.white, fontSize: 15)),
              SizedBox(width: 20,),
              Text(userRequest.user.phone, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Icon(Icons.photo, color: Colors.white,),
              SizedBox(width: 20,),
              Text("Photo ID Front", style: TextStyle(color: Colors.white, fontSize: 15)),
            ],
          ),
          SizedBox(height: 10,),
          Image.network(userRequest.photoIdUrl),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.photo, color: Colors.white,),
              SizedBox(width: 20,),
              Text("Photo ID Back", style: TextStyle(color: Colors.white, fontSize: 15)),
            ],
          ),
          SizedBox(height: 10,),
          Image.network(userRequest.photoIdBackUrl),
          SizedBox(height: 20,),

          Row(
            children: [
              Icon(Icons.camera_alt, color: Colors.white,),
              SizedBox(width: 20,),
              Text("Selfie ", style: TextStyle(color: Colors.white, fontSize: 15)),
            ],
          ),
          SizedBox(height: 10,),
          Image.network(userRequest.selfieUrl),
          SizedBox(height: 20,)

        ],
      ),
    );
  }

}
