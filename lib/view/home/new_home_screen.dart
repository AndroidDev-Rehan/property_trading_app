import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:property_trading_app/utils/app-color.dart';
import 'package:property_trading_app/view/global_widgets/custom_button.dart';

import '../../utils/text_style.dart';

class NewHomeScreen extends StatelessWidget {
  const NewHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List <String> images = [
      "assets/images/h1.jpg",
      "assets/images/h2.jpg",
      "assets/images/h3.jpg"
    ];

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: Get.height,
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 0,),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset("assets/images/logo.png",height: 200,)),
                const SizedBox(height: 0,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text("Projects", style: goldenHeadingStyle,),
                  ),
                ),
                const SizedBox(height: 10,),
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 6),
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    // height: 300.0,
                    enlargeCenterPage: true,
                    // enlargeStrategy: CenterPageEnlargeStrategy.height,
                    viewportFraction: 0.7,
                    // aspectRatio: 2,
                    initialPage: 0,
                    clipBehavior: Clip.hardEdge,
                  ),
                  items: images.map((String i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Card(
                            borderOnForeground: false,
                            elevation: 10,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(i,height: 300, width: 300,fit: BoxFit.cover,)),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 100,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(child: CustomElevatedButton(text: "TRADING", onPressed: (){}, roundness: 10, verticalPadding: 16,)),
                      SizedBox(width: 20,),
                      Expanded(child: CustomElevatedButton(text: "P2P TRADING", onPressed: (){}, roundness: 10, verticalPadding: 16,)),

                    ],
                  ),
                ),


                // Padding(
                //   padding: EdgeInsets.only(left: 16.0),
                //   child: Row(
                //
                //     children: [
                //       Text("Projects", style: goldenHeadingStyle,),
                //       Text("   (Swipe to see more)", style: subtitleText,),
                //
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 10,),
                // CarouselSlider(
                //   options: CarouselOptions(
                //     autoPlay: false,
                //     enlargeCenterPage: false,
                //     // enlargeStrategy: CenterPageEnlargeStrategy.height,
                //     viewportFraction: 1,
                //     // aspectRatio: 2,
                //     initialPage: 0,
                //     clipBehavior: Clip.hardEdge,
                //   ),
                //   items: images.map((String i) {
                //     return Builder(
                //       builder: (BuildContext context) {
                //         return ClipRRect(
                //           borderRadius: BorderRadius.circular(20),
                //           child: Card(
                //             borderOnForeground: false,
                //             elevation: 10,
                //             child: ClipRRect(
                //                 borderRadius: BorderRadius.circular(5),
                //                 child: Image.asset(i,height: 300, width: Get.width,fit: BoxFit.cover,)),
                //           ),
                //         );
                //       },
                //     );
                //   }).toList(),
                // ),
                const SizedBox(height: 30,),



              ],
            ),
          ),
        ),
      ),
    );
  }

}
