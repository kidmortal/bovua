import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:bovua/route/route.dart' as route;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: route.controller,
      initialRoute: route.signInPage,
    );
  }
}
