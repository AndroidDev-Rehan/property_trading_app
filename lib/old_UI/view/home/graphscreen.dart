import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:property_trading_app/old_UI/utils/app-color.dart';
import 'package:property_trading_app/old_UI/view/payment/payment_options.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';
import '../../../new_UI_screens/payment_method/payment_method.dart';
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: SizedBox(
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
                Text(
                  'Current Value',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: mainGolden),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '100,000 Rs',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        pushNewScreen(
                          context,
                          screen: PaymentOptions(),
                          withNavBar: true, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation: PageTransitionAnimation.cupertino,
                        );
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: mainGolden, width: 2)),
                          height: 40,
                          width: Get.width * 0.4,
                          child: Center(
                              child: Text(
                                'Buy',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: mainGolden),
                              ))),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: mainGolden, width: 2)),
                        height: 40,
                        width: Get.width * 0.4,
                        child: Center(
                            child: Text(
                              'Sell',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: mainGolden),
                            )))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      label: Text(
                        'Input File',
                        style: TextStyle(
                            color: mainGolden,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: mainGolden, width: 2))),
                ),
                SizedBox(
                  height: 30,
                ),
                Material(
                    color: mainGolden,
                    elevation: 30,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: mainGolden)),
                      height: 60,
                      width: Get.width,
                      child: Center(
                        child: Text(
                          'Confirmation',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ))
              ],
            ),
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
    borderData: FlBorderData(border: Border.all(color: Colors.white)),
    gridData: FlGridData(
      show: !isHomePage,
      drawVerticalLine: !isHomePage,
      drawHorizontalLine: true,
      verticalInterval: 1,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Colors.white,
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: Colors.white,
          strokeWidth: 1,
        );
      },
    ),
    titlesData: isHomePage
        ? FlTitlesData(show: false)
        : FlTitlesData(
      show: true,
      rightTitles: SideTitles(showTitles: false),
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
              return '1';
            case 1:
              return '2';
            case 2:
              return '3';
            case 3:
              return '4';
            case 4:
              return '5';
            case 5:
              return '6';
            case 6:
              return '7';
            default:
              return '';
          }
        },
        margin: 8,
      ),
      leftTitles: SideTitles(
        showTitles: true,
        reservedSize: 35,
        margin: 10,
        getTextStyles: (context, value) => TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
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
