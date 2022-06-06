import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) => print(ModalRoute.of(context)?.settings.name),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: "Profile",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.airplanemode_active_rounded),
          label: "Flights",
        ),
      ],
    );
  }
}
