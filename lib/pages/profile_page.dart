import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Profile Page"),
        Text(FirebaseAuth.instance.currentUser?.email ?? "No Email"),
        Text(FirebaseAuth.instance.currentUser?.uid ?? "No Id"),
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(FirebaseAuth.instance.currentUser?.photoURL ??
                  "https://cdn.discordapp.com/emojis/562250988698861578.webp"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
