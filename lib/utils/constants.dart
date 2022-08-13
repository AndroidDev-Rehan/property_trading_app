import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showAlert( String content) async{
  Widget okButton = FlatButton(
    child: const Text("OK"),
    onPressed: () {
      Get.back();
    },
  );
  AlertDialog dialog = AlertDialog(
      title: const Text('Alert Dialog'),
      actions: [ okButton,],
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Error: $content'),
          ],
        ),
      )
  );
  await Get.dialog(dialog);
}
