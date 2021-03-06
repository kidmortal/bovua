// Routes names
import 'package:bovua/config/service_locator.dart';
import 'package:bovua/pages/flights_page.dart';
import 'package:bovua/pages/new_trip_page.dart';
import 'package:bovua/pages/web_page.dart';
import 'package:bovua/services/global_config_service.dart';
import 'package:bovua/stores/page_store.dart';
import 'package:bovua/widgets/bottom_nav_bar.dart';
import 'package:bovua/widgets/page_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bovua/pages/home_page.dart';
import 'package:bovua/pages/sign_in_page.dart';
import 'package:bovua/pages/sign_up_page.dart';
import "package:bovua/pages/profile_page.dart";
import 'package:mobx/mobx.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  HomePage.routeName: (BuildContext context) => StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PageWithNavBar(Children: HomePage());
          } else {
            return SignInPage();
          }
        },
      ),
  SignUpPage.routeName: (BuildContext context) => SignUpPage(),
  NewTripPage.routeName: (BuildContext context) =>
      PageWithNavBar(Children: NewTripPage()),
  WebPage.routeName: (BuildContext context) => WebPage(),
};

class PageWithNavBar extends StatefulWidget {
  PageWithNavBar({Key? key, required this.Children}) : super(key: key);

  final Widget Children;
  @override
  State<PageWithNavBar> createState() => _PageWithNavBarState();
}

class _PageWithNavBarState extends State<PageWithNavBar> {
  final pageStore = getIt<PageStore>();
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    // define an observable to watch, and the callback for when that observable changes
    reaction(
      (_) => pageStore.page,
      (int page) => setState(() => pageIndex = page),
    );
  }

  final childrens = [
    const HomePage(),
    const ProfilePage(),
    const FlightsPage(),
    const NewTripPage(),
  ];

  navigate(int index) => pageStore.setPage(index);

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
