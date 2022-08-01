import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/global_widgets/custom_app_bar.dart';
import 'package:property_trading_app/models/app_user_request.dart';
import 'package:property_trading_app/utils/app-color.dart';

import '../../global_widgets/custom_button.dart';
import '../../global_widgets/custom_text.dart';
import '../../utils/CollectionNames.dart';
import 'account_detail.dart';

class AccountApprovalRequests extends StatelessWidget {
  const AccountApprovalRequests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMain,
      appBar: buildCustomAppBar(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection(CollectionNames.userRequests).snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot) {

          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }

          if(snapshot.connectionState ==  ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index)=> UserAccountApprovalTile(userRequest: UserRequest.fromMap(snapshot.data!.docs[index].data()))

            ),
          );
        }
      ),
    );
  }

}

class UserAccountApprovalTile extends StatefulWidget {

  final UserRequest userRequest;

  const UserAccountApprovalTile({Key? key, required this.userRequest}) : super(key: key);

  @override
  State<UserAccountApprovalTile> createState() => _UserAccountApprovalTileState();
}

class _UserAccountApprovalTileState extends State<UserAccountApprovalTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(AccountDetailScreen(userRequest: widget.userRequest,));
        },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///top  Row
          _buildTopRow(),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: _buildLowerPortion(),
          ),
          const Divider(color: textColor,thickness: 2,),
          const SizedBox(height: 10,)
        ],
      ),
    );
  }


  Widget _buildTopRow() {
    return Row(
      children: [
        _buildPersonIcon(),
        const SizedBox(
          width: 10,
        ),
        CustomText(text: widget.userRequest.user.username, size: 18, ),
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.email, color: Colors.white,),
            SizedBox(width: 20,),
            Text("Email: ", style: TextStyle(color: Colors.white, fontSize: 15)),
            SizedBox(width: 20,),
            Text(widget.userRequest.user.email, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Icon(Icons.phone, color: Colors.white,),
            SizedBox(width: 20,),
            Text("Phone: ", style: TextStyle(color: Colors.white, fontSize: 15)),
            SizedBox(width: 20,),
            Text(widget.userRequest.user.phone, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          ],
        ),
        SizedBox(height: 20,),

      ],
    );
  }

}
