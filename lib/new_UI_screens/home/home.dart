import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:property_trading_app/global_widgets/custom_app_bar.dart';
import 'package:property_trading_app/new_UI_screens/subproject/subproject.dart';
import 'package:property_trading_app/utils/app-color.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double currentposition=Get.width * 0.65 + 20;
  double currentpositionproject=220 + 20;
  ScrollController _scrollControllerproject = ScrollController();
  ScrollController _scrollController = ScrollController();

  void _scrollRight() {
    if(currentposition<((10*(Get.width *0.65+20)))) {
      _scrollController.animateTo(
        currentposition,
        duration: Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
      );
      currentposition += Get.width * 0.65 + 20;
    }
    else{
      _scrollController.animateTo(
        0,
        duration: Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
      );
      currentposition=Get.width * 0.65 + 20;
    }

  }
  void _scrollRightProject(){
    if(currentpositionproject<((10*(220+20)))) {
      _scrollControllerproject.animateTo(
        currentpositionproject,
        duration: Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
      );
      currentpositionproject += 220 + 20;
    }
    else{
      _scrollControllerproject.animateTo(
        0,
        duration: Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
      );
      currentpositionproject=220+ 20;
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(Duration(seconds: 5), (Timer t) => _scrollRight());
    Timer.periodic(Duration(seconds: 3), (Timer t) => _scrollRightProject());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: buildCustomAppBar(),
      body: Container(
        height: Get.height,
        width: Get.width,
        color: darkMain,
        padding: EdgeInsets.only(left: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Icon(
                Icons.arrow_back_ios_new,
                size: 30,
                color: mainGolden,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  gradient: LinearGradient(
                      colors: [mainGolden, Color.fromRGBO(225, 200, 140, 1.0)]),
                ),
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Your total asset portfolio',
                      style: TextStyle(color: darkMain, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'N203,935',
                          style: TextStyle(
                              color: darkMain,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: Get.width * 0.3,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Project In Running',
                style: TextStyle(
                    color: textColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(

                    controller: _scrollControllerproject,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return _buildrunningproject();
                    }),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Comming Soon',
                      style: TextStyle(
                          color: textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'view all',
                      style: TextStyle(
                          color: textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 190,
                child: ListView.builder(

                    controller: _scrollController,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return _buildcomingsoon();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildrunningproject() {
    return InkWell(
      onTap: () {
        pushNewScreen(
          context,
          screen: SubProjectscreen(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: 220,
        decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            image: DecorationImage(
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.darken),
                image: Image.asset(
                  'assets/images/h1.jpg',
                  height: 250,
                  width: 250,
                ).image)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Halloween Sale!',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'All discount up to 60%',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: darkMain.withOpacity(0.8),
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildcomingsoon() {
    return Container(
      margin: EdgeInsets.all(10),
      width: Get.width * 0.65,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Padding(
        padding:  EdgeInsets.all(Get.height*0.0176470),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  'assets/images/h1.jpg',
                  height: 130,
                  width: Get.width * 0.25,
                  fit: BoxFit.fill,
                )),
            SizedBox(
              width: 5,
            ),
            SizedBox(
                width: Get.width * 0.3,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Sky Dandelions Apartment',
                      style: TextStyle(color: darkMain, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: mainGolden,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '4.9',
                          style: TextStyle(
                              color: mainGolden,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.edit_location,
                          color: mainGolden,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Jakarta',
                          style: TextStyle(
                              color: darkMain,
                              fontWeight: FontWeight.bold,
                              fontSize: Get.height * 0.0176470),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          '\$',
                          style: TextStyle(
                              color: darkMain,
                              fontWeight: FontWeight.bold,
                              fontSize: Get.height*0.02941176),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '290',
                          style: TextStyle(
                              color: darkMain,
                              fontWeight: FontWeight.bold,
                              fontSize: Get.height*0.02941176),
                        )
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
