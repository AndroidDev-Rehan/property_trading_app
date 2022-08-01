
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:property_trading_app/global_widgets/custom_button.dart';

import '../../controllers/google_signin_controller.dart';
import '../../global_widgets/custom_app_bar.dart';
import '../../utils/app-color.dart';
import '../dashboard/dashboard.dart';
import '../welcome/welcome_screen.dart';
const String testDevice = 'YOUR_DEVICE_ID';
const int maxFailedLoadAttempts = 3;
class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;


  @override
  void initState() {
    super.initState();
    _createInterstitialAd();

  }

  void _createInterstitialAd() {
    InterstitialAd.load(
        adUnitId:'ca-app-pub-2025219748618763/2651559702',
        request: request,
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            _interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
            _interstitialAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
              _createInterstitialAd();
            }
          },
        ));
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(

      onAdShowedFullScreenContent: (InterstitialAd ad) async{
        print("into signout");
        await FirebaseAuth.instance.signOut();
        try{
          await GoogleSignInController.signOut();
        }
        catch(e){
          print(e);
        }
        Get.offAll(const WelcomeScreen());
        print(FirebaseAuth.instance.currentUser?.uid);

      },
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }









  @override
  void dispose() {
    super.dispose();
    _interstitialAd?.dispose();

  }
  @override
  Widget build(BuildContext context) {

    print(Get.width);
    return Scaffold(
      backgroundColor: darkMain,
      // appBar: buildCustomAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/verify_latest.png"),
              const SizedBox(height: 0,),
              Text("Congrats !!", style: TextStyle(color: textColor, fontSize: Get.width * 0.0636574, fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              Text("Your application has been successfully submitted. You will be notified your shortly", style: TextStyle(color: textColor, fontSize: Get.width*0.0356, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
              const SizedBox(height: 40,),
              CustomElevatedButton(
                text: "Login From Another Account",
                onPressed: (){
                  _showInterstitialAd();


                },
                fixedSize: Size(Get.width*0.644859813,Get.height*0.0561,),
                color: mainGolden,
                textColor: darkMain,


              ),



            ],
          ),
        ),
      ),
    );
  }
}
