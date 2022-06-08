import 'package:bovua/models/trip.dart';
import 'package:bovua/services/firestore_service.dart';
import 'package:bovua/services/suggestion_service.dart';
import 'package:bovua/widgets/auto_complete.dart';
import 'package:bovua/widgets/trip_label.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bovua/route/route.dart' as route;

class NewTripForm extends StatefulWidget {
  const NewTripForm({Key? key}) : super(key: key);

  @override
  State<NewTripForm> createState() => _NewTripFormState();
}

class _NewTripFormState extends State<NewTripForm> {
  FirestoreTrips? _trips;
  String tripOrigin = "Select Origin";
  String tripOriginIata = "";
  String tripDestination = "Select destination";
  String tripDestinationIata = "";

  Future createTrip() async {
    final trip = FirestoreTrip(
      from: tripOrigin,
      fromIata: tripOriginIata,
      to: tripDestination,
      toIata: tripDestinationIata,
    );
    if (FirebaseAuth.instance.currentUser != null) {
      await FirestoreService()
          .addTripToUser(FirebaseAuth.instance.currentUser?.uid ?? "", trip);
      Navigator.pushNamed(context, route.homePage);
    }
  }

  selectOption(String iata, String description) {
    if (tripOriginIata == "") {
      setState(() {
        tripOrigin = description;
        tripOriginIata = iata;
      });
    } else {
      setState(() {
        tripDestination = description;
        tripDestinationIata = iata;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TripLabel(label: tripOriginIata, description: tripOrigin),
            Icon(Icons.arrow_forward),
            TripLabel(label: tripDestinationIata, description: tripDestination),
          ],
        ),
        const SizedBox(height: 20),
        AutoComplete(
          label: "Origem",
          onSelected: selectOption,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: createTrip,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Create Trip",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
