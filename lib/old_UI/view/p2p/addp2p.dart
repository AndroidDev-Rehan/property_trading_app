// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../utils/app-color.dart';
// import '../../../utils/app-color.dart';
//
// class AddP2p extends StatefulWidget {
//   const AddP2p({Key? key}) : super(key: key);
//
//   @override
//   State<AddP2p> createState() => _AddP2pState();
// }
//
// class _AddP2pState extends State<AddP2p> {
//   List<String> projectlist = ['Select', 'DHA', 'GULBERG', 'MainMarket'];
//   String selectedproject = 'Select';
//   List<String> subprojectlist = ['Select', '1 Marla', '2 Marla', '5 Marla'];
//   String selectedsubproject = 'Select';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(backgroundColor: darkMain,onPressed: (){Get.back();},child: Icon(Icons.save,color: Colors.white,size: 30,)),
//       appBar: AppBar(
//         centerTitle: true,
//         leading: IconButton(onPressed: (){Get.back();},icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,),),
//         title: const Text(
//           'Add P2P Trade',
//           style: TextStyle(
//               fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         backgroundColor: darkMain,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 10,
//             ),
//             textFieldWithLabel('Price', context),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               'Property File',
//               style: TextStyle(
//                   fontSize: 25, fontWeight: FontWeight.bold, color: darkMain),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 10),
//               padding: EdgeInsets.only(left: 10, right: 10),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(5.0),
//               ),
//               width: Get.width,
//               child: DropdownButtonHideUnderline(
//                 child: DropdownButton(
//                   items: projectlist
//                       .map((value) => DropdownMenuItem(
//                             child: Text(
//                               value,
//                               style: TextStyle(
//                                   color: Colors.black54,
//                                   fontSize: 12,
//                                   fontFamily: "Regular"),
//                             ),
//                             value: value,
//                           ))
//                       .toList(),
//                   onChanged: (String? vlaue) {
//                     selectedproject = vlaue!;
//                     setState(() {});
//                   },
//                   isExpanded: false,
//                   value: selectedproject,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               'Sub Type',
//               style: TextStyle(
//                   fontSize: 25, fontWeight: FontWeight.bold, color: darkMain),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 10, bottom: 30),
//               padding: EdgeInsets.only(left: 10, right: 10),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(5.0),
//               ),
//               width: Get.width,
//               child: DropdownButtonHideUnderline(
//                 child: DropdownButton(
//                   items: subprojectlist
//                       .map((value) => DropdownMenuItem(
//                             child: Text(
//                               value,
//                               style: TextStyle(
//                                   color: Colors.black54,
//                                   fontSize: 12,
//                                   fontFamily: "Regular"),
//                             ),
//                             value: value,
//                           ))
//                       .toList(),
//                   onChanged: (String? vlaue) {
//                     selectedsubproject = vlaue!;
//                     setState(() {});
//                   },
//                   isExpanded: false,
//                   value: selectedsubproject,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget textFieldWithLabel(String label, BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//               fontSize: 25, fontWeight: FontWeight.bold, color: darkMain),
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         TextFormField(
//           decoration: const InputDecoration(
//               // label: Text(label),
//               border: OutlineInputBorder(),
//               isDense: true,
//               contentPadding:
//                   EdgeInsets.symmetric(vertical: 10, horizontal: 15)),
//         ),
//       ],
//     );
//   }
// }
