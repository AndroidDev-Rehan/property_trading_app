import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/utils/text_style.dart';

import '../../utils/app-color.dart';

class TradingHome extends StatefulWidget {
  const TradingHome({Key? key}) : super(key: key);

  @override
  State<TradingHome> createState() => _TradingHomeState();
}

class _TradingHomeState extends State<TradingHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height * 0.25,
              decoration: BoxDecoration(
                  color: Main,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(Get.width*0.3))),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'English',
                      style: whiteheadingStyle,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15, right: 15),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Main,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Unit 1',
                            style: whitesimpleText,
                          ),
                          Text(
                            'INTRODUCTION',
                            style: whitesimpleText,
                          )

                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
