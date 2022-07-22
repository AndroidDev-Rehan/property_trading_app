// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
// import 'package:property_trading_app/old_UI/utils/app-color.dart';
// import 'package:property_trading_app/old_UI/view/global_widgets/custom_button.dart';
// import 'package:property_trading_app/old_UI/view/home/tradinghome.dart';
// import 'package:property_trading_app/old_UI/view/p2p/p2ptrade.dart';
// import '../../../global_widgets/custom_button.dart';
// import '../../../utils/app-color.dart';
//
// import '../../../utils/text_style.dart';
//
// import '../../utils/text_style.dart';
//
// class NewHomeScreen extends StatelessWidget {
//   const NewHomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     List<String> images = [
//       "assets/images/h1.jpg",
//       "assets/images/h2.jpg",
//       "assets/images/h3.jpg"
//     ];
//
//     return SafeArea(
//       child: Scaffold(
//
//         appBar: AppBar(
//           backgroundColor: darkMain,
//           leading: Icon(Icons.person),
//           title:           Padding(
//             padding: const EdgeInsets.only(top: 12.0, bottom: 12,right: 16,),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 // label: Text(label),
//                   border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white)
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white)
//                   ),
//                   disabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white)
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white)
//                   ),
//                   prefixIcon: Icon(Icons.search, color: Colors.white,),
//                   isDense: true,
//                   contentPadding: EdgeInsets.symmetric(vertical: 7)
//               ),
//               style: TextStyle(
//                 color: Colors.white,
//
//               ),
//               cursorColor: Colors.white,
//             ),
//           ),
//           actions: [
//             Icon(Icons.notifications_active),
//             SizedBox(width: 10,),
//
//             Icon(Icons.location_on_sharp),
//             // Icon(Icons.qr_code_scanner),
//             SizedBox(width: 20,),
//           ],
//         ),
//
//         // appBar: AppBar(
//         //   title: Text("GMARKETING"),
//         //   backgroundColor: darkMain,
//         //   centerTitle: true,
//         // ),
//         body: Container(
//           height: Get.height,
//           child: SingleChildScrollView(
//             child: Column(
//               // crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Align(
//                     alignment: Alignment.center,
//                     child: Image.asset(
//                       "assets/images/logo.png",
//                       height: 200,
//                     )),
//                 const SizedBox(
//                   height: 0,
//                 ),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: const Padding(
//                     padding: EdgeInsets.only(left: 16.0),
//                     child: Text(
//                       "Trending",
//                       style: bluekHeadingStyle,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 CarouselSlider(
//                   options: CarouselOptions(
//                     autoPlay: true,
//                     autoPlayInterval: Duration(seconds: 6),
//                     autoPlayAnimationDuration: Duration(seconds: 1),
//                     autoPlayCurve: Curves.fastOutSlowIn,
//                     // height: 300.0,
//                     enlargeCenterPage: true,
//                     // enlargeStrategy: CenterPageEnlargeStrategy.height,
//                     viewportFraction: 0.7,
//                     // aspectRatio: 2,
//                     initialPage: 0,
//                     clipBehavior: Clip.hardEdge,
//                   ),
//                   items: images.map((String i) {
//                     return Builder(
//                       builder: (BuildContext context) {
//                         return ClipRRect(
//                           borderRadius: BorderRadius.circular(20),
//                           child: Card(
//                             borderOnForeground: false,
//                             elevation: 10,
//                             child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(5),
//                                 child: Image.asset(
//                                   i,
//                                   height: 300,
//                                   width: 300,
//                                   fit: BoxFit.cover,
//                                 )),
//                           ),
//                         );
//                       },
//                     );
//                   }).toList(),
//                 ),
//                 const SizedBox(
//                   height: 100,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                           child: CustomElevatedButton(
//                         text: "TRADING",
//                         onPressed: () {
//
//                           pushNewScreen(
//                             context,
//                             screen: TradingHome(),
//                             withNavBar: true, // OPTIONAL VALUE. True by default.
//                             pageTransitionAnimation: PageTransitionAnimation.cupertino,
//                           );
//
//                         },
//                         roundness: 10,
//                         verticalPadding: 16,
//                       )),
//                       SizedBox(
//                         width: 20,
//                       ),
//                       Expanded(
//                           child: CustomElevatedButton(
//                         text: "P2P TRADING",
//                         onPressed: () {
//                           pushNewScreen(
//                             context,
//                             screen: P2pTrade(),
//                             withNavBar: true, // OPTIONAL VALUE. True by default.
//                             pageTransitionAnimation: PageTransitionAnimation.cupertino,
//                           );
//                         },
//                         roundness: 10,
//                         verticalPadding: 16,
//                       )),
//                     ],
//                   ),
//                 ),
//
//                 // Padding(
//                 //   padding: EdgeInsets.only(left: 16.0),
//                 //   child: Row(
//                 //
//                 //     children: [
//                 //       Text("Projects", style: goldenHeadingStyle,),
//                 //       Text("   (Swipe to see more)", style: subtitleText,),
//                 //
//                 //     ],
//                 //   ),
//                 // ),
//                 // const SizedBox(height: 10,),
//                 // CarouselSlider(
//                 //   options: CarouselOptions(
//                 //     autoPlay: false,
//                 //     enlargeCenterPage: false,
//                 //     // enlargeStrategy: CenterPageEnlargeStrategy.height,
//                 //     viewportFraction: 1,
//                 //     // aspectRatio: 2,
//                 //     initialPage: 0,
//                 //     clipBehavior: Clip.hardEdge,
//                 //   ),
//                 //   items: images.map((String i) {
//                 //     return Builder(
//                 //       builder: (BuildContext context) {
//                 //         return ClipRRect(
//                 //           borderRadius: BorderRadius.circular(20),
//                 //           child: Card(
//                 //             borderOnForeground: false,
//                 //             elevation: 10,
//                 //             child: ClipRRect(
//                 //                 borderRadius: BorderRadius.circular(5),
//                 //                 child: Image.asset(i,height: 300, width: Get.width,fit: BoxFit.cover,)),
//                 //           ),
//                 //         );
//                 //       },
//                 //     );
//                 //   }).toList(),
//                 // ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
