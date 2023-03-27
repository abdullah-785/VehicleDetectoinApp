import 'package:flutter/material.dart';
import 'package:vehicle_detection_app/pages/PolicePages/police_admin_panel.dart';
import 'package:vehicle_detection_app/pages/PolicePages/police_login.dart';
import 'package:vehicle_detection_app/pages/change_password.dart';
import 'package:vehicle_detection_app/pages/first_home_page.dart';
import 'package:vehicle_detection_app/pages/input_video.dart';
import 'package:vehicle_detection_app/pages/login.dart';
import 'package:vehicle_detection_app/pages/notification_page.dart';
import 'package:vehicle_detection_app/pages/opt_verification.dart';
import 'package:vehicle_detection_app/pages/profile.dart';
import 'package:vehicle_detection_app/pages/profile_setting_option.dart';
import 'package:vehicle_detection_app/pages/setting.dart';
import 'package:vehicle_detection_app/pages/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:vehicle_detection_app/pages/splash_screen.dart';
import 'package:vehicle_detection_app/widgets/bottom_nav_bar.dart';

// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: MyApp(),
//   ));
// }

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MaterialApp(
    // theme: ThemeData(fontFamily: 'Releway'),
    debugShowCheckedModeBanner: false,
    home: MyApp(),

    // initialRoute: '/',
    // routes: {
    //   '/': (context) => DetailPage()
    // },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Splash();
  }
}
