import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:property_trading_app/global_widgets/custom_button.dart';
import 'package:property_trading_app/new_UI_screens/payment/payment_method.dart';
import 'package:property_trading_app/new_UI_screens/profile/other_user_profile.dart';
import '../../global_widgets/custom_app_bar.dart';
import '../../global_widgets/custom_text.dart';
import '../../utils/app-color.dart';

class P2PScreen extends StatelessWidget {
  const P2PScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMain,
      appBar: buildCustomAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        children: [
          _buildSingleP2PTile(context),
          _buildSingleP2PTile(context),
          _buildSingleP2PTile(context),
          _buildSingleP2PTile(context),
          _buildSingleP2PTile(context),
          _buildSingleP2PTile(context),
          _buildSingleP2PTile(context),
          _buildSingleP2PTile(context),


        ],
      ),
    );
  }

  Widget _buildLowerLeftPortion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              "Project ( DHA )",
              style: TextStyle(fontSize: 15, color: mainGolden, fontWeight: FontWeight.bold),
            ),
            // SizedBox(
            //   width: 40,
            // ),
          ],
        ),
        const SizedBox(height: 5,),
        Row(
          children: const [
            Text("Price |", style: TextStyle(fontSize: 12, color: mainGolden)),
            SizedBox(
              width: 20,
            ),
            Text("4500", style: TextStyle(fontSize: 15, color: mainGolden)),

          ],
        ),
        const SizedBox(height: 5,),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              "Selling Limit |",
              style: TextStyle(fontSize: 12, color: mainGolden),
            ),
            SizedBox(
              width: 20,
            ),
            Text("\$44000 - \$48000",
                style: TextStyle(fontSize: 12, color: mainGolden)),
          ],
        ),
      ],
    );
  }

  Widget _buildLowerRow(BuildContext context) {
    return Row(
      children: [
        _buildLowerLeftPortion(),
        const Spacer(),
        CustomElevatedButton(
          text: "Chat",
          textStyle: const TextStyle(),

          onPressed: () {
            pushNewScreen(
              context,
              screen: PaymentOptions(),
              withNavBar: true, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
          horizontalPadding: 6,
          verticalPadding: 0,
          color: Colors.green,
          roundness: 5,
        )
      ],
    );
  }

  Widget _buildSingleP2PTile(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(OtherUserProfileScreen());
      },
      child: Column(
        children: [
          ///top  Row
          _buildTopRow(),
          const SizedBox(height: 10,),
          _buildLowerRow(context),
          const Divider(color: mainGolden,thickness: 2,),
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
        CustomText(text: 'Arslan Ahmad', size: 15),
        const Icon(
          Icons.circle,
          color: Colors.blue,
          size: 10,
        ),
        const Spacer(),
        const Text(
          "12 Trades | 5410 KLV",
          style: TextStyle(fontSize: 12, color: mainGolden),
        ),
        const SizedBox(
          width: 0,
        ),
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
}
