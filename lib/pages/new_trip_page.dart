import 'package:bovua/widgets/bottom_nav_bar.dart';
import 'package:bovua/widgets/new_trip_form.dart';
import 'package:bovua/widgets/page_app_bar.dart';
import 'package:flutter/material.dart';

class NewTripPage extends StatefulWidget {
  const NewTripPage({Key? key}) : super(key: key);

  static const routeName = 'new_trip';

  @override
  State<NewTripPage> createState() => _NewTripPageState();
}

class _NewTripPageState extends State<NewTripPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 500),
              child: NewTripForm(),
            )
          ],
        ),
      ),
    );
  }
}
