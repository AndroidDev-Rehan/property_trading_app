import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:property_trading_app/view/p2p/addp2p.dart';

import '../../utils/app-color.dart';
import '../chat.dart';

class P2pTrade extends StatefulWidget {
  const P2pTrade({Key? key}) : super(key: key);

  @override
  State<P2pTrade> createState() => _P2pTradeState();
}

class _P2pTradeState extends State<P2pTrade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: mainGolden,onPressed: (){ pushNewScreen(
        context,
        screen: AddP2p(),
        withNavBar: true, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );},child: const Icon(Icons.add,color: white,size: 30,)),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'P2P Trade',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: white),
        ),
        backgroundColor: darkMain,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  index==0?SizedBox(height: 20,):SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Ali Raza',
                            style: TextStyle(
                                fontSize: 25,
                                // color: mainGolden,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '1 Marla',
                            style: TextStyle(fontSize: 20,
                                // color: mainGolden
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Price: 100K',
                        style: TextStyle(
                            fontSize: 18,
                            // color: mainGolden
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Get.to(const ChatPage());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                          decoration: const BoxDecoration(
                              color: darkMain,
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: const Text('BUY',style: TextStyle(color: white,fontSize: 18,fontWeight: FontWeight.bold),),
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    height: 40,
                    color: grey,
                  )
                ],
              ),
            );
          }),
    );
  }
}
