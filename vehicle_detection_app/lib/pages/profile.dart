import 'package:flutter/material.dart';
import 'package:vehicle_detection_app/pages/input_video.dart';
import 'package:vehicle_detection_app/pages/setting.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 247, 255),
      body: Column(
        children: [
          const SizedBox(height: 60,),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
    
                  ),
                  child: Image(image: AssetImage("images/logo1.png"), width: 100, height: 100,),
                ),
              ),
              const SizedBox(width: 35),
              Column(
                children: const [
                  Text("25", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 23, 69, 103)
    
                  ),),
                  Text("Posts", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 23, 69, 103)
    
                  ),),
                ],
              ),
    
              const SizedBox(width: 20,),
              Column(
                children: const [
                  Text("10", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 23, 69, 103)
    
                  ),),
                  Text("Videos", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 23, 69, 103)
                  ),),
                ],
              ),
    
              const SizedBox(width: 20,),
              Column(
                children: const [
                  Text("15", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 23, 69, 103)
    
                  ),),
                  Text("Photes", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 23, 69, 103)
                  ),),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5,),
          const Padding(
            padding: EdgeInsets.only(left: 14),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("Abdullah Butt", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 23, 69, 103)
              ),),
            ),
          ),
    
          const SizedBox(height: 5,),
           Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit.", style: TextStyle(
                  fontSize: 16,
                  decorationThickness: 200,
                  color: Color.fromARGB(255, 23, 69, 103)
                ),),
              ),
            ),
          ),
          SizedBox(height: 20,),
          SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  // height: 30,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // primary: const Color.fromARGB(255, 78, 206, 113),
                        // onPrimary: Colors.white,
                        backgroundColor: Color.fromARGB(255, 78, 206, 113),
                      ),
                      onPressed: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
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
                      MaterialPageRoute(builder: (context) => const Setting() ));
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
                        builder: (context) => InputVideo()));
              },
              child: const Icon(Icons.add_a_photo)
            ),
            label: 'Add',
          ),
          
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  //Same page
                },
                child: const Icon(Icons.account_circle)),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}