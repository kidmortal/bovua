import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PageAppBar extends StatelessWidget with PreferredSizeWidget {
  PageAppBar({Key? key, required this.pageName}) : super(key: key);

  String pageName;

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(pageName),
      actions: [
        IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: signOut,
        ),
      ],
    );
  }
}
