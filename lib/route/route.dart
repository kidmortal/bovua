// Routes names
import 'package:flutter/material.dart';
import 'package:bovua/pages/home_page.dart';
import 'package:bovua/pages/sign_in_page.dart';
import 'package:bovua/pages/sign_up_page.dart';

const String signInPage = "login";
const String signUpPage = "register";
const String homePage = "home";
const String settingsPage = "settings";

// Control page flow

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(builder: (context) => HomePage());
    case signInPage:
      return MaterialPageRoute(builder: (context) => SignInPage());
    case signUpPage:
      return MaterialPageRoute(builder: (context) => SignUpPage());
    default:
      throw ("This shouldnt happen");
  }
}
