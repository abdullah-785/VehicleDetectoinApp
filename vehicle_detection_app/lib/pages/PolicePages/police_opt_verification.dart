import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vehicle_detection_app/GlobalVaribales/admin_global_variables.dart';
import 'package:vehicle_detection_app/GlobalVaribales/global_variables.dart';
import 'package:vehicle_detection_app/GlobalVaribales/police_global_variable.dart';
import 'package:vehicle_detection_app/models/signUpModel.dart';
import 'package:vehicle_detection_app/pages/AdminPages/admin_panel.dart';
import 'package:vehicle_detection_app/pages/PolicePages/police_admin_panel.dart';
import 'package:vehicle_detection_app/pages/profile.dart';
import 'dart:io' show Platform;

import 'package:vehicle_detection_app/pages/setting.dart';
import 'package:vehicle_detection_app/pages/sign_up.dart';

class PoliceOptVerification extends StatefulWidget {
  PoliceOptVerification({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  State<PoliceOptVerification> createState() => _PoliceOptVerificationState();
}

class _PoliceOptVerificationState extends State<PoliceOptVerification> {
  EmailOTP myOtp = new EmailOTP();

  @override
  void initState() {
    super.initState();

    sendEmailOtp();
  }

  bool submitValid = false;
  bool isLoading = false;
  final TextEditingController _optController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // callGlobalVariable();
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
                  (isLoading)
                      ? const SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: Colors.green,
                            strokeWidth: 2,
                          ))
                      : const SizedBox(
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
                        child: const Text(
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
    print(widget.email);
    myOtp.setConfig(
        appName: "Vehicle Detection App",
        appEmail: "19101001-038@uskt.edu.pk",
        userEmail: widget.email,
        otpLength: 4,
        otpType: OTPType.digitsOnly);

    if (await myOtp.sendOTP() == true) {
      Fluttertoast.showToast(msg: "OTP send successfully");
    }
  }

  void verifyOtp() async {
    if (await myOtp.verifyOTP(otp: _optController.text) == true) {
      Fluttertoast.showToast(msg: "Successfully");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PolicePanel()));
    } else {
      Fluttertoast.showToast(msg: "Invalid OTP");
    }
  }
}
