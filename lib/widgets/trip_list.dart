import 'package:bovua/models/trip.dart';
import 'package:bovua/widgets/trip_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TripList extends StatelessWidget {
  TripList({
    Key? key,
    this.trips,
    required this.onDismissed,
  }) : super(key: key);

  FirestoreTrips? trips;
  final Function(FirestoreTrip trip) onDismissed;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trips!.trips?.length,
      itemBuilder: (context, index) {
        final trip = trips!.trips![index];
        return Dismissible(
          direction: DismissDirection.startToEnd,
          background: Container(
            color: Colors.red,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    Text(
                      "Delete Trip",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
          key: Key(trip.fromIata ?? ""),
          child: TripGroup(trip: trip),
          onDismissed: (direction) => onDismissed(trip),
        );
      },
    );
  }
}
