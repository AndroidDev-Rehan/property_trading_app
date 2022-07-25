import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:property_trading_app/global_widgets/custom_app_bar.dart';
import 'package:property_trading_app/global_widgets/custom_button.dart';
import 'package:property_trading_app/new_UI_screens/payment/payment_method.dart';
import 'package:property_trading_app/old_UI/view/history/history%20screen.dart';

import '../../../utils/app-color.dart';

import '../../../utils/text_style.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late List<FlSpot> spots;
  late double profitPercent;
  late double minY;
  late double maxY;
  @override
  void initState() {
    spots = const [
      FlSpot(0, 100.40),
      FlSpot(1, 102.34),
      FlSpot(2, 98.23),
      FlSpot(3, 100.23),
      FlSpot(4, 102.10),
      FlSpot(5, 103.85),
      FlSpot(6, 103.20),
    ];
    List sortedSpots = spots.toList();
    sortedSpots.sort((a, b) => a.y.compareTo(b.y));
    minY = sortedSpots.first.y;
    maxY = sortedSpots.last.y;
    profitPercent = ((spots.last.y - spots[spots.length - 2].y) /
        spots[spots.length - 2].y) *
        100;
    for (var i = 0; i < spots.length; i++) {
      totalSpotsValue.value += spots[i].y;
    }
    super.initState();
  }

  Rx<double> totalSpotsValue = 0.0.obs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkMain,
        appBar: buildCustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        'Current Price',
                        style: TextStyle(color: textColor),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '0.057508',
                        style: TextStyle(
                            color: textColor, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '= \$0.057508',
                        style: TextStyle(color: textColor),
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        '24h High',
                        style: TextStyle(color: textColor),
                      ),
                      Text(
                        '0.057508',
                        style: TextStyle(color: textColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '24h Low',
                        style: TextStyle(color: textColor),
                      ),
                      Text(
                        '0.057508',
                        style: TextStyle(color: textColor),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Text(
                        '24h Vol(KLV)',
                        style: TextStyle(color: textColor),
                      ),
                      Text(
                        '5.87M',
                        style: TextStyle(color: textColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '24h Low',
                        style: TextStyle(color: textColor),
                      ),
                      Text(
                        '\$ 180.92k',
                        style: TextStyle(color: textColor),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              Divider(
                color: textColor,
                height: 40,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    CustomElevatedButton(text: "History", onPressed: (){
                      pushNewScreen(context, screen: History());
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: 500,
                  height: 300,
                  child: LineChart(
                    chart(
                      false,
                      spots,
                      minY,
                      maxY,
                      profitPercent >= 0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0x400c9a54)),
                  child: Text(
                    'Current Rate',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                      child: Text(
                        'Price',
                        style: TextStyle(fontSize: 18, color: textColor),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(10),
                        // height: 40,
                        width: Get.width,
                        decoration: BoxDecoration(
                            border: Border.all(color: textColor, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '0.057508',
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              'KLV',
                              style: TextStyle(color: textColor, fontSize: 18),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                      child: Text(
                        'Amount',
                        style: TextStyle(fontSize: 18, color: textColor),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(10),
                        // height: 40,
                        width: Get.width,
                        decoration: BoxDecoration(
                            border: Border.all(color: textColor, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '0',
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              'USDT',
                              style: TextStyle(color: textColor, fontSize: 18),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: textColor,
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Avaliable',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            '0.00 USDT',
                            style: TextStyle(color: textColor, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: textColor,
                      height: 10,
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomElevatedButton(text: "Buy", onPressed: (){
                            pushNewScreen(
                              context,
                              screen: PaymentOptions(),
                              withNavBar: true, // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            );
                          },
                            color: Colors.green,
                            horizontalPadding: 20,
                            verticalPadding: 10,

                          ),
                          CustomElevatedButton(text: "Sell", onPressed: (){
                            pushNewScreen(
                              context,
                              screen: PaymentOptions(),
                              withNavBar: true, // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            );
                          },
                            color: Colors.red,
                            horizontalPadding: 20,
                            verticalPadding: 10,


                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

LineChartData chart(
    bool isHomePage,
    List<FlSpot> spots,
    double minY,
    double maxY,
    bool profit,
    ) {
  List<Color> redColors = [Colors.white];

  return LineChartData(
    backgroundColor: Colors.transparent,
    borderData: FlBorderData(border: Border.all(width: 0)),

    titlesData:  FlTitlesData(
      show: true,
      rightTitles: SideTitles(showTitles: true,
        reservedSize: 35,
        margin: 10,
        getTextStyles: (context, value) => TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),),
      topTitles: SideTitles(showTitles: false),
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 28,
        interval: 1,
        textAlign: TextAlign.start,
        getTextStyles: (context, value) => TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return '13 july';
            case 1:
              return '14 july';
            case 2:
              return '15 july';
            case 3:
              return '16 july';
            case 4:
              return '17 july';
            case 5:
              return '18 july';
            case 6:
              return '19 july';
            default:
              return '';
          }
        },
        margin: 8,
      ),
      leftTitles: SideTitles(
        showTitles: false,),
    ),
    lineTouchData: LineTouchData(
      touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.black,
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            return touchedBarSpots.map((barSpot) {
              final flSpot = barSpot;
              return LineTooltipItem(
                flSpot.y
                    .toStringAsFixed(2)
                    .replaceFirst('.', ',')
                    .replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.'),
                GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  letterSpacing: 0.5,
                ),
              );
            }).toList();
          }),
    ),
    minX: 0,
    maxX: 6,
    minY: minY,
    maxY: maxY,
    lineBarsData: [
      LineChartBarData(
        spots: spots,
        isCurved: true,
        colors: redColors,
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors: redColors.map((color) => color.withOpacity(0.3)).toList(),
        ),
      ),
    ],
  );
}
