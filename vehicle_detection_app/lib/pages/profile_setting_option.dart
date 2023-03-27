import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:vehicle_detection_app/GlobalVaribales/global_variables.dart';
import 'package:vehicle_detection_app/pages/edit_profile.dart';
import 'package:vehicle_detection_app/pages/input_video.dart';
import 'package:vehicle_detection_app/pages/profile.dart';
import 'package:vehicle_detection_app/pages/second_home_page.dart';
import 'package:vehicle_detection_app/pages/setting.dart';

class ProfileSettingOption extends StatefulWidget {
  @override
  State<ProfileSettingOption> createState() => _ProfileSettingOptionState();
}

class _ProfileSettingOptionState extends State<ProfileSettingOption> {
  int currentIndex = 0;

  bool isLoading = false;
  @override
  void initState() {
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
              top: 70,
              left: 16,
              right: 20,
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),

                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 45,
                  backgroundImage: NetworkImage("${global_imageUrl}"),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "${global_name}",
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
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
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProfile()));
                            },
                            child: Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 223, 230, 243)
                                      .withOpacity(0.85),
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        blurRadius: 35,
                                        spreadRadius: 30,
                                        offset: const Offset(3, 3))
                                  ]),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.blueAccent,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.account_box_rounded,
                                color: Color.fromARGB(255, 78, 206, 113),
                                size: 28,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Name",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 18, 22, 24),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 44),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "${global_name}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                )),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.email,
                                color: Color.fromARGB(255, 78, 206, 113),
                                size: 28,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Email",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 18, 22, 24),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 44),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "${global_email}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.phone,
                                color: Color.fromARGB(255, 78, 206, 113),
                                size: 28,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Phone Number",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 18, 22, 24),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 44),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "${global_phoneNumber}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.description,
                                color: Color.fromARGB(255, 78, 206, 113),
                                size: 28,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Description",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 18, 22, 24),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 44),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "${global_description}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                )),
                          ),
                        ],
                      ),
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
                      MaterialPageRoute(builder: (context) => SecondHomePage()));
                },
                child: const Icon(Icons.home)),

            label: 'Home',
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
}
