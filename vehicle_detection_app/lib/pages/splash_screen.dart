import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vehicle_detection_app/pages/first_home_page.dart';
import 'package:vehicle_detection_app/pages/login.dart';


class Splash extends StatefulWidget {
  @override
  VideoState createState() => VideoState();
}



class VideoState extends State<Splash> with SingleTickerProviderStateMixin{

  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => FirstHomePage()));
  }

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 247, 255),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
           Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Text("Welcome To Vehicle Detection System", style: TextStyle(
                  color: Color.fromARGB(255, 78, 206, 113),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
              )

            ],),
           Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
               Image.asset(
                'images/logo1.png',
                width: animation.value * 200,
                height: animation.value * 200,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
