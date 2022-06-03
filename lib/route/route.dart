// Routes names
import 'package:bovua/pages/new_trip_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bovua/pages/home_page.dart';
import 'package:bovua/pages/sign_in_page.dart';
import 'package:bovua/pages/sign_up_page.dart';

const String signUpPage = "register";
const String homePage = "home";
const String settingsPage = "settings";
const String newTrip = "new_trip";

// Control page flow

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(
          builder: (context) => StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return HomePage();
                  } else {
                    return SignInPage();
                  }
                },
              ));
    case signUpPage:
      return MaterialPageRoute(builder: (context) => SignUpPage());
    case newTrip:
      return MaterialPageRoute(builder: (context) => NewTripPage());
    default:
      throw ("This shouldnt happen");
  }
}
