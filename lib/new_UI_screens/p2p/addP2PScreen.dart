import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:property_trading_app/global_widgets/custom_button.dart';
import '../../global_widgets/custom_app_bar.dart';
import '../../utils/app-color.dart';

class AddP2PScreen extends StatelessWidget {
  const AddP2PScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMain,
      appBar: buildCustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 30),
        child: Column(
          children: [
            _buildTopRow(),
            const SizedBox(height: 40,),
            _buildAmountContainer(),
            const SizedBox(height: 30,),
            _buildAmountText(),
            const SizedBox(height: 30,),
            _buildFileNumber(),
            const SizedBox(height: 50,),
            _buildDialPad(),
            const SizedBox(height: 60,),
            CustomElevatedButton(
                text: "Next",
                onPressed: (){},
              color: mainGolden,
              textColor: darkMain,
              textStyle: TextStyle(color: darkMain),
              fixedSize: Size(double.infinity,40,),
              roundness: 5,

            )


          ],
        ),
      ),
    );
  }

  Widget _buildTopRow(){
    return Row(
      children: const [
        Icon(Icons.arrow_back_ios, color: Colors.white,),
        SizedBox(width: 20,),
        Text("Buy KLV", style: TextStyle(color: mainGolden, fontSize: 15, fontWeight: FontWeight.bold),),
        Spacer(),
        Text("Step 1 of 3", style: TextStyle(color: mainGolden, fontSize: 12, fontWeight: FontWeight.normal),),
      ],
    );
  }
  

  Widget _buildAmountContainer(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        children: [
          _buildDollarIcon(),
          const SizedBox(width: 5,),
          const Text("16.41", style: TextStyle(color: mainGolden, fontSize: 15, fontWeight: FontWeight.bold)),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text("Limit", style: TextStyle(color: mainGolden, fontSize: 12, fontWeight: FontWeight.bold)),
              SizedBox(width: 10,),
              Text("\$7500   -  \$15000    ", style: TextStyle(color: mainGolden, fontSize: 12, fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
    );
  }
  Widget _buildDollarIcon(){
    return Container(
      color: mainGolden,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: const Text("\$", style: TextStyle(fontWeight: FontWeight.bold),),
    );
  }

  Widget _buildAmountText(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Amount",style: TextStyle(color: mainGolden, fontSize: 12, fontWeight: FontWeight.bold) ,),
            SizedBox(width: 10,),
            _buildDHA(),
          ],
        ),
        const SizedBox(height: 5,),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("0 ",style: TextStyle(color: mainGolden, fontSize: 36, fontWeight: FontWeight.bold)),
            Text("DHA",style: TextStyle(color: mainGolden, fontSize: 10, fontWeight: FontWeight.normal))
          ],
        )
      ],
    );

  }


  Widget _buildDHA(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: const Text("DHA", style: TextStyle(color: mainGolden, fontSize: 10, fontWeight: FontWeight.normal)),
    );
  }

  Widget _buildFileNumber(){
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 10, ),
      width: Get.width * 0.5269,
      height: Get.height * 0.036717*1.35,
      decoration: BoxDecoration(
        border: Border.all(
          color: mainGolden
        )
      ),
      child: const Center(
        child: Text(
          "File Number",
          style: TextStyle(color: mainGolden),
        ),
      ),
    );
  }

  Widget _buildDialPad(){

    Map<int,String> map = {
      9 : ".",
      10 : "0",
      11 : "x"
    };


    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 10
        ),
        itemBuilder: (context,index){
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
            child: index==11 ? Icon(Icons.delete_forever_rounded, color: Colors.white, size: 15,) : Text( (index+1) > 9 ? map[index]! :  (index+1).toString(), style: const TextStyle(color: Colors.white),textAlign: TextAlign.center,),
          );
        },
      itemCount: 12,
      shrinkWrap: true,

    );
  }


}
