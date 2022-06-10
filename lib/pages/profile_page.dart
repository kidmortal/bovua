import 'package:bovua/widgets/youtube_video.dart';
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
    String userId = FirebaseAuth.instance.currentUser?.uid ?? "No Id";
    String userEmail = FirebaseAuth.instance.currentUser?.email ?? "No Email";
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(FirebaseAuth
                            .instance.currentUser?.photoURL ??
                        "https://cdn.discordapp.com/emojis/562250988698861578.webp"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Text("User ID: $userId"),
                  SizedBox(height: 20),
                  Text("Email: $userEmail"),
                ],
              )
            ],
          ),
        ),
        YoutubeVideo()
      ],
    );
  }
}
