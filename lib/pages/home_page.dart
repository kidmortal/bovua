import 'package:bovua/models/trip.dart';
import 'package:bovua/services/firestore_service.dart';
import 'package:bovua/widgets/bottom_nav_bar.dart';
import 'package:bovua/widgets/page_app_bar.dart';
import 'package:bovua/widgets/trip_group.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Trips? _trips;

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future getData() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      final trips = await FirestoreService().getUserTrips(userId);
      setState(() {
        _trips = trips;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PageAppBar(pageName: "Home"),
      bottomNavigationBar: const BottomNavBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: getData,
                  child: Text("Get My Trips"),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, "new_trip"),
                  child: Text("Add New Trip"),
                ),
              ],
            ),
          ),
          if (_trips != null)
            Expanded(
              child: ListView.builder(
                itemCount: _trips!.trips?.length,
                itemBuilder: (context, index) {
                  final trip = _trips!.trips![index];
                  return TripGroup(trip: trip);
                },
              ),
            ),
        ],
      ),
    );
  }
}
