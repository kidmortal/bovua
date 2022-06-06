import 'package:bovua/widgets/bottom_nav_bar.dart';
import 'package:bovua/widgets/new_trip_form.dart';
import 'package:bovua/widgets/page_app_bar.dart';
import 'package:flutter/material.dart';

class NewTripPage extends StatefulWidget {
  const NewTripPage({Key? key}) : super(key: key);

  @override
  State<NewTripPage> createState() => _NewTripPageState();
}

class _NewTripPageState extends State<NewTripPage> {
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
        ),
      ),
    );
  }
}
