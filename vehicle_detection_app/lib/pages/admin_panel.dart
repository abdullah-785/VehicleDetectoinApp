import 'package:badges/badges.dart';

import 'package:flutter/material.dart';
import 'package:vehicle_detection_app/pages/notification_page.dart';
import 'package:vehicle_detection_app/pages/user_detail_on_admin_panel.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
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
                Spacer(),
                const Text(
                  "Admin Panel",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Badge(
                    badgeColor: const Color.fromARGB(255, 78, 206, 113),
                    animationType: BadgeAnimationType.slide,
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
                    SizedBox(height: 30,),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          itemCount: 25,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                leading: const Icon(Icons.email),
                                trailing: InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25)
                                        )
                                      ),
                                      backgroundColor: Colors.white,
                                      context: context, 
                                      isScrollControlled: true,
                                      builder: (context){
                                        return Wrap(children:  [
                                          const Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Center(
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 50,
                                                child: Image(
                                                  image: AssetImage("images/logo1.png"), ),
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 5, bottom: 12),
                                            child: Center(child: Text("Abdullah Butt", style: TextStyle(
                                              fontSize: 18, 
                                              fontWeight: FontWeight.bold
                                            ),)),
                                          ),
                                          const ListTile(
                                            leading: Icon(Icons.email, color: Color.fromARGB(255, 78, 206, 113), ),
                                            title: Text("abdbutt2001@gmail.com"),
                                          ),
                                          const ListTile(
                                            leading: Icon(Icons.phone),
                                            title: Text("03317688086"),
                                          ),
                                          const ListTile(
                                            leading: Icon(Icons.location_city_rounded),
                                            title: Text("Sialkot"),
                                          ),
                                          
                                          Padding(
                                            padding: const EdgeInsets.only(top: 20),
                                            child: Center(
                                              child: SizedBox(
                                                width: MediaQuery.of(context).size.width * 0.9,
                                                height: MediaQuery.of(context).size.height * 0.04,
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: Color.fromARGB(255, 78, 206, 113),
                                                  ),
                                                  onPressed: (){
                                                  
                                                }, child: const Text("Delete User"), 
                                                
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 20),
                                            child: Center(child: InkWell(
                                              onTap: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetailOnAdminPanel()));
                                              },
                                              child: const Text("View More", style: TextStyle(
                                                color: Color.fromARGB(255, 78, 206, 113),
                                              ),))),
                                          )
                                        ],);
                                      });
                                  },
                                  child: const Text(
                                    "View",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 15),
                                  ),
                                ),
                                title: Text("User Email $index"));
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}