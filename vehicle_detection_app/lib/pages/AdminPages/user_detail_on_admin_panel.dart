import 'package:badges/badges.dart' as badges;
import 'package:expandable/expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class UserDetailOnAdminPanel extends StatefulWidget {
  UserDetailOnAdminPanel({super.key, required this.uuid});
  String uuid;

  @override
  State<UserDetailOnAdminPanel> createState() => _UserDetailOnAdminPanelState();
}

class _UserDetailOnAdminPanelState extends State<UserDetailOnAdminPanel> {
  //show record from userDetectionRecord
  late DatabaseReference dbRef;

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();

    dbRef = FirebaseDatabase.instance
        .ref()
        .child("userDetectionRecord")
        .child(widget.uuid);
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
                const Spacer(),
                const Text(
                  "Admin Panel",
                  style: TextStyle(
                    fontSize: 24,
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             const NotificationPage()));
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
                      height: 25,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 1,
                      child: FirebaseAnimatedList(
                          query: dbRef,
                          itemBuilder: (context, snapshot, animation, index) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 4, top: 6, bottom: 6),
                                  child: ExpandablePanel(
                                      header: Text(
                                        snapshot
                                            .child(
                                              "dateTime",
                                            )
                                            .value
                                            .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      collapsed: Text(
                                        "Details...",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                      expanded: Column(
                                        children: [
                                          Row(children: [
                                            Text(
                                              "Vehicle Name : ",
                                              style: textStyleOfExpanded(),
                                            ),
                                            Text(snapshot
                                                .child("names")
                                                .value
                                                .toString()),
                                          ]),
                                          Row(
                                            children: [
                                              Text("Location : ",
                                                  style: textStyleOfExpanded()),
                                              Text("Sialkot at Tool Plaza"),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("Date & Time : ",
                                                  style: textStyleOfExpanded()),
                                              Text(snapshot
                                                  .child("dateTime")
                                                  .value
                                                  .toString()),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("Percentage : ",
                                                  style: textStyleOfExpanded()),
                                              Text(snapshot
                                                  .child("percentage")
                                                  .value
                                                  .toString()),
                                            ],
                                          ),
                                          TextButton(
                                              onPressed: () async {
                                                String currentClicking =
                                                    snapshot
                                                        .child("dateTime")
                                                        .value
                                                        .toString();
                                                print(currentClicking);

                                                await dbRef
                                                    .child(currentClicking)
                                                    .remove();

                                                // print(user!.uid);

                                                //Deletion from user credentials

                                                showAlertDialog(context);
                                              },
                                              child: Text("Delete"))
                                        ],
                                      )),
                                ),
                              ),
                            );
                          }),
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
}

TextStyle textStyleOfExpanded() {
  return TextStyle(fontWeight: FontWeight.bold);
}

deleteFromNotification(String uuid, String SelectedDateTime) async {
  //for deleting the record from notification
  late DatabaseReference dbRef2;
  //for deleting the record from notification
  dbRef2 = FirebaseDatabase.instance.ref().child("notification");
  await dbRef2.child(uuid).child(SelectedDateTime).remove();
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () async {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text("Are you sure you want to delete record?"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
