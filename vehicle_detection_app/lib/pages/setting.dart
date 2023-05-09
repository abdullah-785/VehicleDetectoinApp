import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:vehicle_detection_app/GlobalVaribales/global_variables.dart';
import 'package:vehicle_detection_app/models/signUpModel.dart';
import 'package:vehicle_detection_app/pages/AdminPages/admin_login.dart';
import 'package:vehicle_detection_app/pages/PolicePages/police_login.dart';
import 'package:vehicle_detection_app/pages/change_password.dart';
import 'package:vehicle_detection_app/pages/second_home_page.dart';
import 'package:vehicle_detection_app/pages/input_video.dart';
import 'package:vehicle_detection_app/pages/language.dart';
import 'package:vehicle_detection_app/pages/login.dart';
import 'package:vehicle_detection_app/pages/notification_page.dart';
import 'package:vehicle_detection_app/pages/privcy_policy.dart';
import 'package:vehicle_detection_app/pages/profile.dart';
import 'package:vehicle_detection_app/pages/profile_setting_option.dart';
import 'package:vehicle_detection_app/pages/term_and_condition.dart';
import 'package:vehicle_detection_app/widgets/bottom_nav_bar.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  int currentIndex = 0;

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
              top: 70,
              left: 16,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios,
                        size: 28.0, color: Color.fromARGB(255, 23, 69, 103))),
                const SizedBox(
                    // width: 50,
                    ),
                const Spacer(),
                const Text(
                  "Setting",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                badges.Badge(
                    badgeColor: const Color.fromARGB(255, 78, 206, 113),
                    // animationType: BadgeAnimationType.slide,
                    badgeContent: const Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Text(
                        "2",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationPage()));
                      },
                      child: const Icon(Icons.notifications,
                          size: 30, color: Color.fromARGB(255, 23, 69, 103)),
                    )),
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
                      height: 50,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 8),
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => SecondHomePage()));
                    //     },
                    //     child: Padding(
                    //       padding: const EdgeInsets.symmetric(
                    //         horizontal: 32,
                    //       ),
                    //       child: Row(
                    //         children: const [
                    //           Icon(
                    //             Icons.home,
                    //             size: 30,
                    //             color: Color.fromARGB(255, 78, 206, 113),
                    //           ),
                    //           SizedBox(
                    //             width: 20,
                    //           ),
                    //           Text(
                    //             "Home Page",
                    //             style: TextStyle(
                    //                 fontSize: 20,
                    //                 fontWeight: FontWeight.w600,
                    //                 color: Colors.grey),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    // ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProfileSettingOption()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.person,
                                size: 30,
                                color: Color.fromARGB(255, 78, 206, 113),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Profile",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChangePassword()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.lock,
                                size: 30,
                                color: Color.fromARGB(255, 78, 206, 113),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Change Password",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Language()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.g_translate,
                                size: 30,
                                color: Color.fromARGB(255, 78, 206, 113),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Language",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PrivacyPolice()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.policy,
                                size: 30,
                                color: Color.fromARGB(255, 78, 206, 113),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Privacy Police",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TermCondition()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.insert_page_break_sharp,
                                size: 30,
                                color: Color.fromARGB(255, 78, 206, 113),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Term & Condition",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 8),
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => AdminLogin()));
                    //     },
                    //     child: Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 32),
                    //       child: Row(
                    //         children: const [
                    //           Icon(
                    //             Icons.admin_panel_settings,
                    //             size: 30,
                    //             color: Color.fromARGB(255, 78, 206, 113),
                    //           ),
                    //           SizedBox(
                    //             width: 20,
                    //           ),
                    //           Text(
                    //             "Switch to Admin",
                    //             style: TextStyle(
                    //                 fontSize: 20,
                    //                 fontWeight: FontWeight.w600,
                    //                 color: Colors.grey),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 8),
                    //   child: GestureDetector(
                    //     onTap: () async {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => PoliceLogin()));
                    //     },
                    //     child: Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 32),
                    //       child: Row(
                    //         children: const [
                    //           Icon(
                    //             Icons.local_police_rounded,
                    //             size: 30,
                    //             color: Color.fromARGB(255, 78, 206, 113),
                    //           ),
                    //           SizedBox(
                    //             width: 20,
                    //           ),
                    //           Text(
                    //             "Switch to Police",
                    //             style: TextStyle(
                    //                 fontSize: 20,
                    //                 fontWeight: FontWeight.w600,
                    //                 color: Colors.grey),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: GestureDetector(
                        onTap: () async {
                          logout(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.logout_outlined,
                                size: 30,
                                color: Color.fromARGB(255, 78, 206, 113),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Logout",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
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
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const Setting() ));
                },
                child: const Icon(Icons.settings)),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondHomePage()));
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

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
  }
}
