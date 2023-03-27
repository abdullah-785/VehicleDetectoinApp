import 'dart:io';

import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vehicle_detection_app/models/signUpModel.dart';
import 'package:vehicle_detection_app/pages/input_video.dart';
import 'package:vehicle_detection_app/pages/login.dart';
import 'package:vehicle_detection_app/pages/profile.dart';
import 'package:vehicle_detection_app/pages/setting.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int currentIndex = 0;
  File? file;
  String? imageUrl;
  bool isLoading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late DatabaseReference dbRef;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('users');
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  ImagePicker image = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : "No file Selected";
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
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios,
                        size: 28.0, color: Color.fromARGB(255, 23, 69, 103))),
                const SizedBox(
                  width: 120,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
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
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        selectFile();
                      },
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: file == null
                            ? const AssetImage("images/uploadImageVector.jpg")
                            : Image.file(file!).image,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                              label: const Text(
                                "Name",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              hintText: "Enter your name",
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
                                  Icons.person,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ))),
                    ),
                    const SizedBox(
                      height: 15,
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
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                              label: const Text(
                                "Confirm password",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              hintText: "Enter Confirm Password",
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                          controller: _cityController,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                              label: const Text(
                                "City",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              hintText: "Enter your City",
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
                                  Icons.location_city_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                          controller: _phoneNumberController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                              label: const Text(
                                "Number",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              hintText: "03317688086",
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
                                  Icons.phone_android,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                          controller: _descriptionController,
                          minLines: 3,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          decoration: const InputDecoration(
                            label: Text(
                              "Description",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            hintText: "Write something",
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 78, 206, 113))),
                            border: OutlineInputBorder(),
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.92,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 78, 206, 113),
                          ),
                          onPressed: () async {
                            if (file == null) {
                              Fluttertoast.showToast(
                                  msg: "Please Select an Image");
                              return;
                            }

                            try {
                              setState(() {
                                isLoading = true;
                              });
                              if (_emailController.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Plese enter email address");
                                setState(() {
                                  isLoading = false;
                                });
                                return;
                              } else if (_passwordController.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please provide password");
                                setState(() {
                                  isLoading = false;
                                });
                                return;
                              } else if (_passwordController.text.length < 7) {
                                Fluttertoast.showToast(
                                    msg: "Password character atleast 8");
                                setState(() {
                                  isLoading = false;
                                });
                                return;
                              } else if (_passwordController.text !=
                                  _confirmPasswordController.text) {
                                Fluttertoast.showToast(
                                    msg:
                                        "Password and confirm password are not same");
                                setState(() {
                                  isLoading = false;
                                });
                                return;
                              } else if (_cityController.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please enter your city");
                                setState(() {
                                  isLoading = false;
                                });
                                return;
                              } else if (_phoneNumberController.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please enter your Phone number");
                                setState(() {
                                  isLoading = false;
                                });
                                return;
                              } else if (_phoneNumberController.text.length !=
                                  11) {
                                Fluttertoast.showToast(
                                    msg: "Please provide a valid Phone Number");
                                setState(() {
                                  isLoading = false;
                                });
                                return;
                              } else {
                                final ref = FirebaseStorage.instance
                                    .ref()
                                    .child("userImage")
                                    .child(DateTime.now().toString());
                                await ref.putFile(file!);
                                imageUrl = await ref.getDownloadURL();
                                await _auth.createUserWithEmailAndPassword(
                                  email: _emailController.text
                                      .trim()
                                      .toLowerCase(),
                                  password: _passwordController.text.trim(),
                                );

                                FirebaseFirestore firebaseFirestore =
                                    FirebaseFirestore.instance;
                                User? user = _auth.currentUser;

                                SignUpModel signUpModel = SignUpModel();

                                // writing all the values
                                signUpModel.uid = user!.uid;
                                signUpModel.imageUrl = imageUrl;
                                signUpModel.name = _nameController.text;
                                signUpModel.email = _emailController.text;
                                signUpModel.password = _passwordController.text;
                                signUpModel.confirmPassword =
                                    _confirmPasswordController.text;
                                signUpModel.city = _cityController.text;
                                signUpModel.phoneNumber =
                                    _phoneNumberController.text;
                                signUpModel.description =
                                    _descriptionController.text;

                                print(_nameController.text);
                                String email = _emailController.text;

                                await firebaseFirestore
                                    .collection("users")
                                    .doc(user.uid)
                                    .set(signUpModel.toMap());
                                Fluttertoast.showToast(
                                    msg: "Account created successfully :) ");

                                StoreDataInRealTimeDatabase(
                                    user.uid);

                                setState(() {
                                  isLoading = false;
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Login()));
                              }
                            } catch (e) {
                              Fluttertoast.showToast(msg: "${e}");
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          child: (isLoading)
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: const Text("Login Here",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 78, 206, 113),
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  void StoreDataInRealTimeDatabase(String uid) {
    //Real Time database
    Map<String, String> us = {
      'city': _cityController.text,
      'email': _emailController.text,
      'phoneNumber': _phoneNumberController.text,
      'image': imageUrl.toString(),
      'name': _nameController.text,
      'uid': uid
    };
    // print("uid is : "+ uid);

    // dbRef.push().set(us);
    dbRef.child(uid).set(us);
  }
}
