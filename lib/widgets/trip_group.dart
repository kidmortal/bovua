import 'package:bovua/models/passagem.dart';
import 'package:bovua/models/trip.dart';
import 'package:bovua/services/passagem_service.dart';
import 'package:bovua/widgets/trip.dart';
import 'package:flutter/material.dart';

class TripGroup extends StatefulWidget {
  TripGroup({Key? key, required this.trip}) : super(key: key);
  FirestoreTrip trip;

  @override
  State<TripGroup> createState() => _TripGroupState();
}

class _TripGroupState extends State<TripGroup> {
  int flightCount = 0;
  List<PassagemTrip> flights = [];

  onGroupPressed() async {}

  onSearchPressed() async {
    final flights = await PassagemService.getFlights(
        widget.trip.fromIata!, widget.trip.toIata!);
    setState(() {
      this.flights = flights;
      this.flightCount = flights.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onGroupPressed,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                flightCount.toString(),
                style: TextStyle(fontSize: 24),
              ),
              Group(
                airport: widget.trip.from,
                iata: widget.trip.fromIata,
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.blue.shade800,
                size: 32,
              ),
              Group(
                airport: widget.trip.to,
                iata: widget.trip.toIata,
              ),
              IconButton(
                onPressed: onSearchPressed,
                color: Colors.blue,
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          FlightList(trips: flights),
        ]),
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
        SizedBox(
          width: 100,
          child: Text(
            airport ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade700,
            ),
          ),
        ),
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

class FlightList extends StatelessWidget {
  FlightList({Key? key, required this.trips}) : super(key: key);

  List<PassagemTrip> trips;

  @override
  Widget build(BuildContext context) {
    return trips.isEmpty
        ? Center(child: Text('No flights'))
        : ListView.builder(
            shrinkWrap: true,
            itemCount: trips.length,
            itemBuilder: (context, index) {
              final trip = trips[index];
              return Trip(trip: trip);
            });
  }
}
