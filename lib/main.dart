import 'package:bovua/services/analytics_service.dart';
import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:bovua/route/route.dart' as route;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB09MwCdq896v2qghvdJ4Qa_gayZpUk4No",
      appId: "1:37275494111:web:b256f8f786fdb1eb492b6a",
      messagingSenderId: "37275494111",
      projectId: "bovua-9109a",
    ),
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: route.controller,
      navigatorObservers: [
        AnalyticsService().getAnalyticsObserver(),
      ],
      initialRoute: route.homePage,
    );
  }
}
