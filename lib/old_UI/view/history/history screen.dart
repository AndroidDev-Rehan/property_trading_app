import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:property_trading_app/old_UI/view/home/tradingsubcategory.dart';
import '../../../utils/app-color.dart';

import '../../../utils/text_style.dart';

import '../../utils/app-color.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'History',
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
                      Text(
                        'Muhammad Ali',
                        style: TextStyle(
                            fontSize: 20,
                            color: darkMain,
                            fontWeight: FontWeight.bold),
                      ),
                       Text(
                        'Price: ${index+1}0K',
                        style: TextStyle(fontSize: 18, color: darkMain),
                      ),

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
