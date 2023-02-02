import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vehicle_detection_app/GlobalVaribales/global_variables.dart';
import 'package:vehicle_detection_app/models/signUpModel.dart';
import 'package:vehicle_detection_app/pages/profile.dart';
import 'package:vehicle_detection_app/pages/second_home_page.dart';
import 'dart:io' show Platform;
import 'package:vehicle_detection_app/pages/setting.dart';
import 'package:vehicle_detection_app/pages/sign_up.dart';
import 'package:email_otp/email_otp.dart';

class OptVerification extends StatefulWidget {
  final String userEmail;
   const OptVerification({
    Key? key, required this.userEmail,

   }) : super(key: key);

  @override
  State<OptVerification> createState() => _OptVerificationState();
}

class _OptVerificationState extends State<OptVerification> {
  
  User? user = FirebaseAuth.instance.currentUser;
  SignUpModel loggedInUser = SignUpModel();
  // late EmailAuth emailAuth;

  EmailOTP myOtp = new EmailOTP();

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = SignUpModel.fromMap(value.data());
      setState(() {});
    });
    print(userEmial);

    sendEmailOtp();
  }

  // bool submitValid = false;
  bool isLoading = false;
  final TextEditingController _optController = TextEditingController();

  // setPrefranceData() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.setString("email", "AlreadyLogedIn");
  // }

  // final bar = SnackBar(content: Text("OTP Send Successfully"));

  @override
  Widget build(BuildContext context) {
    callGlobalVariable();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 247, 255),
      body: Column(
        children: [
          const Expanded(child: Image(image: AssetImage("images/opt.png"))),
          Expanded(
              child: Container(
            height: 30,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 20,
                  blurRadius: 15,
                  offset: const Offset(0, 10), // changes position of shadow
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                          height: 10,
                        ),
                  // Text("${loggedInUser.phoneNumber}"),
                  Text(
                    "Enter OTP Code",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      textAlign: TextAlign.justify,
                      "App needs a verify your identity to reset your password, OTP code sent to you through SMS please enter OTP code below and reset password.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                        controller: _optController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                            label: const Text(
                              "OTP",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            hintText: "Enter OTP",
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 78, 206, 113))),
                            border: const OutlineInputBorder(),
                            prefixIcon: Container(
                              width: 40,
                              height: 40,
                              margin: const EdgeInsets.only(
                                top: 11,
                                bottom: 11,
                                right: 8,
                                left: 11,
                              ),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 78, 206, 113),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                Icons.verified,
                                color: Colors.white,
                                size: 20,
                              ),
                            ))),
                  ),

                  Row(
                    children: const [],
                  ),
                  const SizedBox(
                    height: 28,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 78, 206, 113),
                        ),
                        onPressed: () {
                          verifyOtp();

                        },
                        child: (isLoading)? const CircularProgressIndicator(
                          color: Colors.white,
                        ) : const Text(
                          "Submit",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      sendEmailOtp();
                    },
                    child: const Text("Resend OTP",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        )),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }


  void sendEmailOtp() async {
    myOtp.setConfig(
      appName: "Vehicle Detection App",
      appEmail: "19101001-038@uskt.edu.pk",
      userEmail: userEmial,
      otpLength: 4,
      otpType: OTPType.digitsOnly
    );

    if(await myOtp.sendOTP() == true){
      Fluttertoast.showToast(msg: "OTP send successfully");
    }
  }

  void verifyOtp() async {
    setState(() {
      isLoading = true;
    });

    if(await myOtp.verifyOTP(otp: _optController.text) == true){
      Fluttertoast.showToast(msg: "Successfully");
      setState(() {
      isLoading = false;
    });
      Navigator.push(context, MaterialPageRoute(builder: (context) => SecondHomePage()));
    }else{
      Fluttertoast.showToast(msg: "Invalid OTP");
      setState(() {
      isLoading = false;
    });
    }
  }


  void callGlobalVariable() {
    global_uid = loggedInUser.uid;
    global_imageUrl = loggedInUser.imageUrl;
    global_name = loggedInUser.name;
    global_email = loggedInUser.email;
    global_password = loggedInUser.password;
    global_confirmPassword = loggedInUser.confirmPassword;
    global_city = loggedInUser.city;
    global_phoneNumber = loggedInUser.phoneNumber;
    global_description = loggedInUser.description;
  }
}
