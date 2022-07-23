import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:property_trading_app/global_widgets/custom_app_bar.dart';
import 'package:property_trading_app/new_UI_screens/detailscreen/detailscreen.dart';
import 'package:property_trading_app/utils/app-color.dart';

class SubProjectscreen extends StatefulWidget {
  const SubProjectscreen({Key? key}) : super(key: key);

  @override
  State<SubProjectscreen> createState() => _SubProjectscreenState();
}

class _SubProjectscreenState extends State<SubProjectscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(),
      body: Container(
        height: Get.height,
        width: Get.width,
        color: darkMain,
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    size: 30,
                    color: mainGolden,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                          color: darkMain, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Find perfect choice for your future house ',
                style: TextStyle(
                    color: mainGolden,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed. ',
                style: TextStyle(
                    color: mainGolden,
                    fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),              SizedBox(
                height: Get.height*0.55,
                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return _buildrunningproject();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildrunningproject() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),

      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          image: DecorationImage(
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.darken),
              image: Image.asset(
                'assets/images/h1.jpg',



              ).image)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                   shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.arrow_forward_outlined,
                    color: mainGolden,
                    size: 25,
                  ),
                ),
              ),
              SizedBox(width: 20,),
              InkWell(
                onTap: (){
                  pushNewScreen(
                    context,
                    screen: DetailsPage(),
                    withNavBar: true, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );

                },
                child: Container(
                  decoration: BoxDecoration(
                      color:darkMain,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 15),
                    child: Text('Open',style: TextStyle(color: mainGolden,fontSize: 18,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
}
