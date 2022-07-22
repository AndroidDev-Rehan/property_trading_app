
import 'package:flutter/material.dart';
import 'package:property_trading_app/old_UI/utils/app-color.dart';
import '../../../utils/app-color.dart';

import '../../../utils/text_style.dart';


class CustomElevatedButton extends StatelessWidget {

  final String text;
  final Function onPressed;
  final Color? color;
  final double? roundness;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? textColor;
  final bool border;
  final Size? fixedSize;
  final Image? imageIcon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final bool leftAlign;
  final double? iconSpacing;
  final TextStyle? textStyle;
  // final IconData? iconData;
  // final Color? iconColor;


  const CustomElevatedButton({Key? key, required this.text, required this.onPressed, this.color, this.roundness, this.horizontalPadding, this.verticalPadding, this.border = false, this.textColor, this.fixedSize, this.imageIcon, this.prefixIcon, this.leftAlign= false, this.iconSpacing, this.textStyle, this.suffixIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ElevatedButton(
          onPressed: (){
            onPressed();
          },
          style: ElevatedButton.styleFrom(
              primary: color ?? darkMain,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(roundness ?? 20), ),
              side: border ? BorderSide(color: Theme.of(context).primaryColor) : null,
              fixedSize: fixedSize
            // fixedSize: const Size(double.infinity, 50),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: horizontalPadding ?? 0, vertical: verticalPadding ?? 0),
            child: Align(
              alignment: leftAlign ? Alignment.centerLeft : Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  (imageIcon != null) ? imageIcon! : const SizedBox(),
                  (prefixIcon != null) ? prefixIcon! : SizedBox(),
                  ((imageIcon != null) || (prefixIcon!=null) )  ? SizedBox(width: iconSpacing ?? 10,) : SizedBox(width: 0,),
                  Text(text, style: textStyle ?? TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: textColor),),
                  (suffixIcon != null) ? Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: suffixIcon!,
                  ) : SizedBox(),

                ],
              ),
            ),
          )
      ),
    );
  }
}
