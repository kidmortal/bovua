import 'package:bovua/models/trip.dart';
import 'package:bovua/services/firestore_service.dart';
import 'package:bovua/services/global_config_service.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (_trips != null)
          Expanded(
            child: ListView.builder(
              itemCount: _trips!.trips?.length,
              itemBuilder: (context, index) {
                final trip = _trips!.trips![index];
                return Dismissible(
                  background: Container(
                    color: Colors.red,
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  key: Key(trip.fromIata ?? ""),
                  child: TripGroup(trip: trip),
                  onDismissed: (direction) {
                    // Remove the item from the data source.
                    setState(() {
                      _trips?.trips?.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
      ],
    );
  }
}
