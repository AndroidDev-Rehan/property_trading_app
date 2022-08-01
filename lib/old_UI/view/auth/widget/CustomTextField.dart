import 'package:flutter/material.dart';
import 'package:property_trading_app/utils/app-color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.label, this.labelStyle, this.controller, this.password = false}) : super(key: key);

  final String label;
  final TextStyle? labelStyle;
  final TextEditingController? controller;
  final bool password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, right: 40, left: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: labelStyle ?? TextStyle(color: Theme.of(context).primaryColor),),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            obscureText: password,
            controller: controller,
            decoration: InputDecoration(
              // label: Text(label),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(30)

                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: mainGolden),
                    borderRadius: BorderRadius.circular(30)

                ),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                filled:  true,
                fillColor: Colors.white
            ),
            cursorColor: Colors.black,

          ),
        ],
      ),
    );
  }
}
