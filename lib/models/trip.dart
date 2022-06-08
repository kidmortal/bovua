import "package:json_annotation/json_annotation.dart";

part 'trip.g.dart';

@JsonSerializable()
class FirestoreTrip {
  String? from;
  String? fromIata;
  String? to;
  String? toIata;

  FirestoreTrip(
      {this.from = "", this.to = "", this.fromIata = "", this.toIata = ""});
  factory FirestoreTrip.fromJson(Map<String, dynamic> json) =>
      _$FirestoreTripFromJson(json);
  Map<String, dynamic> toJson() => _$FirestoreTripToJson(this);
}

@JsonSerializable()
class FirestoreTrips {
  List<FirestoreTrip>? trips;

  FirestoreTrips({this.trips});
  factory FirestoreTrips.fromJson(Map<String, dynamic> json) =>
      _$FirestoreTripsFromJson(json);
  Map<String, dynamic> toJson() => _$FirestoreTripsToJson(this);
}
