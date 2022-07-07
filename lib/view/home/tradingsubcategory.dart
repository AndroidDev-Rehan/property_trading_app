import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

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
        padding: const EdgeInsets.only(left: 15.0,right: 15,top: 15),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 20.0, mainAxisSpacing: 15.0),
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: darkMain.withOpacity(0.3)),
                  child: Center(
                      child: Text(
                    '${index} Marla',
                    style: const TextStyle(
                        color: white, fontWeight: FontWeight.bold,fontSize: 20),
                  )));
            }),
      ),
    );
  }
}
