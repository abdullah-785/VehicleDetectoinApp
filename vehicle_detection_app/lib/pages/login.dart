import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vehicle_detection_app/GlobalVaribales/admin_global_variables.dart';
import 'package:vehicle_detection_app/GlobalVaribales/global_variables.dart';
import 'package:vehicle_detection_app/GlobalVaribales/police_global_variable.dart';
import 'package:vehicle_detection_app/models/adminModel.dart';
import 'package:vehicle_detection_app/models/policeModel.dart';
import 'package:vehicle_detection_app/models/signUpModel.dart';
import 'package:vehicle_detection_app/pages/AdminPages/admin_opt_verification.dart';
import 'package:vehicle_detection_app/pages/PolicePages/police_opt_verification.dart';
import 'package:vehicle_detection_app/pages/opt_verification.dart';
import 'package:vehicle_detection_app/pages/profile.dart';
import 'package:vehicle_detection_app/pages/reset_password.dart';
import 'package:vehicle_detection_app/pages/sign_up.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_database/firebase_database.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool _obscureText = true;
  bool isLoading = false;

  List usersType = ['User', 'Admin', 'Police'];
  String? selectedUserType;

  AdminModel adminModel = new AdminModel();
  PoliceModel policeModel = new PoliceModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //For Admin
    FirebaseFirestore.instance
        .collection("admin")
        .doc('ntqabzT1arEobDEDZ3JJ')
        .get()
        .then((value) {
      adminModel = AdminModel.fromMap(value.data());
    });

    //For Polcie
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
      backgroundColor: Color.fromARGB(255, 243, 247, 255),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.width * 0.4,
                      // height: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(150),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 35,
                                spreadRadius: 30,
                                offset: const Offset(3, 3))
                          ]),
                      child: const Image(
                        image: AssetImage(
                          "images/logo1.png",
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          fontSize: 18,
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
                                    color: Color.fromARGB(255, 78, 206, 113))),
                            border: const OutlineInputBorder(),
                            prefixIcon: Container(
                              width: 38,
                              height: 38,
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
                                Icons.email,
                                color: Colors.white,
                                size: 22,
                              ),
                            ))),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                        obscureText: _obscureText,
                        controller: _passwordController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          fontSize: 18,
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
                                  color: Color.fromARGB(255, 78, 206, 113))),
                          border: const OutlineInputBorder(),
                          prefixIcon: Container(
                            width: 38,
                            height: 38,
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
                              Icons.lock,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color.fromARGB(255, 78, 206, 113),
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: DropdownButton(
                      dropdownColor: Colors.white,
                      icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
                      iconSize: 36,
                      isExpanded: true,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      elevation: 10,
                      hint: "Select".text.color(Colors.grey).make(),
                      value: selectedUserType,
                      underline: Container(
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.0,
                                style: BorderStyle.solid,
                                color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                      ),
                      onChanged: (newValue) {
                        // valuechoose = newValue
                        setState(() {
                          selectedUserType = newValue as String?;
                          // print(bedroomsvar);
                        });
                      },
                      items: usersType.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
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
                          userLogin();
                        },
                        child: (isLoading)
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 4.0,
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              )),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: const Text("Create Account?",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 78, 206, 113),
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  //Login User Function
  void userLogin() {
    setState(() {
      isLoading = true;
    });

    if (_emailController.text.isEmpty && _passwordController.text.isEmpty) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: "Please fill required Fields");
      return;
    } else if (_emailController.text.isEmpty) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: "Please provide an email");
      return;
    } else if (_passwordController.text.isEmpty) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: "Please provide a password");
      return;
    } else if (selectedUserType == 'User') {
      _auth
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((uid) => {
                // Store email for otp in global varibale
                // userEmial = _emailController.text,
                Fluttertoast.showToast(msg: "Login Successfully"),

                setState(() {
                  isLoading = false;
                }),
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OptVerification(
                              userEmail: _emailController.text,
                            ))),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
        setState(() {
          isLoading = false;
        });
      });
    } else if (selectedUserType == 'Admin' &&
        _emailController.text == adminModel.email &&
        _passwordController.text == adminModel.password) {
      Fluttertoast.showToast(msg: "Admin Login");
      setState(() {
        isLoading = false;
      });

      admin_global_uid = adminModel.uid;
      admin_global_name = adminModel.name;
      admin_global_password = adminModel.password;
      admin_global_email = adminModel.email;
      admin_global_imageUrl = adminModel.imageUrl;

      adminEmailForOtp = _emailController.text;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AdminOptVerification()));
    } else if (selectedUserType == 'Police' &&
        _emailController.text == policeModel.email &&
        _passwordController.text == policeModel.password) {
      // policeEmailForOtp = _emailController.text;
      Fluttertoast.showToast(msg: "Police Login");
      setState(() {
        isLoading = false;
      });

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PoliceOptVerification(
                    email: _emailController.text,
                  )));
    } else {
      setState(() {
        isLoading = false;
      });
      print(selectedUserType);
      Fluttertoast.showToast(msg: "Invalid Authentication");
      return;
    }
  }
}
