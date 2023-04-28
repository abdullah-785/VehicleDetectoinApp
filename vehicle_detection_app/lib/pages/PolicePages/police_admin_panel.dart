import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_detection_app/pages/setting.dart';
import 'package:expandable/expandable.dart';

class PolicePanel extends StatefulWidget {
  const PolicePanel({super.key});

  @override
  State<PolicePanel> createState() => _PolicePanelState();
}

class _PolicePanelState extends State<PolicePanel> {
  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('notification');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Police"),
        backgroundColor: const Color.fromARGB(255, 78, 206, 113),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
                onTap: () {
                  logout(context);
                },
                child: Icon(
                  Icons.logout,
                  size: 25,
                )),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 243, 247, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
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
                                    ],
                                  )),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // The logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Setting()));
  }

  TextStyle textStyleOfExpanded() {
    return TextStyle(fontWeight: FontWeight.bold);
  }
}
