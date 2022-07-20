import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:property_trading_app/old_UI/utils/text_style.dart';
import 'package:property_trading_app/old_UI/view/history/history%20screen.dart';
import 'package:property_trading_app/old_UI/view/home/tradingsubcategory.dart';

import '../../utils/app-color.dart';
import '../global_widgets/custom_button.dart';

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
          // floatingActionButton: FloatingActionButton(backgroundColor: darkMain,onPressed: (){Get.to(()=>History());},child: Icon(Icons.history,color: white,size: 30,)),
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CustomElevatedButton(text: "History", onPressed: (){
                pushNewScreen(
                  context,
                  screen: History(),
                  withNavBar: true, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              roundness: 5,
              verticalPadding: 10,
                iconData: Icons.history,
                color: mainGolden,
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15, right: 15),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        pushNewScreen(
                          context,
                          screen: TradingSubCategoryPage(),
                          withNavBar: true, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation: PageTransitionAnimation.cupertino,
                        );
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
