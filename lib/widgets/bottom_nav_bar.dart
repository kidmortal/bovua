import 'package:bovua/services/global_config_service.dart';
import 'package:bovua/utils/colors.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key, required this.index, required this.onTap})
      : super(key: key);
  final int index;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: index,
      type: BottomNavigationBarType.fixed,
      backgroundColor:
          hexToColor(GlobalConfigService().getBottomNavBackgroundColor()),
      selectedItemColor:
          hexToColor(GlobalConfigService().getBottomNavIconColors()),
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
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: "Add",
        ),
      ],
    );
  }
}
