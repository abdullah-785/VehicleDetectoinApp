import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_detection_app/pages/setting.dart';
import 'package:expandable/expandable.dart';

class PolicePanel extends StatefulWidget {
  const PolicePanel({super.key});

  @override
  State<PolicePanel> createState() => _PolicePanelState();
}

class _PolicePanelState extends State<PolicePanel> {
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
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: ((context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpandablePanel(
                              header: Text(
                                "App Detecting something",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              collapsed: Text(
                                "More details...",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                              expanded: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Vehicle Name : ",
                                        style: textStyleOfExpanded(),
                                      ),
                                      Text("Truck"),
                                    ],
                                  ),
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
                                      Text("10 March 2023 at 10:00 AM"),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      );
                    })),
              ),
            ),
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
