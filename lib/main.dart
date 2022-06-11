import 'package:bovua/config/service_locator.dart';
import 'package:bovua/pages/home_page.dart';
import 'package:bovua/route/route.dart' as route;
import 'package:bovua/services/analytics_service.dart';
import 'package:bovua/services/firebase_messaging_service.dart';
import 'package:bovua/services/global_config_service.dart';
import "package:firebase_core/firebase_core.dart";
import 'firebase_options.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocators();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    FirebaseMessagingService().init();
    GlobalConfigService().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [
        AnalyticsService().getAnalyticsObserver(),
      ],
      initialRoute: HomePage.routeName,
      routes: route.appRoutes,
    );
  }
}
