import 'package:bovua/models/trip.dart';
import 'package:bovua/services/passagens_service.dart';
import 'package:bovua/widgets/auto_complete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewTripForm extends StatefulWidget {
  const NewTripForm({Key? key}) : super(key: key);

  @override
  State<NewTripForm> createState() => _NewTripFormState();
}

class _NewTripFormState extends State<NewTripForm> {
  Trips? _trips;

  Future createTrip() async {
    var Response = await PassagensService.getSuggestions("Guaru");
    print(Response[0][1]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AutoComplete(
          label: "Origem",
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Icon(Icons.arrow_downward),
        ),
        AutoComplete(
          label: "Destino",
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
