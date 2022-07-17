import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/utils/constants.dart';
import 'package:property_trading_app/utils/text_style.dart';

import '../../utils/app-color.dart';
import '../root/root_screen.dart';

class DocVer extends StatefulWidget {
  const DocVer({Key? key}) : super(key: key);

  @override
  State<DocVer> createState() => _DocVerState();
}

class _DocVerState extends State<DocVer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              submitDoc,
              style: headingStyle,
            ),
            spacing,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                verifyinfo,
                style: subtitleText,
                textAlign: TextAlign.start,
              ),
            ),
            // Text(
            //   pleasesubmit,
            //   style: subtitleText,textAlign: TextAlign.center,
            // ),
            spacing,
            spacing,
            SizedBox(
              height: 100,
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.all(Radius.circular(10)),

                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/photoid.png',
                        height: 80,
                        width: 80,
                        fit: BoxFit.fill,
                      ),
                      horizontalspacing,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Step 1',
                            style: typeText,
                          ),
                          Text(
                            'Photo Id',
                            style: simpleText,
                          )
                        ],
                      ),
                      Spacer(),
                      Image.asset('assets/images/ticksign.png',width: 40,height: 40,fit: BoxFit.fill,)
                    ],
                  ),
                ),
              ),
            ),
            spacing,
            SizedBox(
              height: 100,
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.all(Radius.circular(10)),

                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/faceid.png',
                        height: 60,
                        width: 60,
                        fit: BoxFit.fill,
                      ),
                      horizontalspacing,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Step 2',
                            style: typeText,
                          ),
                          Text(
                            'Take a Selfie',
                            style: simpleText,
                          )
                        ],
                      ),
                      Spacer(),
                      Image.asset('assets/images/ticksign.png',width: 40,height: 40,fit: BoxFit.fill,)
                    ],
                  ),
                ),
              ),
            ),
            spacing,
            spacing,
            spacing,

            InkWell(
                onTap: (){
                  Get.to(RootScreen());
                },
                child: Container(decoration: BoxDecoration(color: darkMain,borderRadius: BorderRadius.all(Radius.circular(30))),height: 70,width: Get.width*0.75,child: Center(child: Text('Next Step',style: ButtonLabel,),),))
          ],
        ),
      ),
    );
  }
}
