import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:property_trading_app/view/home/graphscreen.dart';

import '../../utils/app-color.dart';

class TradingSubCategoryPage extends StatefulWidget {
  const TradingSubCategoryPage({Key? key}) : super(key: key);

  @override
  State<TradingSubCategoryPage> createState() => _TradingSubCategoryPageState();
}

class _TradingSubCategoryPageState extends State<TradingSubCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sub Category',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: white),
        ),
        backgroundColor: darkMain,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0,right: 30,top: 15),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 50.0, mainAxisSpacing: 40.0),
            itemCount: 20,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Get.to(DetailsPage());
                },
                child: Material(
                  elevation: 10,


                        borderRadius: BorderRadius.circular(10),
                        color: darkMain,
                    child: Center(
                        child: Text(
                      '${index} Marla',
                      style: const TextStyle(
                          color: white, fontWeight: FontWeight.bold,fontSize: 20),
                    ))),
              );
            }),
      ),
    );
  }
}
