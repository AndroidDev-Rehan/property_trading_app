import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:property_trading_app/utils/app-color.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: mainGolden,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width*0.04205),
        child: TextFormField(
          decoration:  InputDecoration(
              hintText: "Search",
              hintStyle: const TextStyle(color: mainGolden),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, ),
                  borderRadius: BorderRadius.circular(30)
              ),
              prefixIcon: const Icon(Icons.search, color: mainGolden,),
              isDense: true,
              filled: true,

              // contentPadding: EdgeInsets.symmetric(vertical: 0),
              fillColor: darkMain
          ),
          style: const TextStyle(
            color: Colors.white,

          ),
          cursorColor: Colors.white,
        ),
      ),
      toolbarHeight: Get.height * 0.0894117647,
    );
  }
}

PreferredSizeWidget buildCustomAppBar(){
  return AppBar(
    backgroundColor: mainGolden,
    title: Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width*0.04205),
      child: SizedBox(
        height: Get.height*0.04235294117,
        child: TextFormField(
          decoration:  InputDecoration(
              hintText: "Search",
              hintStyle: const TextStyle(color: mainGolden),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: darkMain, ),
                  borderRadius: BorderRadius.circular(30),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: darkMain, ),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: darkMain, ),
                borderRadius: BorderRadius.circular(30),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: darkMain, ),
                borderRadius: BorderRadius.circular(30),
              ),

              prefixIcon: const Icon(Icons.search, color: mainGolden,),
              isDense: true,
              filled: true,
              suffixIcon: const Icon(Icons.mic, color: mainGolden,),

              contentPadding: EdgeInsets.only(top: 5),
              fillColor: darkMain
          ),
          style: const TextStyle(
            color: Colors.white,

          ),
          cursorColor: Colors.white,
        ),
      ),
    ),
    toolbarHeight: Get.height * 0.0894117647,
  );
}
