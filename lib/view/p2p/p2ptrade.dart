import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:property_trading_app/view/home/tradingsubcategory.dart';

import '../../utils/app-color.dart';

class P2pTrade extends StatefulWidget {
  const P2pTrade({Key? key}) : super(key: key);

  @override
  State<P2pTrade> createState() => _P2pTradeState();
}

class _P2pTradeState extends State<P2pTrade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'P2P Trade',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: white),
        ),
        backgroundColor: darkMain,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
index==0?SizedBox(height: 20,):SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'DHA Lahore',
                            style: TextStyle(
                                fontSize: 25,
                                color: mainGolden,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '1 Marla',
                            style: TextStyle(fontSize: 20, color: mainGolden),
                          ),
                        ],
                      ),
                      const Text(
                        'Price: 100K',
                        style: TextStyle(fontSize: 18, color: mainGolden),
                      ),
                      InkWell(
                        onTap: (){
                          Get.to(TradingSubCategoryPage());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                          decoration: const BoxDecoration(
                              color: darkMain,
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: const Text('BUY',style: TextStyle(color: white,fontSize: 18,fontWeight: FontWeight.bold),),
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    height: 40,
                    color: grey,
                  )
                ],
              ),
            );
          }),
    );
  }
}
