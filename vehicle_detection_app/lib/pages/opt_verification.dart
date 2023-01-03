import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:vehicle_detection_app/pages/setting.dart';

class OptVerification extends StatefulWidget {
  // final String _email;

  // OptVerification(this._email);

  @override
  State<OptVerification> createState() => _OptVerificationState();
}

class _OptVerificationState extends State<OptVerification> {
  String? fcm;
  String? os;
  @override
  void initState() {
    super.initState();
    // getFCM();
    // bar.show(context);
    // OptVerification();
  }

  // late EmailAuth emailAuth;
  bool submitValid = false;
  bool isLoading = false;
  final TextEditingController _optController = TextEditingController();

  // void sendOtp() async {
  //   emailAuth = new EmailAuth(
  //     sessionName: "Ealaka App",
  //   );
  //   bool result = (await emailAuth.sendOtp(
  //       recipientMail: "${loggedInUser.email}", otpLength: 4));
  //   if (result) {
  //     setState(() {
  //       submitValid = true;
  //     });
  //   }
  // }

  // void verify() async {
  //   String email = widget._email;
  //   String otp = _optController.text;
  //   setState(() {
  //     isLoading = true;
  //   });
  //   await verifyOTPCall(email, otp, fcm ?? "", os ?? "").then((value) =>
  //       // print("done")
  //       callApi(value));
  // }

  // setPrefranceData() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.setString("email", "AlreadyLogedIn");
  // }

  // final bar = SnackBar(content: Text("OTP Send Successfully"));

  @override
  Widget build(BuildContext context) {
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
                  const Text(
                    "Enter OTP Code",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Ealaka needs a verify your identity to reset your password, OTP code sent to you through SMS please enter OTP code below and reset password.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 32),
                  //   child: TextFormField(
                  //         controller: _optController,

                  //       ),
                  // ),

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
                          primary: const Color.fromARGB(255, 78, 206, 113),
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          // verify();

                          // FirebaseFirestore firebaseFirestore =
                          //           FirebaseFirestore.instance;
                          //       User? user = _auth.currentUser;

                          //                 UserModel userModel = UserModel();

                          // if(loggedInUser.oldUser == true){
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => const ProgressBar()));

                          // }else if(loggedInUser.oldUser == false){
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => const NewPassword()));
                          // }

                          Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()));
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
                      // sendOtp();
                      // Fluttertoast.showToast(msg: "OTP Send Successfully");
                      // bar.show(context);
                      
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

  // _verifyPhone() async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: '${loggedInUser.phoneNumber}}',
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         await FirebaseAuth.instance
  //             .signInWithCredential(credential)
  //             .then((value) async {
  //           if (value.user != null) {
  //             Navigator.pushAndRemoveUntil(
  //                 context,
  //                 MaterialPageRoute(builder: (context) => NewPassword()),
  //                 (route) => false);
  //           }
  //         });
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         print(e.message);
  //       },
  //       codeSent: (String? verficationID, int? resendToken) {
  //         setState(() {
  //           _verificationCode = verficationID;
  //         });
  //       },
  //       codeAutoRetrievalTimeout: (String verificationID) {
  //         setState(() {
  //           _verificationCode = verificationID;
  //         });
  //       },
  //       timeout: Duration(seconds: 120));
  // }

  // @override
  // void initState() {
  // TODO: implement initState
  // super.initState();
  // _verifyPhone();
  // }

//   void callApi(LoginUser? user) async {
//     setState(() {
//       isLoading = false;
//     });

//     if (user?.status == "true") {
//       SharedPrefUtils.saveInt(userId, user?.data?.id ?? 0);
//       SharedPrefUtils.saveStr("userEmail", user?.data?.email ?? "");

//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => CurrentNoOrder(user!.data!.id.toString())));
//       // Navigator.push(context,
//       //     MaterialPageRoute(builder: (context) => NewPassword(widget._email)));
//     }
//   }

//   void getFCM() async {
//     fcm = await SharedPrefUtils.readPrefStr("fcm");
//     os = Platform.operatingSystem;
//   }
}
