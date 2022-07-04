import 'package:flutter/material.dart';
import 'package:property_trading_app/utils/app-color.dart';
import 'package:property_trading_app/view/global_widgets/custom_button.dart';

class SignInOptionsScreen extends StatelessWidget {
  const SignInOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomElevatedButton(text: "Sign In With Google", onPressed: (){}, color: darkMain, fixedSize: Size(230,55),),
            const SizedBox(height: 20,),
            CustomElevatedButton(text: "Sign In With Apple ", onPressed: (){}, color: darkMain, fixedSize: Size(230,55),),
            const SizedBox(height: 20,),
            CustomElevatedButton(text: "Sign In With Phone No", onPressed: (){}, color: darkMain, fixedSize: Size(230,55)),
            const SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}
