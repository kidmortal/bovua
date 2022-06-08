import 'package:bovua/models/trip.dart';
import 'package:bovua/services/firestore_service.dart';
import 'package:bovua/services/global_config_service.dart';
import 'package:bovua/widgets/bottom_nav_bar.dart';
import 'package:bovua/widgets/page_app_bar.dart';
import 'package:bovua/widgets/trip_group.dart';
import 'package:bovua/widgets/trip_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirestoreTrips? _trips;

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future getData() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      final trips = await FirestoreService().getUserTrips(userId);
      final notEmpty = trips.trips?.isNotEmpty ?? false;
      if (notEmpty) {
        setState(() => _trips = trips);
      }
    }
  }

  deleteTrip(FirestoreTrip trip) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      await FirestoreService().deleteTrip(userId, trip);
      await getData();
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (_trips != null)
            Expanded(
              child: TripList(
                trips: _trips,
                onDismissed: (trip) => deleteTrip(trip),
              ),
            ),
        ],
      ),
    );
  }
}
