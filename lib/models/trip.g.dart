// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirestoreTrip _$FirestoreTripFromJson(Map<String, dynamic> json) =>
    FirestoreTrip(
      from: json['from'] as String? ?? "",
      to: json['to'] as String? ?? "",
      fromIata: json['fromIata'] as String? ?? "",
      toIata: json['toIata'] as String? ?? "",
    );

Map<String, dynamic> _$FirestoreTripToJson(FirestoreTrip instance) =>
    <String, dynamic>{
      'from': instance.from,
      'fromIata': instance.fromIata,
      'to': instance.to,
      'toIata': instance.toIata,
    };

FirestoreTrips _$FirestoreTripsFromJson(Map<String, dynamic> json) =>
    FirestoreTrips(
      trips: (json['trips'] as List<dynamic>?)
          ?.map((e) => FirestoreTrip.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FirestoreTripsToJson(FirestoreTrips instance) =>
    <String, dynamic>{
      'trips': instance.trips,
    };
