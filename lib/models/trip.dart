import "package:json_annotation/json_annotation.dart";

part 'trip.g.dart';

@JsonSerializable()
class Trip {
  String? from;
  String? fromIata;
  String? to;
  String? toIata;

  Trip({this.from = "", this.to = "", this.fromIata = "", this.toIata = ""});
  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
  Map<String, dynamic> toJson() => _$TripToJson(this);
}

class Trips {
  List<Trip>? trips;

  Trips({this.trips});

  Trips.fromJson(Map<String, dynamic> json) {
    if (json['trips'] != null) {
      trips = <Trip>[];
      json['trips'].forEach((v) {
        trips!.add(new Trip.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trips != null) {
      data['trips'] = this.trips!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
