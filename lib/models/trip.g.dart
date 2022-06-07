// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trip _$TripFromJson(Map<String, dynamic> json) => Trip(
      from: json['from'] as String? ?? "",
      to: json['to'] as String? ?? "",
      fromIata: json['fromIata'] as String? ?? "",
      toIata: json['toIata'] as String? ?? "",
    );

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
      'from': instance.from,
      'fromIata': instance.fromIata,
      'to': instance.to,
      'toIata': instance.toIata,
    };
