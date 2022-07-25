import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/global_widgets/custom_app_bar.dart';
import 'package:property_trading_app/global_widgets/custom_button.dart';
import 'package:property_trading_app/utils/app-color.dart';

class ReferalPage extends StatefulWidget {
  const ReferalPage({Key? key}) : super(key: key);

  @override
  State<ReferalPage> createState() => _ReferalPageState();
}

class _ReferalPageState extends State<ReferalPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildCustomAppBar(),
        backgroundColor: darkMain,
        body: Container(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: darkMain,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Align(
                          child: Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Text(
                        'You and your colleague will get',
                        style: TextStyle(color: Colors.white70,fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '1 Referal = Rs.100/-',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                  backgroundImage: Image.asset(
                                'assets/images/usericon.png',
                                fit: BoxFit.fill,
                              ).image),
                              SizedBox(height: 10,),
                              Container(
                                width: 64,
                                child: Text(
                                  'Refer a colleague',
                                  style: TextStyle(color: Colors.white70),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Icon(
                            Icons.arrow_forward_outlined,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(height: 5,),
                          Column(
                            children: [
                              CircleAvatar(

                                  backgroundImage: Image.asset(
                                'assets/images/tickphone.png',
                                fit: BoxFit.fill,
                              ).image,
                                radius: 25,
                              ),
                              SizedBox(height: 10,),
                              Container(
                                width: 65,
                                child: Text(
                                  'Rs.50/- on joining',
                                  style: TextStyle(color: Colors.white70),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Icon(
                            Icons.arrow_forward_outlined,
                            color: Colors.white,
                            size: 25,
                          ),

                          Column(
                            children: [
                              CircleAvatar(

                                  backgroundImage: Image.asset(
                                'assets/images/phonemoney.png',

                                fit: BoxFit.fill,
                              ).image,radius: 25),
                              SizedBox(height: 10,),
                              Container(
                                width: 100,
                                child: Text(
                                  'Rs.50/- on first transaction',
                                  style: TextStyle(color: Colors.white70),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Referal Code',
                          style: TextStyle(
                              color: textColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DottedBorder(
                          color: darkMain,
                          strokeWidth: 2,
                          dashPattern: [8],
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ABCD123',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                CustomElevatedButton(
                                    text: "Tap to Copy", onPressed: (){

                                })
                                // Text(
                                //   'Tap to copy',
                                //   style: TextStyle(
                                //     fontSize: 18,
                                //     color: Colors.white,
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Redeemers',
                          style: TextStyle(
                              color: textColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: Image.asset(
                                        'assets/images/person.jpg',

                                        fit: BoxFit.fill,
                                      ).image,
                                      radius: 25,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Testing@gmail.com',
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 15,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
