import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TripLabel extends StatelessWidget {
  TripLabel(
      {Key? key,
      required this.label,
      required this.description,
      this.highLight})
      : super(key: key);

  String label;
  String description;
  bool? highLight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        Text(description.length > 20
            ? description.substring(0, 20) + "..."
            : description)
      ],
    );
  }
}
