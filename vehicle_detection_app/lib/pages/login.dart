import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vehicle_detection_app/GlobalVaribales/global_variables.dart';
import 'package:vehicle_detection_app/models/signUpModel.dart';
import 'package:vehicle_detection_app/pages/opt_verification.dart';
import 'package:vehicle_detection_app/pages/profile.dart';
import 'package:vehicle_detection_app/pages/reset_password.dart';
import 'package:vehicle_detection_app/pages/sign_up.dart';

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
                          "images/logo2.png",
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
                                    color: Color.fromARGB(255, 78, 206, 113))),
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
                                color: const Color.fromARGB(255, 78, 206, 113),
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
                        obscureText: _obscureText,
                        controller: _passwordController,
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
                                  color: Color.fromARGB(255, 78, 206, 113))),
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
                              color: const Color.fromARGB(255, 78, 206, 113),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(
                              Icons.lock,
                              color: Colors.white,
                              size: 30,
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
                          if (_emailController.text.isEmpty &&
                              _passwordController.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Please fill required Fields");
                            return;
                          } else if (_emailController.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Please provide an email");
                            return;
                          } else if (_passwordController.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Please provide a password");
                            return;
                          } else {
                            _auth
                                .signInWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text)
                                .then((uid) => {
                                  // Store email for otp in global varibale
                                  userEmial = _emailController.text,
                                  // getLoginUserDetails(),
                                  // callGlobalVariable(),

                                      Fluttertoast.showToast(
                                          msg: "Login Successfully"),
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  OptVerification(
                                                    userEmail:
                                                        _emailController.text,
                                                  ))),
                                    })
                                .catchError((e) {
                              Fluttertoast.showToast(msg: e!.message);
                            });
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    height: 5,
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
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  // void getLoginUserDetails() {
  //   print("calling getLoginUserDetails");
  //   User? user = FirebaseAuth.instance.currentUser;
  //   SignUpModel loggedInUser = SignUpModel();

  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(user!.uid)
  //       .get()
  //       .then((value) {
  //     loggedInUser = SignUpModel.fromMap(value.data());
  //     setState(() {});
  //   });
  // }

  // void callGlobalVariable() {
  //   print("calling callGlobalVariables");
  //   SignUpModel loggedInUser = new SignUpModel();
  //   global_uid = loggedInUser.uid;
  //   global_imageUrl = loggedInUser.imageUrl;
  //   global_name = loggedInUser.name;
  //   global_email = loggedInUser.email;
  //   global_password = loggedInUser.password;
  //   global_confirmPassword = loggedInUser.confirmPassword;
  //   global_city = loggedInUser.city;
  //   global_phoneNumber = loggedInUser.phoneNumber;
  //   global_description = loggedInUser.description;
  // }
}
