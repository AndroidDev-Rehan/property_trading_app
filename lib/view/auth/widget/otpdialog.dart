//
//
// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/style.dart';
//
// class OTPDialog extends StatefulWidget {
//
//
//   final String? verificationId;
//   final String? phoneNumber;
//   final bool? isCodeSent;
//
//
//   OTPDialog({this.verificationId, this.isCodeSent, this.phoneNumber});
//
//   @override
//   OTPDialogState createState() => OTPDialogState();
// }
//
// class OTPDialogState extends State<OTPDialog> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   TextEditingController numberController = TextEditingController();
//
//   String? countryCode = '';
//
//   String otpCode = '';
//
//   @override
//   void initState() {
//     super.initState();
//
//   }
//
//
//   @override
//   void setState(fn) {
//     if (mounted) super.setState(fn);
//   }
//
//   // //region Methods
//   // Future<void> otpLogin() async {
//   //   var request = {
//   //     UserKeys.userName: widget.phoneNumber!.replaceAll('+', ''),
//   //     UserKeys.password: widget.phoneNumber!.replaceAll('+', ''),
//   //     UserKeys.playerId: getStringAsync(PLAYERID),
//   //     UserKeys.loginType: 'mobile',
//   //   };
//   //
//   //   appStore.setLoading(true);
//   //   await loginUser(request, isSocialLogin: true).then((res) async {
//   //     res.data!.password = widget.phoneNumber.validate();
//   //     // log("token ${res}");
//   //
//   //     // return;
//   //     await userService.getUser(email: res.data!.email).then((value) {
//   //       if (res.data!.user_type == LoginTypeUser) {
//   //         if (res.data != null) saveUserData(res.data!);
//   //         toast(language!.loginSuccessfully);
//   //         HomeScreen().launch(context, isNewTask: true, pageRouteAnimation: PageRouteAnimation.Slide);
//   //       }
//   //     });
//   //   }).catchError((e) {
//   //     log(e.toString());
//   //   });
//   // }
//   //
//   // Future<void> submit() async {
//   //   appStore.setLoading(true);
//   //
//   //   AuthCredential credential = PhoneAuthProvider.credential(
//   //     verificationId: widget.verificationId!,
//   //     smsCode: otpCode.validate(),
//   //   );
//   //
//   //   Map req = {
//   //     "email": "",
//   //     "username": widget.phoneNumber!.replaceAll('+', ''),
//   //     "first_name": '',
//   //     "last_name": '',
//   //     "login_type": LoginTypeOTP,
//   //     "user_type": "user",
//   //     "accessToken": widget.phoneNumber!.replaceAll('+', ''),
//   //   };
//   //
//   //   await loginUser(req, isSocialLogin: true).then((value) async {
//   //     appStore.setLoginType(LoginTypeOTP);
//   //
//   //     if (value.isUserExist == null) {
//   //       /// Register
//   //       otpLogin();
//   //     } else {
//   //       /// not Register
//   //       appStore.setLoading(false);
//   //       finish(context);
//   //       SignUpScreen(
//   //         phoneNumber: widget.phoneNumber!.replaceAll('+', ''),
//   //         otpCode: otpCode.validate(),
//   //         verificationId: widget.verificationId!,
//   //         isOTPLogin: true,
//   //       ).launch(context);
//   //     }
//   //   }).catchError((e) {
//   //     appStore.setLoading(false);
//   //
//   //     if (e.toString().contains('invalid_username')) {
//   //       finish(context);
//   //       SignUpScreen(
//   //         phoneNumber: widget.phoneNumber!.replaceAll('+', ''),
//   //         otpCode: otpCode.validate(),
//   //         verificationId: widget.verificationId!,
//   //         isOTPLogin: true,
//   //       ).launch(context);
//   //     } else {
//   //       toast(e.toString(), print: true);
//   //     }
//   //   });
//   // }
//   //
//   // Future<void> sendOTP() async {
//   //   if (formKey.currentState!.validate()) {
//   //     formKey.currentState!.save();
//   //
//   //     hideKeyboard(context);
//   //
//   //     String number = '+$countryCode${numberController.text.trim()}';
//   //
//   //     if (!number.startsWith('+')) {
//   //       number = '+$countryCode${numberController.text.trim()}';
//   //     }
//   //     appStore.setLoading(true);
//   //     await authService.loginWithOTP(context, number).then((value) {
//   //       //
//   //     }).catchError((e) {
//   //       toast(e.toString(), print: true);
//   //     });
//   //   }
//   // }
//
//   //endregion
//
//   @override
//   Widget build(BuildContext context) {
//     Widget _buildMainWidget({required bool isOtpSent}) {
//       if (isOtpSent) {
//         return Stack(
//           children: [
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Enter Phone No', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
//                 SizedBox(height: 16,),
//                 // Container(
//                 //   child: Row(
//                 //     children: [
//                 //       CountryCodePicker(
//                 //         initialSelection: '+92',
//                 //         showCountryOnly: false,
//                 //         showFlag: true,
//                 //         showFlagDialog: true,
//                 //         showOnlyCountryWhenClosed: false,
//                 //         alignLeft: false,
//                 //
//                 //         onInit: (c) {
//                 //           countryCode = c!.dialCode;
//                 //         },
//                 //         onChanged: (c) {
//                 //           countryCode = c.dialCode;
//                 //         },
//                 //       ),
//                 //       SizedBox(width: 2,),
//                 //
//                 //       Form(
//                 //         key: formKey,
//                 //         child: AppTextField(
//                 //           controller: numberController,
//                 //           textFieldType: TextFieldType.PHONE,
//                 //
//                 //           autoFocus: true,
//                 //           onFieldSubmitted: (s) {
//                 //             // sendOTP();
//                 //           },
//                 //         ).expand(),
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 // SizedBox(height: 30,),
//                 // AppButton(
//                 //   onTap: () {
//                 //     // sendOTP();
//                 //   },
//                 //   text: 'Send Otp',
//                 //
//                 //   width: Get.width,
//                 // )
//               ],
//             ),
//
//           ],
//         );
//       } else {
//         return Stack(
//           children: [
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text('Enter Otp', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
//                SizedBox(height: 30,),
//                 OTPTextField(
//                   length: 6,
//                   width: MediaQuery.of(context).size.width,
//                   fieldWidth: 35,
//                   style: primaryTextStyle(),
//                   textFieldAlignment: MainAxisAlignment.spaceAround,
//                   fieldStyle: FieldStyle.box,
//                   onChanged: (s) {
//                     otpCode = s;
//                   },
//                   onCompleted: (pin) {
//                     otpCode = pin;
//                     // submit();
//                   },
//                 ).fit(),
//                 SizedBox(height: 30,),
//                 // AppButton(
//                 //   onTap: () {
//                 //     // submit();
//                 //   },
//                 //   text: 'Confirm',
//                 //
//                 //   textStyle: boldTextStyle(color: white),
//                 //   width: Get.width,
//                 // ),
//
//               ],
//             ),
//           ],
//         );
//       }
//     }
//
//     return Container(
//       width: Get.width,
//       padding: EdgeInsets.all(16),
//       child: _buildMainWidget(isOtpSent: !widget.isCodeSent.validate()),
//     );
//   }
// }
// class AppCommonDialog extends StatelessWidget {
//   final String title;
//   final Widget child;
//
//   AppCommonDialog({required this.title, required this.child});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             padding: EdgeInsets.fromLTRB(16, 4, 4, 8),
//             width: Get.width,
//             decoration: boxDecorationDefault(
//               color: context.primaryColor,
//               borderRadius: radiusOnly(topRight: defaultRadius, topLeft: defaultRadius),
//             ),
//             child: Row(
//               children: [
//                 Text(title, style: boldTextStyle(color: Colors.white)).expand(),
//                 CloseButton(color: Colors.white),
//               ],
//             ),
//           ),
//           16.height,
//           child,
//         ],
//       ),
//     );
//   }
// }