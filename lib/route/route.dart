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

Map<String, Widget Function(BuildContext)> appRoutes = {
  homePage: (BuildContext context) => StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return SignInPage();
          }
        },
      ),
  signUpPage: (BuildContext context) => SignUpPage(),
  newTrip: (BuildContext context) => NewTripPage(),
};
