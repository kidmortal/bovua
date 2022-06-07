import 'package:bovua/models/trip.dart';
import 'package:bovua/services/firestore_service.dart';
import 'package:bovua/services/global_config_service.dart';
import 'package:bovua/widgets/bottom_nav_bar.dart';
import 'package:bovua/widgets/page_app_bar.dart';
import 'package:bovua/widgets/trip_group.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FlightsPage extends StatefulWidget {
  const FlightsPage({Key? key}) : super(key: key);

  @override
  State<FlightsPage> createState() => _FlightsPageState();
}

class _FlightsPageState extends State<FlightsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Flights Page"),
      ],
    );
  }
}
