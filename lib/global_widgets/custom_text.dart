
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:property_trading_app/old_UI/utils/app-color.dart';
import '../../../utils/app-color.dart';

import '../../../utils/text_style.dart';


class CustomText extends StatelessWidget {

  final String text;
  final double? size;
  final FontWeight? fontWeight;


  const CustomText({Key? key, required this.text, required this.size, this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        // Text(
        //   text,
        //   style: TextStyle(
        //     fontSize: this.size,
        //     foreground: Paint()
        //       ..style = PaintingStyle.stroke
        //       ..strokeWidth = 5
        //       ..color = Colors.black,
        //   ),
        // ),
        // Solid text as fill.
        Text(
          text,
          style: TextStyle(
            fontSize: this.size,
            color: Colors.white,
            fontWeight: fontWeight
          ),
        ),
      ],
    );
  }
}
