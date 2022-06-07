// Routes names
import 'package:bovua/pages/flights_page.dart';
import 'package:bovua/pages/new_trip_page.dart';
import 'package:bovua/services/global_config_service.dart';
import 'package:bovua/widgets/bottom_nav_bar.dart';
import 'package:bovua/widgets/page_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bovua/pages/home_page.dart';
import 'package:bovua/pages/sign_in_page.dart';
import 'package:bovua/pages/sign_up_page.dart';
import "package:bovua/pages/profile_page.dart";

const String signUpPage = "register";
const String homePage = "home";
const String profilePage = "profile";
const String settingsPage = "settings";
const String newTrip = "new_trip";

Map<String, Widget Function(BuildContext)> appRoutes = {
  homePage: (BuildContext context) => StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PageWithNavBar(Children: HomePage());
          } else {
            return SignInPage();
          }
        },
      ),
  signUpPage: (BuildContext context) => SignUpPage(),
  profilePage: (BuildContext context) =>
      PageWithNavBar(Children: ProfilePage()),
  newTrip: (BuildContext context) => PageWithNavBar(Children: NewTripPage()),
};

class PageWithNavBar extends StatefulWidget {
  PageWithNavBar({Key? key, required this.Children}) : super(key: key);

  final Widget Children;
  @override
  State<PageWithNavBar> createState() => _PageWithNavBarState();
}

class _PageWithNavBarState extends State<PageWithNavBar> {
  int pageIndex = 0;

  final childrens = [
    const HomePage(),
    const ProfilePage(),
    const FlightsPage(),
    const NewTripPage(),
  ];

  navigate(int index) => setState(() => pageIndex = index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PageAppBar(pageName: GlobalConfigService().getAppName()),
        bottomNavigationBar: BottomNavBar(onTap: navigate, index: pageIndex),
        body: Center(
          child: childrens[pageIndex],
        ),
      ),
    );
  }
}
