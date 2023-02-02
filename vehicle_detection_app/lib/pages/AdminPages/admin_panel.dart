import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_detection_app/GlobalVaribales/admin_global_variables.dart';
import 'package:vehicle_detection_app/models/signUpModel.dart';
import 'package:vehicle_detection_app/pages/AdminPages/admin_change_password.dart';
import 'package:vehicle_detection_app/pages/notification_page.dart';
import 'package:vehicle_detection_app/pages/setting.dart';
import 'package:vehicle_detection_app/pages/user_detail_on_admin_panel.dart';


class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {

  // SignUpModel loggedInUser = new SignUpModel();
  // User? user = FirebaseAuth.instance
  // DatabaseReference
  final _db = FirebaseFirestore.instance;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // FirebaseFirestore.instance
    //     .collection("users")
    //     .doc()
    //     .get()
    //     .then((value) {
    //   loggedInUser = SignUpModel.fromMap(value.data());
    //   setState(() {});
    // });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Admin Panel"),
      // backgroundColor: const Color.fromARGB(255, 243, 247, 255),  
      // ),
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
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap:() {
                    // Scaffold.openDrawer();
                    Scaffold.of(context).openDrawer();
                  },
                  child: Icon(Icons.menu,)),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.25,),
                const Text(
                  "Admin Panel",
                  style: TextStyle(
                    fontSize: 24,
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
                      height: 30,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          itemCount: 25,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                leading: const Icon(
                                  Icons.email,
                                  color: Color.fromARGB(255, 78, 206, 113),
                                ),
                                trailing: InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(25))),
                                        backgroundColor: Colors.white,
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) {
                                          return Wrap(
                                            children: [
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                child: Center(
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    radius: 50,
                                                    child: Image(
                                                      image: AssetImage(
                                                          "images/logo1.png"),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5, bottom: 12),
                                                child: Center(
                                                    child: Text(
                                                  "Abdullah Butt",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                              ),
                                              const ListTile(
                                                leading: Icon(
                                                  Icons.email,
                                                  color: Color.fromARGB(
                                                      255, 78, 206, 113),
                                                ),
                                                title: Text(
                                                    "abdbutt2001@gmail.com",
                                                    
                                                    ),
                                              ),
                                              const ListTile(
                                                leading: Icon(Icons.phone, color: Color.fromARGB(
                                                      255, 78, 206, 113),),
                                                title: Text("03317688086"),
                                              ),
                                              const ListTile(
                                                leading: Icon(Icons
                                                    .location_city_rounded, color: Color.fromARGB(
                                                      255, 78, 206, 113),),
                                                title: Text("Sialkot"),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: Center(
                                                  child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.04,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Color.fromARGB(255,
                                                                78, 206, 113),
                                                      ),
                                                      onPressed: () {},
                                                      child: const Text(
                                                          "Delete User"),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              
                                              Padding(
                                                padding: const EdgeInsets.only(top: 5,
                                                    bottom: 20),
                                                child: Center(
                                                    child: InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          UserDetailOnAdminPanel()));
                                                        },
                                                        child: const Text(
                                                          "View More",
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
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
                                  child: const Text(
                                    "View",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 15),
                                  ),
                                ),
                                title: Text("abdbutt2001@gmail.com"));
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
                      image: NetworkImage(
                          "${admin_global_imageUrl}"),
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
          SizedBox(height: 30,),
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminChangePassword()));
            },
          ),
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()));
            },
          ),
          
        ],
      ),
    );
  }

  TextStyle listTextStyle() => TextStyle(
  fontSize: 18, 
  fontWeight: FontWeight.bold,
  color: Colors.grey
  );


  // Future<List<SignUpModel>> allUsers() async{
  //   final snapshot = _db.collection("users").get("email");
  //   // final userData = SignUpModel.fromSnapshot(e).toList();
  //   final userData = snapshot.docs!.map((e) => SignUpModel.fromSnapshot(e)).toList();
  //   return userData;
  // }
}








