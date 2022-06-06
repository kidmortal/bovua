import 'package:bovua/route/route.dart' as route;
import 'package:bovua/services/analytics_service.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [
        AnalyticsService().getAnalyticsObserver(),
      ],
      initialRoute: route.homePage,
      routes: route.appRoutes,
    );
  }
}
