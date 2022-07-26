import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:property_trading_app/global_widgets/custom_app_bar.dart';
import 'package:property_trading_app/global_widgets/custom_button.dart';
import 'package:property_trading_app/new_UI_screens/chat/chat.dart';
import 'package:property_trading_app/new_UI_screens/p2p/addP2PScreen.dart';
import 'package:property_trading_app/new_UI_screens/p2p/p2p_screen.dart';
import 'package:property_trading_app/new_UI_screens/payment/credit_card_details.dart';
import 'package:property_trading_app/new_UI_screens/payment/payment_method.dart';
import 'package:property_trading_app/new_UI_screens/referal/referalpage.dart';
import 'package:property_trading_app/new_UI_screens/subproject/subproject.dart';
import 'package:property_trading_app/utils/app-color.dart';


class AdsPage extends StatelessWidget {
  const AdsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMain,
      appBar: buildCustomAppBar(),
      body: ListView(
        children: [
          const SizedBox(height: 40,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: Text(
              'Personlized Ads',
              style: TextStyle(
                  color: textColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20,),
          CarouselSlider(
            items: [
              //1st Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/h22.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //2nd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/h22.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //3rd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/h22.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //4th Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/h22.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //5th Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/h22.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
          SizedBox(height: Get.height*0.09764,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomElevatedButton(
                      textStyle: TextStyle(color: darkMain,fontSize: Get.width*0.04074074074, fontWeight: FontWeight.bold),

                      text: "Projects   ",
                      onPressed: (){
                        pushNewScreen(context, screen: SubProjectscreen(), pageTransitionAnimation: PageTransitionAnimation.cupertino);
                      },
                      prefixIcon: Icon(Icons.home, color: darkMain,),
                      fixedSize: Size(Get.width*0.425, 40),


                    ),
                    CustomElevatedButton(
                      textStyle: TextStyle(color: darkMain,fontSize: Get.width*0.04074074074, fontWeight: FontWeight.bold),

                      text: "Referals  ",
                      onPressed: (){
                        pushNewScreen(context, screen: ReferalPage(), pageTransitionAnimation: PageTransitionAnimation.cupertino);
                      },
                      prefixIcon: const Icon(Icons.accessibility_sharp, color: darkMain,),
                      fixedSize: Size(Get.width*0.425, 40),

                    ),

                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomElevatedButton(
                      textStyle: TextStyle(color: darkMain,fontSize: Get.width*0.04074074074, fontWeight: FontWeight.bold),

                      text: "Deposit    ",
                      onPressed: (){
                        pushNewScreen(context, screen: PaymentOptions(), pageTransitionAnimation: PageTransitionAnimation.cupertino);
                      },
                      prefixIcon: Icon(Icons.monetization_on, color: darkMain,),
                      fixedSize: Size(Get.width*0.425, 40),


                    ),

                    CustomElevatedButton(
                      textStyle: TextStyle(color: darkMain,fontSize: Get.width*0.04074074074, fontWeight: FontWeight.bold),

                      text: "Withdraw",
                      onPressed: (){
                        pushNewScreen(context, screen: CreditCardDetailsScreen(), pageTransitionAnimation: PageTransitionAnimation.cupertino);
                      },
                      prefixIcon: Icon(Icons.account_balance_sharp, color: darkMain,),
                      fixedSize: Size(Get.width*0.425, 40),


                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomElevatedButton(
                      textStyle: TextStyle(color: darkMain,fontSize: Get.width*0.04074074074, fontWeight: FontWeight.bold),

                      text: "   P2P      ",
                      onPressed: (){
                        pushNewScreen(context, screen: P2PScreen(), pageTransitionAnimation: PageTransitionAnimation.cupertino);
                      },
                      prefixIcon: Icon(Icons.add_box_rounded, color: darkMain,),

                      fixedSize: Size(Get.width*0.425, 40),

                    ),
                    CustomElevatedButton(
                      text: "Contact US",
                      onPressed: (){
                        pushNewScreen(context, screen: ChatPage(), pageTransitionAnimation: PageTransitionAnimation.cupertino);
                      },
                      prefixIcon: Icon(Icons.message, color: darkMain,),
                      fixedSize: Size(Get.width*0.425, 40),
                      textStyle: TextStyle(color: darkMain,fontSize: Get.width*0.04074074074, fontWeight: FontWeight.bold),


                    ),

                  ],
                ),
                SizedBox(height: 20,),



              ],
            ),
          )
        ],
      ),

    );
  }
}
