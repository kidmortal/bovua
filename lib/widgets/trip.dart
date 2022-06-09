import 'package:bovua/models/passagem.dart';
import 'package:bovua/pages/web_page.dart';
import 'package:bovua/utils/date.dart';
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
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.today),
                      Text(Utils.isoStringToDate(trip.departure_date)),
                    ],
                  ),
                  Icon(Icons.arrow_forward),
                  SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        Icon(Icons.today),
                        Text(Utils.isoStringToDate(trip.return_date)),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.flight_takeoff),
                      SizedBox(width: 5),
                      Text(trip.lowest_company ?? ""),
                    ],
                  ),
                  SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        Icon(Icons.airplane_ticket_rounded),
                        SizedBox(width: 5),
                        Text("R\$" + trip.total.toString()),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(width: 10),
        Icon(Icons.arrow_forward_ios),
      ]),
    );
  }
}
