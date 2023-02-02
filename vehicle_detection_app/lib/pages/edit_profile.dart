import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vehicle_detection_app/GlobalVaribales/global_variables.dart';
import 'package:vehicle_detection_app/models/signUpModel.dart';
import 'package:vehicle_detection_app/pages/input_video.dart';
import 'package:vehicle_detection_app/pages/profile.dart';
import 'package:vehicle_detection_app/pages/setting.dart';

class EditProfile extends StatefulWidget {
  // final LoginUser? user;

  // const EditProfile(this.user);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  int currentIndex = 0;
  bool isLoading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNmberController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 247, 255),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage("${global_imageUrl}"),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
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
                      height: 40,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Name",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
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
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 78, 206, 113))),
                              border: const OutlineInputBorder(),
                              prefixIcon: Container(
                                width: 39,
                                height: 39,
                                margin: const EdgeInsets.only(
                                  top: 8,
                                  bottom: 8,
                                  right: 8,
                                  left: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 78, 206, 113),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Phone Number",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                          controller: _phoneNmberController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 78, 206, 113))),
                              border: const OutlineInputBorder(),
                              prefixIcon: Container(
                                width: 39,
                                height: 39,
                                margin: const EdgeInsets.only(
                                  top: 8,
                                  bottom: 8,
                                  right: 8,
                                  left: 8,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 78, 206, 113),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Icon(
                                  Icons.insert_drive_file,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("City",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                          controller: _cityController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 78, 206, 113))),
                              border: const OutlineInputBorder(),
                              prefixIcon: Container(
                                width: 39,
                                height: 39,
                                margin: const EdgeInsets.only(
                                  top: 8,
                                  bottom: 8,
                                  right: 8,
                                  left: 8,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 78, 206, 113),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Icon(
                                  Icons.location_city,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Description",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
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
                      height: 25,
                    ),
                    (isLoading)
                        ? const SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: Colors.green,
                              strokeWidth: 2,
                            ))
                        : SizedBox(
                            width: MediaQuery.of(context).size.width * 0.93,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 78, 206, 113),
                                ),
                                onPressed: () {
                                  updatingData();
                                },
                                child: const Text(
                                  "Update",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                    const SizedBox(
                      height: 5,
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

  void updatingData() async {
    setState(() {
      isLoading = true;
    });
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    SignUpModel signUpModel = SignUpModel();

    if (_nameController.text.isNotEmpty &&
        _phoneNmberController.text.isNotEmpty &&
        _cityController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      signUpModel.uid = global_uid;
      signUpModel.imageUrl = global_imageUrl;
      signUpModel.name = _nameController.text;
      signUpModel.email = global_email;
      signUpModel.password = global_password;
      signUpModel.confirmPassword = global_confirmPassword;
      signUpModel.city = _cityController.text;
      signUpModel.phoneNumber = _phoneNmberController.text;
      signUpModel.description = _descriptionController.text;

      //Set golbal Varibale
      global_name = _nameController.text;
      global_city = _cityController.text;
      global_phoneNumber = _phoneNmberController.text;
      global_description = _descriptionController.text;


      print(_nameController.text);

      await firebaseFirestore
          .collection("users")
          .doc(global_uid)
          .set(signUpModel.toMap());
      Fluttertoast.showToast(msg: "Updated Successfully ");
      setState(() {
        isLoading = false;
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Setting()));
    }else{
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: "Please enter your requied fields");
    }

    // writing all the values
  }
}
