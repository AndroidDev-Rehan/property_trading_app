import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:property_trading_app/utils/text_style.dart';
import 'package:property_trading_app/view/history/history%20screen.dart';
import 'package:property_trading_app/view/home/tradingsubcategory.dart';

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
          floatingActionButton: FloatingActionButton(backgroundColor: darkMain,onPressed: (){Get.to(()=>History());},child: Icon(Icons.history,color: white,size: 30,)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height * 0.25,
              decoration: BoxDecoration(
                  color: darkMain,
                 ),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'English',
                      style: goldenHeadingStyle,
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
                    return InkWell(
                      onTap: (){
                        Get.to(TradingSubCategoryPage());
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: darkMain,
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Unit 1',
                              style: goldenSimpleText,
                            ),
                            Text(
                              'INTRODUCTION',
                              style: whitesimpleText,
                            )

                          ],
                        ),
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
