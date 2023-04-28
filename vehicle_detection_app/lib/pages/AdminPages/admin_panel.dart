import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_detection_app/GlobalVaribales/admin_global_variables.dart';
import 'package:vehicle_detection_app/models/signUpModel.dart';
import 'package:vehicle_detection_app/pages/AdminPages/admin_change_password.dart';
import 'package:vehicle_detection_app/pages/notification_page.dart';
import 'package:vehicle_detection_app/pages/setting.dart';
import 'package:vehicle_detection_app/pages/AdminPages/user_detail_on_admin_panel.dart';
import 'package:firebase_admin/firebase_admin.dart';
import 'dart:io';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  late DatabaseReference dbRef;
  late String uidForDeleteAccount;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('users');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Panel"),
        backgroundColor: const Color.fromARGB(255, 78, 206, 113),
      ),
      backgroundColor: const Color.fromARGB(255, 243, 247, 255),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 1,
                      width: MediaQuery.of(context).size.width * 1,
                      child: FirebaseAnimatedList(
                          query: dbRef,
                          itemBuilder: (context, snapshot, animation, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Card(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(snapshot
                                            .child('image')
                                            .value
                                            .toString()),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(snapshot
                                        .child('email')
                                        .value
                                        .toString()),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: InkWell(
                                          onTap: () {
                                            uidForDeleteAccount = snapshot
                                                .child('uid')
                                                .value
                                                .toString();
                                            showModalBottomSheet(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        25))),
                                                backgroundColor: Colors.white,
                                                context: context,
                                                isScrollControlled: true,
                                                builder: (context) {
                                                  return Wrap(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10),
                                                        child: Center(
                                                          child: CircleAvatar(
                                                            backgroundColor:
                                                                Colors.white,
                                                            radius: 50,
                                                            backgroundImage:
                                                                NetworkImage(snapshot
                                                                    .child(
                                                                        'image')
                                                                    .value
                                                                    .toString()),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 5,
                                                                bottom: 12),
                                                        child: Center(
                                                            child: Text(
                                                          snapshot
                                                              .child('name')
                                                              .value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                      ),
                                                      ListTile(
                                                        leading: Icon(
                                                          Icons.email,
                                                          color: Color.fromARGB(
                                                              255,
                                                              78,
                                                              206,
                                                              113),
                                                        ),
                                                        title: Text(
                                                          snapshot
                                                              .child('email')
                                                              .value
                                                              .toString(),
                                                        ),
                                                      ),
                                                      ListTile(
                                                        leading: Icon(
                                                          Icons.phone,
                                                          color: Color.fromARGB(
                                                              255,
                                                              78,
                                                              206,
                                                              113),
                                                        ),
                                                        title: Text(snapshot
                                                            .child(
                                                                'phoneNumber')
                                                            .value
                                                            .toString()),
                                                      ),
                                                      ListTile(
                                                        leading: Icon(
                                                          Icons
                                                              .location_city_rounded,
                                                          color: Color.fromARGB(
                                                              255,
                                                              78,
                                                              206,
                                                              113),
                                                        ),
                                                        title: Text(snapshot
                                                            .child('city')
                                                            .value
                                                            .toString()),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 20),
                                                        child: Center(
                                                          child: SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.9,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.04,
                                                            child:
                                                                ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Color.fromARGB(
                                                                        255,
                                                                        78,
                                                                        206,
                                                                        113),
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                // Deleting from firestore
                                                                await FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        'users')
                                                                    .doc(
                                                                        uidForDeleteAccount)
                                                                    .delete();
                                                                // Deleting from realtime database
                                                                await dbRef
                                                                    .child(
                                                                        uidForDeleteAccount)
                                                                    .remove();
                                                                //Deletion from user credentials
                                                                print(
                                                                    uidForDeleteAccount);
                                                              },
                                                              child: const Text(
                                                                  "Delete User"),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 5,
                                                                bottom: 20),
                                                        child: Center(
                                                            child: InkWell(
                                                                onTap: () {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              UserDetailOnAdminPanel(uuid: uidForDeleteAccount)));
                                                                },
                                                                child:
                                                                    const Text(
                                                                  "View More",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            78,
                                                                            206,
                                                                            113),
                                                                  ),
                                                                ))),
                                                      )
                                                    ],
                                                  );
                                                });
                                          },
                                          child: Text(
                                            "View",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 78, 206, 113)),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: DrawerMethod(context),
    );
  }

  Drawer DrawerMethod(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 243, 247, 255),
      child: Column(
        children: [
          Container(
            color: Color.fromARGB(255, 78, 206, 113),
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage("${admin_global_imageUrl}"),
                    ),
                  ),
                ),
                Text(
                  "${admin_global_name}",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "${admin_global_email}",
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            leading: const Icon(
              Icons.lock,
              size: 28,
              color: Color.fromARGB(255, 78, 206, 113),
            ),
            title: Text(
              'Change Password',
              style: listTextStyle(),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdminChangePassword()));
            },
          ),
          // ListTile(
          //   leading: const Icon(
          //     Icons.switch_access_shortcut,
          //     size: 28,
          //     color: Color.fromARGB(255, 78, 206, 113),
          //   ),
          //   title: Text(
          //     'Manage Home',
          //     style: listTextStyle(),
          //   ),
          //   onTap: () {
          //     // logout(context);
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (context) => Setting()));
          //   },
          // ),
          ListTile(
            leading: const Icon(
              Icons.switch_access_shortcut,
              size: 28,
              color: Color.fromARGB(255, 78, 206, 113),
            ),
            title: Text(
              'Switch to User',
              style: listTextStyle(),
            ),
            onTap: () {
              // logout(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Setting()));
            },
          ),
        ],
      ),
    );
  }

  TextStyle listTextStyle() =>
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey);
}
