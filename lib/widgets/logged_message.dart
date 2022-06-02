import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoggedMessage extends StatelessWidget {
  const LoggedMessage({Key? key}) : super(key: key);

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("you are in"),
        ElevatedButton(
          child: Text("Sign Out"),
          onPressed: signOut,
        ),
      ],
    );
  }
}
