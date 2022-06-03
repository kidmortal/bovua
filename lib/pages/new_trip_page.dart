import 'package:bovua/models/passagem.dart';
import 'package:bovua/models/trip.dart';
import 'package:bovua/services/firestore_service.dart';
import 'package:bovua/services/passagens_service.dart';
import 'package:bovua/widgets/bottom_nav_bar.dart';
import 'package:bovua/widgets/page_app_bar.dart';
import 'package:bovua/widgets/trip_group.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class NewTripPage extends StatefulWidget {
  const NewTripPage({Key? key}) : super(key: key);

  @override
  State<NewTripPage> createState() => _NewTripPageState();
}

class _NewTripPageState extends State<NewTripPage> {
  Trips? _trips;

  Future createTrip() async {
    var Response = await PassagensService.getSuggestions("Guaru");
    print(Response[0][1]);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PageAppBar(pageName: "New Trip"),
        bottomNavigationBar: const BottomNavBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TypeAheadField<List<String>>(
                debounceDuration: Duration(milliseconds: 500),
                textFieldConfiguration: const TextFieldConfiguration(
                  decoration: InputDecoration(
                    labelText: "Origin",
                    border: OutlineInputBorder(),
                  ),
                ),
                suggestionsCallback: PassagensService.getSuggestions,
                itemBuilder: (context, suggestion) {
                  final List<String> suggest = suggestion;
                  return ListTile(
                    title: Text(suggest[1]),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  print(suggestion);
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Icon(Icons.arrow_downward),
              ),
              TypeAheadField<List<String>>(
                debounceDuration: Duration(milliseconds: 500),
                textFieldConfiguration: const TextFieldConfiguration(
                  decoration: InputDecoration(
                    labelText: "Destination",
                    border: OutlineInputBorder(),
                  ),
                ),
                suggestionsCallback: PassagensService.getSuggestions,
                itemBuilder: (context, suggestion) {
                  final List<String> suggest = suggestion;
                  return ListTile(
                    title: Text(suggest[1]),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  print(suggestion);
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: createTrip,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Create Trip",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
