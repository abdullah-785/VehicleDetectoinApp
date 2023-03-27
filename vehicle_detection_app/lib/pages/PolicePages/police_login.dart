import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vehicle_detection_app/GlobalVaribales/admin_global_variables.dart';
import 'package:vehicle_detection_app/models/adminModel.dart';
import 'package:vehicle_detection_app/models/policeModel.dart';
import 'package:vehicle_detection_app/pages/AdminPages/admin_opt_verification.dart';
import 'package:vehicle_detection_app/pages/AdminPages/admin_panel.dart';
import 'package:vehicle_detection_app/pages/PolicePages/police_opt_verification.dart';
import 'package:vehicle_detection_app/pages/input_video.dart';
import 'package:vehicle_detection_app/pages/profile.dart';
import 'package:vehicle_detection_app/pages/reset_password.dart';
import 'package:vehicle_detection_app/pages/setting.dart';

import '../../GlobalVaribales/police_global_variable.dart';

class PoliceLogin extends StatefulWidget {
  const PoliceLogin({Key? key}) : super(key: key);

  @override
  State<PoliceLogin> createState() => _PoliceLoginState();
}

class _PoliceLoginState extends State<PoliceLogin> {
  int currentIndex = 0;
  bool isLoading = false;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwrodController = new TextEditingController();
  // AdminModel adminModel = new AdminModel();
  PoliceModel policeModel = new PoliceModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseFirestore.instance
        .collection("police")
        .doc('iigtad1gGgiT7LjpENbP')
        .get()
        .then((value) {
      policeModel = PoliceModel.fromMap(value.data());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 247, 255),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 70,
              left: 16,
              right: 20,
            ),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios,
                        size: 28.0, color: Color.fromARGB(255, 23, 69, 103))),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.21,
                ),
                const Text(
                  "Police Panel",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              // height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                              label: const Text(
                                "Email",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              hintText: "Enter Email",
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 78, 206, 113))),
                              border: const OutlineInputBorder(),
                              prefixIcon: Container(
                                width: 50,
                                height: 50,
                                margin: const EdgeInsets.only(
                                  top: 11,
                                  bottom: 11,
                                  right: 8,
                                  left: 11,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 78, 206, 113),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Icon(
                                  Icons.email,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ))),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                          controller: _passwrodController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                              label: const Text(
                                "Password",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              hintText: "Enter Password",
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 78, 206, 113))),
                              border: const OutlineInputBorder(),
                              prefixIcon: Container(
                                width: 50,
                                height: 50,
                                margin: const EdgeInsets.only(
                                  top: 11,
                                  bottom: 11,
                                  right: 8,
                                  left: 11,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 78, 206, 113),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetPassword()));
                      },
                      child: const Text("Forget Password?",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 78, 206, 113),
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 78, 206, 113),
                          ),
                          onPressed: () {
                            policeLogin();
                          },
                          child: (isLoading)? CircularProgressIndicator(
                            color: Colors.white,
                          ) : Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 23, 69, 103),
        unselectedItemColor: const Color.fromARGB(255, 23, 69, 103),
        iconSize: 30,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Setting()));
                },
                child: const Icon(Icons.settings)),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InputVideo()));
                },
                child: const Icon(Icons.add_a_photo)),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
                child: const Icon(Icons.account_circle)),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void policeLogin() {
    
    try {
      setState(() {
        isLoading = true;
      });
      if (_emailController.text.isEmpty && _passwrodController.text.isEmpty) {
        setState(() {
        isLoading = false;
      });
        Fluttertoast.showToast(msg: "Please enter your required fields");
        return;
      } else if (_emailController.text.isEmpty) {
        setState(() {
        isLoading = false;
      });
        Fluttertoast.showToast(msg: "Please an email address");
        return;
      } else if (_passwrodController.text.isEmpty) {
        setState(() {
        isLoading = false;
      });
        Fluttertoast.showToast(msg: "Please enter your password");
        return;
      } else if (_emailController.text != policeModel.email) {
        setState(() {
        isLoading = false;
      });
        Fluttertoast.showToast(msg: "Email is not correct");
        return;
      } else if (_emailController.text != policeModel.email) {
        setState(() {
        isLoading = false;
      });
        Fluttertoast.showToast(msg: "Password is not correct");
        return;
      } else if (_emailController.text == policeModel.email &&
          _passwrodController.text == policeModel.password) {

          // admin_global_uid = adminModel.uid;
          // admin_global_name = adminModel.name;
          // admin_global_password = adminModel.password;
          // admin_global_email = adminModel.email;
          // admin_global_imageUrl = adminModel.imageUrl;
          
          policeEmailForOtp = _emailController.text;
          print(policeEmailForOtp);

          setState(() {
        isLoading = false;
      });
      // Fluttertoast.showToast(msg: "Welcome to Admin Panel");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PoliceOptVerification()));

      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: "$e");
    }
  }
}
