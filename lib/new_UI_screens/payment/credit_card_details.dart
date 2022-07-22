import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/global_widgets/custom_app_bar.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../utils/app-color.dart';

import '../../utils/app-color.dart';



class CreditCardDetailsScreen extends StatelessWidget {
  const CreditCardDetailsScreen({Key? key}) : super(key: key);

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
              const SizedBox(height: 30,),
              _buildTopPortion(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // SizedBox(height: Get.height/4,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SizedBox(
                        width: Get.width*0.77102,
                        child: _buildCustomTextField("Card Number")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SizedBox(
                        width: Get.width*0.77102,
                        child: _buildCustomTextField("Name on Card")),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: Get.height*0.07235),
                    child: SizedBox(
                      width: Get.width*0.77102 ,
                      child: Row(
                        children: [
                          Expanded(
                              flex : 2,
                              child: _buildCustomTextField("MM/YYYY")),
                          SizedBox(width: 20,),
                          Expanded(
                              flex : 1,
                              child: _buildCustomTextField("CVV")),


                        ],
                      ),

                    ),
                  ),




                  CustomElevatedButton(
                    roundness: 15,
                    text: "Checkout",
                    onPressed: (){}, color: Colors.white,
                    fixedSize: Size(Get.width*0.77102,Get.height*0.06263),
                    textColor: darkMain,
                    horizontalPadding: 20,

                    prefixIcon: const Icon(Icons.lock,color: Colors.black,),
                    iconSpacing: 10,
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
          width: Get.width*0.77102,
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Enter Card Details", style: TextStyle(color: mainGolden, fontSize: Get.width*0.0798*1.1),)),
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

  Widget _buildCustomTextField(String hintText){
    return TextFormField(
      decoration:  InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            // borderSide: const BorderSide(color: darkMain, ),
            // borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            // borderSide: const BorderSide(color: darkMain, ),
            // borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            // borderSide: const BorderSide(color: darkMain, ),
            // borderRadius: BorderRadius.circular(30),
          ),
          disabledBorder: OutlineInputBorder(
            // borderSide: const BorderSide(color: darkMain, ),
            // borderRadius: BorderRadius.circular(30),
          ),

          // isDense: true,
          filled: true,
          contentPadding: EdgeInsets.only(top: 5, left: 20),
          fillColor: Colors.white
      ),
      style: const TextStyle(
        color: Colors.black,

      ),
      cursorColor: Colors.white,
    );
  }

}
