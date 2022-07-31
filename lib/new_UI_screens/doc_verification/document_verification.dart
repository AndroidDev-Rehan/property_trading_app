import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_trading_app/db/user_db.dart';
import 'package:property_trading_app/global_widgets/custom_button.dart';
import 'package:property_trading_app/models/app_user.dart';
import 'package:property_trading_app/models/app_user_request.dart';
import 'package:property_trading_app/old_UI/utils/constants.dart';
import 'package:property_trading_app/utils/CollectionNames.dart';
import 'package:uuid/uuid.dart';
import '../../utils/app-color.dart';
import '../verification/verification.dart';
import 'dart:io';

class DocumentVerificationScreen extends StatefulWidget {
  DocumentVerificationScreen({Key? key}) : super(key: key);

  @override
  State<DocumentVerificationScreen> createState() => _DocumentVerificationScreenState();
}

class _DocumentVerificationScreenState extends State<DocumentVerificationScreen> {
  bool photoId = false;
  bool loading = false;
  bool selfie = false;

  File? selfieFile;
  File? photoIdFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMain,
      // appBar: buildCustomAppBar(),
      body: loading ? Center(
        child: CircularProgressIndicator() ,
      ) : Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width*0.07653061),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Submit Documents", style: TextStyle(color: textColor, fontSize: Get.width * 0.07142, fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              const Text("We need to verify your identity. Please submit the documents below to verify your identity", style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
              const SizedBox(height: 40,),
              CustomElevatedButton(
                text: "  Photo ID  ",
                onPressed: () async{
                  await uploadPhotoId();
                },
                prefixIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text("Step 1",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                    SizedBox(height: 3,),
                    Icon(Icons.person_pin_sharp, color: Colors.black,),
                  ],
                ),
                iconSpacing: Get.width*0.051020,
                fixedSize: Size(Get.width*0.6*1.2,Get.height*0.0561*1.5,),
                color: mainGolden,
                textColor: darkMain,
                suffixIcon: Padding(
                  padding:  EdgeInsets.only(left: Get.width*0.051020),
                  child:  Icon( photoId ? Icons.check_outlined : Icons.upload_sharp, color: photoId ? Colors.green : Colors.black,),
                ),

              ),
              const SizedBox(height: 20,),
              CustomElevatedButton(

                text: "Take a Selfie",
                onPressed: () async{
                  await takeSelfie();
                  // a
                },
                prefixIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text("Step 2",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                    SizedBox(height: 3,),
                    Icon(Icons.photo, color: Colors.black,),
                  ],
                ),
                fixedSize: Size(Get.width*0.6*1.2,Get.height*0.0561*1.5,),
                color: mainGolden,
                textColor: darkMain,
                suffixIcon: Padding(
                  padding:  EdgeInsets.only(left: Get.width*0.051020),
                  child: Icon(selfie ? Icons.check_outlined : Icons.upload_sharp, color: selfie ? Colors.green : Colors.black,),
                ),

              ),
              const SizedBox(height: 40,),
              CustomElevatedButton(
                text: "Next Step",
                onPressed: () async{
                  await submitInfoAdmin();
                },
                fixedSize: Size(Get.width*0.55,Get.height*0.0561,),
                color: mainGolden,
                textColor: darkMain,
                suffixIcon: const Icon(Icons.arrow_forward),

              ),
              const SizedBox(height: 30,),
              const Text("Why this needed?", style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }

  takeSelfie()async{
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 50);

    if(xFile!=null){
      selfie = true;

      selfieFile = File(xFile.path);


      Get.snackbar(
        'Success',
        'Photo Added',
      );
      setState((){});
    }
  }

  uploadPhotoId()async{
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 50);
    if(xFile!=null){

      photoIdFile = File(xFile.path);

      photoId = true;
      Get.snackbar(
        'Success',
        'Photo Added',
      );

      setState((){});

    }
  }


  int count = 0;

  Future<String> uploadImageAndGetUrl(File imageFile ) async {
    count++;
    print("uploading image $count start");
    String downloadUrl = '';
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("file ${DateTime.now()}");
    UploadTask uploadTask = ref.putFile(imageFile);
    await uploadTask.then((res) async{
     downloadUrl = await res.ref.getDownloadURL();
    });

    print("uploading image $count finished");

    return downloadUrl;
  }

  submitInfoAdmin() async{
    if((selfieFile != null) && (photoIdFile != null)){
      try{
        setState(() {
          loading = true;
        });

        String selfieUrl = await uploadImageAndGetUrl(selfieFile!);
        String photoIdUrl = await uploadImageAndGetUrl(photoIdFile!);
        AppUser? appUser = await UserDatabase().getCurrentUser();

        if(appUser!=null){
          UserRequest userRequest = UserRequest(photoIdUrl: photoIdUrl, selfieUrl: selfieUrl, user: appUser);

          await FirebaseFirestore.instance.collection(CollectionNames.userRequests).doc(FirebaseAuth.instance.currentUser!.uid).set(userRequest.toMap());
          Get.to(VerificationScreen());

        }
        setState(() {
          loading = false;
        });
      }
      catch(e){
        Get.snackbar("error", e.toString());
        print(e);

      }
    }
    else{
      Get.snackbar("Failure", "Upload Required Files");
    }
  }

}
