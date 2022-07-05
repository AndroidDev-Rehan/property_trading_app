import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.label, this.labelStyle}) : super(key: key);

  final String label;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, right: 40, left: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: labelStyle ?? TextStyle(color: Theme.of(context).primaryColor),),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            decoration: InputDecoration(
              // label: Text(label),
                border: OutlineInputBorder(),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 7)
            ),
          ),
        ],
      ),
    );
  }
}
