import 'package:bovua/models/passagem.dart';
import 'package:bovua/pages/web_page.dart';
import 'package:flutter/material.dart';
import 'package:bovua/route/route.dart' as routes;

class Trip extends StatelessWidget {
  Trip({Key? key, required this.trip}) : super(key: key);

  PassagemTrip trip;

  redirectToWebPage(BuildContext c) {
    if (trip.search_url == null) return;
    String url =
        "https://www.passagenspromo.com.br" + trip.search_url! + "1/0/0/Y";
    Navigator.pushNamed(c, WebPage.routeName, arguments: {"search_url": url});
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => redirectToWebPage(context),
        child: Text(trip.search_url ?? ""));
  }
}
