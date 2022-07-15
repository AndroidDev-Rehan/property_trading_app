import 'package:flutter/material.dart';
import 'package:property_trading_app/utils/app-color.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController passController = TextEditingController();




  @override
  Widget build(BuildContext context) {

    usernameController.text = "Anwar Zeb";
    emailController.text = "anwarzeb@gmail.com";
    genderController.text = "Male";
    dateController.text = "10/11/2012";
    phoneController.text = "+923244564754";
    passController.text = "******";


    return Scaffold(
      backgroundColor: darkMain,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("Profile", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          Center(child: Text("Save", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
          SizedBox(width: 30,)

        ],
        backgroundColor: darkMain,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                  color: darkMain,

                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset("assets/images/person.jpg", height: 100, width: 100, fit:
                              BoxFit.cover, ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                borderRadius: BorderRadius.circular(20)
                              ),
                                padding: EdgeInsets.all(5.5),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,

                                ))

                        )
                      ],
                    ),
                  ),
                ),
              )

          ),
          Expanded(
              flex: 4,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(35), topLeft: Radius.circular(35)),
                  color: Colors.white

                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ListView(
                    children: [
                      const SizedBox(height: 30,),
                      customTextField("Username", usernameController),
                      customTextField("Email", emailController,readOnly: true),
                      customTextField("Password", passController,),
                      customTextField("Phone", phoneController, readOnly: true),
                      customTextField("Gender", genderController),
                      customTextField("Date of Birth", dateController),



                    ],
                  ),
                ),
              )

          )
        ],
      ),
    );
  }

  Widget customTextField(String label, TextEditingController controller,
      {bool readOnly = false}){
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        decoration: InputDecoration(
          label: Text(label, style: TextStyle(color: Colors.grey.withOpacity(0.7)),),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.orange)
          ),
          disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.orange)
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))
          )
        ),
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),

      ),
    );
  }
}

