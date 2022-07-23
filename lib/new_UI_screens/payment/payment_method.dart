import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:property_trading_app/global_widgets/custom_app_bar.dart';
import 'package:property_trading_app/new_UI_screens/payment/credit_card_details.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../utils/app-color.dart';

import '../../utils/app-color.dart';

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print(Get.height);
    final Size buttonSize = Size(Get.width*0.86682242,55);
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          appBar: buildCustomAppBar(),
          backgroundColor: darkMain,
          body: ListView(
            children: [
              SizedBox(height: 40,),
              _buildTopPortion(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // SizedBox(height: Get.height/4,),
                  CustomElevatedButton(
                    roundness: 25,
                    text: "Cash in Office",
                    onPressed: (){}, color: Colors.white,
                    fixedSize: buttonSize,
                    textColor: darkMain,
                    prefixIcon: Container(
                      color: darkMain,
                      child: Icon(Icons.check_box_outline_blank, color: darkMain,),
                    ),
                    leftAlign: true,
                    horizontalPadding: 20,
                    iconSpacing: 30,
                  ),
                  const SizedBox(height: 20,),

                  CustomElevatedButton(
                    roundness: 25,
                    text: "Online Payment",
                    onPressed: (){}, color: Colors.white,
                    fixedSize: buttonSize,
                    textColor: darkMain,
                    prefixIcon: Container(
                      color: darkMain,
                      child: Icon(Icons.check_box_outline_blank, color: darkMain,),
                    ),
                    leftAlign: true,
                    horizontalPadding: 20,
                    iconSpacing: 30,
                  ),
                  const SizedBox(height: 20,),

                  CustomElevatedButton(
                    roundness: 25,
                    text: "Debit/Credit Card",
                    onPressed: (){
                      Get.to(CreditCardDetailsScreen());
                    }, color: Colors.white,
                    fixedSize: buttonSize,
                    textColor: darkMain,
                    prefixIcon: Container(
                      color: darkMain,
                      child: Icon(Icons.check_box_outline_blank, color: darkMain,),
                    ),
                    leftAlign: true,
                    horizontalPadding: 20,
                    iconSpacing: 30,
                  ),
                  const SizedBox(height: 20,),

                  CustomElevatedButton(
                    roundness: 25,
                    text: "Cryptocurrency",
                    onPressed: (){}, color: Colors.white,
                    fixedSize: buttonSize,
                    textColor: darkMain,
                    prefixIcon: Container(
                      color: darkMain,
                      child: Icon(Icons.check_box_outline_blank, color: darkMain,),
                    ),
                    leftAlign: true,
                    horizontalPadding: 20,
                    iconSpacing: 30,
                  ),
                  const SizedBox(height: 40,),

                  CustomElevatedButton(
                    roundness: 25,
                    text: "Continue",
                    onPressed: (){
                      pushNewScreen(
                        context,
                        screen: CreditCardDetailsScreen(),
                        withNavBar: true, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );

                    }, color: Colors.white,
                    fixedSize: Size(Get.width*0.65,40),
                    textColor: darkMain,
                    horizontalPadding: 20,
                    iconSpacing: 30,
                    textStyle: const TextStyle(fontWeight: FontWeight.normal, color: darkMain, fontSize: 18),

                  ),



                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

    Widget _buildTopPortion(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Icon(Icons.arrow_back_ios, color: mainGolden,),
            ),
          ],
        ),
        const SizedBox(height: 30,),
        _buildYellowContainer(),
        const SizedBox(height: 40,),
         SizedBox(
           width: Get.width*0.86682242,
           child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Select Payment Method", style: TextStyle(color: mainGolden, fontSize: Get.width*0.0798*0.75, fontWeight: FontWeight.bold),)),
         ),
        const SizedBox(height: 40,),

      ],
    );
  }

    Widget _buildYellowContainer(){
    return Container(
      decoration: BoxDecoration(
        color: mainGolden,
        borderRadius: BorderRadius.circular(20)
      ),
      padding: EdgeInsets.symmetric(horizontal: Get.width*0.066),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 5,),
          const Text("Payment Details", style: TextStyle(color: darkMain),),
          const SizedBox(height: 10,),
          SizedBox(
            width: Get.width*0.75111,

            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.circle, size: 7.5,color: Colors.white),
                    Icon(Icons.circle, size: 7.5,color: Colors.white),
                    Icon(Icons.circle, size: 15,color: Colors.white),
                    Icon(Icons.circle, size: 7.5,color: Colors.white),

                  ],
                ),
                const Divider(color: Colors.white, height: 15,)
              ],
            ),
          ),
          const SizedBox(height: 30,)
        ],
      ),
    );
  }
}
