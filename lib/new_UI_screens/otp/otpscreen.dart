import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_trading_app/utils/app-color.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: darkMain,
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.all(15),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
          
            Container(
              padding: EdgeInsets.all(10),
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 30,
                color: darkMain,
              ),
            ),
            SizedBox(height: 100,),
            Text(
              'Enter the code',
              style: TextStyle(
                  color: mainGolden, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30,),
            Text(
              'Enter the 4 digit code that we just sent to prodeveloper@gmail.com',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    style: TextStyle(color: darkMain,fontSize: 25),
                    decoration: InputDecoration(border: InputBorder.none,contentPadding: EdgeInsets.all(15)),
                    

                  ),
                ),
                SizedBox(width: 15,),
                Container(
                  width: 60,height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    style: TextStyle(color: darkMain,fontSize: 25),
                    decoration: InputDecoration(border: InputBorder.none,contentPadding: EdgeInsets.all(15)),


                  ),
                ),
                SizedBox(width: 15,),
                Container(
                  width: 60,height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child:TextField(
                    style: TextStyle(color: darkMain,fontSize: 25),
                    decoration: InputDecoration(border: InputBorder.none,contentPadding: EdgeInsets.all(15)),


                  ),
                ),
                SizedBox(width: 15,),
                Container( width: 60,height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextField(
                    style: TextStyle(color: darkMain,fontSize: 25),
                    decoration: InputDecoration(border: InputBorder.none,contentPadding: EdgeInsets.all(15)),


                  ),
                )
              ],
            ),
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: Container(
padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: Row(mainAxisSize:MainAxisSize.min,children: [Icon(Icons.timelapse,size: 35,color: darkMain,),SizedBox(width: 10,),Text('00:00',style: TextStyle(color: darkMain,fontSize: 20),)],),
              ),
            ),
            SizedBox(height: 20,),
            Align(alignment:Alignment.center,child: RichText(text: TextSpan(style: TextStyle(color: Colors.white,fontSize: 18),text: 'Didn’t receive the OTP?',children: [TextSpan(text:' Resend OTP',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: mainGolden))])))
            ,SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}
