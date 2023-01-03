import 'package:flutter/material.dart';
import 'package:vehicle_detection_app/pages/change_password.dart';
import 'package:vehicle_detection_app/pages/first_home_page.dart';
import 'package:vehicle_detection_app/pages/input_video.dart';
import 'package:vehicle_detection_app/pages/login.dart';
import 'package:vehicle_detection_app/pages/notification_page.dart';
import 'package:vehicle_detection_app/pages/profile.dart';
import 'package:vehicle_detection_app/pages/profile_setting_option.dart';
import 'package:vehicle_detection_app/pages/setting.dart';
import 'package:vehicle_detection_app/pages/sign_up.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FirstHomePage();
  }
}