import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


class CustomeBottomNavBar extends StatefulWidget {
  const CustomeBottomNavBar({super.key});

  @override
  State<CustomeBottomNavBar> createState() => _CustomeBottomNavBarState();
}

class _CustomeBottomNavBarState extends State<CustomeBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        context, screens: _buildScren(),
        items: _navBarItem(),
      );
  }


  List<Widget> _buildScren(){
    return [
      Text("Setting"),
      Text("Upload"),
      Text("Profile")
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItem(){
    return [
      PersistentBottomNavBarItem(icon: Icon(Icons.settings)),
      PersistentBottomNavBarItem(icon: Icon(Icons.add_a_photo)),
      PersistentBottomNavBarItem(icon: Icon(Icons.supervised_user_circle)),
    ];
  }


}

