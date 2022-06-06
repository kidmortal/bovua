import 'package:bovua/services/passagens_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class AutoComplete extends StatelessWidget {
  AutoComplete({Key? key, required this.label}) : super(key: key);

  String label;

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<List<String>>(
      noItemsFoundBuilder: (context) => Padding(
        padding: const EdgeInsets.fromLTRB(5, 15, 0, 15),
        child: Text(
          "Digite 3 ou mais letras",
          style: TextStyle(
              fontSize: 16,
              color: Colors.blue.shade700,
              fontWeight: FontWeight.bold),
        ),
      ),
      debounceDuration: Duration(milliseconds: 500),
      textFieldConfiguration: TextFieldConfiguration(
        decoration: InputDecoration(
          labelText: label,
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
    );
  }
}