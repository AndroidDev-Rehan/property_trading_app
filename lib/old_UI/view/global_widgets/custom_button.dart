// import 'package:flutter/material.dart';
// import 'package:property_trading_app/old_UI/utils/app-color.dart';
//
// class CustomElevatedButton extends StatelessWidget {
//
//   final String text;
//   final Function onPressed;
//   final Color? color;
//   final double? roundness;
//   final double? horizontalPadding;
//   final double? verticalPadding;
//   final Color? textColor;
//   final bool border;
//   final Size? fixedSize;
//   final Image? imageIcon;
//   final IconData? iconData;
//
//
//   const CustomElevatedButton({Key? key, required this.text, required this.onPressed, this.color, this.roundness, this.horizontalPadding, this.verticalPadding, this.border = false, this.textColor, this.fixedSize, this.imageIcon, this.iconData}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(10),
//       child: ElevatedButton(
//           onPressed: (){
//             onPressed();
//           },
//           child: Padding(
//             padding:  EdgeInsets.symmetric(horizontal: horizontalPadding ?? 0, vertical: verticalPadding ?? 0),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 (imageIcon != null) ? imageIcon! : SizedBox(),
//                 (iconData != null) ? Icon(iconData) : SizedBox(),
//                 ((imageIcon != null) || (iconData!=null) )  ? SizedBox(width: 10,) : SizedBox(width: 0,),
//                 Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: textColor),),
//               ],
//             ),
//           ),
//           style: ElevatedButton.styleFrom(
//               primary: color ?? darkMain,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(roundness ?? 20), ),
//             side: border ? BorderSide(color: Theme.of(context).primaryColor) : null,
//             fixedSize: fixedSize
//             // fixedSize: const Size(double.infinity, 50),
//           )
//       ),
//     );
//   }
// }
