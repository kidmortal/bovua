import 'package:bovua/models/trip.dart';
import 'package:flutter/material.dart';

class TripGroup extends StatelessWidget {
  TripGroup({Key? key, required this.trip}) : super(key: key);

  Trip trip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Group(
            airport: trip.from,
            iata: trip.fromIata,
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.blue.shade800,
            size: 32,
          ),
          Group(
            airport: trip.to,
            iata: trip.toIata,
          ),
        ],
      ),
    );
  }
}

class Group extends StatelessWidget {
  Group({Key? key, this.airport, this.iata}) : super(key: key);

  String? airport;
  String? iata;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            child: Text(
              airport ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade700,
              ),
            ),
            constraints: BoxConstraints(maxWidth: 150)),
        SizedBox(height: 12),
        Text(
          iata ?? "",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade600),
        )
      ],
    );
  }
}
