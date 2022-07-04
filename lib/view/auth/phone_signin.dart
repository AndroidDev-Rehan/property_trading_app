import 'package:flutter/material.dart';
import 'package:property_trading_app/view/auth/widget/CustomTextField.dart';
import 'package:property_trading_app/view/global_widgets/custom_button.dart';

class PhoneSignInScreen extends StatelessWidget {
  const PhoneSignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16),
        child: Column(
          children: [
            CustomTextField(),
            SizedBox(height: 20,),
            CustomTextField(),
            CustomElevatedButton(text: "Sign In", onPressed: (){})
          ],
        ),
      ),
    );
  }
}
