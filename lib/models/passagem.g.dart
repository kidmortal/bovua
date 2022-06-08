// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passagem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PassagemTrip _$PassagemTripFromJson(Map<String, dynamic> json) => PassagemTrip(
      departure_ap: json['departure_ap'] as String?,
      arrival_ap: json['arrival_ap'] as String?,
      departure_date: json['departure_date'] as String?,
      return_date: json['return_date'] as String?,
      lowest_company: json['lowest_company'] as String?,
      lowest_company_code: json['lowest_company_code'] as String?,
      total: (json['total'] as num?)?.toDouble(),
      search_url: json['search_url'] as String?,
    );

Map<String, dynamic> _$PassagemTripToJson(PassagemTrip instance) =>
    <String, dynamic>{
      'departure_ap': instance.departure_ap,
      'arrival_ap': instance.arrival_ap,
      'departure_date': instance.departure_date,
      'return_date': instance.return_date,
      'lowest_company': instance.lowest_company,
      'lowest_company_code': instance.lowest_company_code,
      'total': instance.total,
      'search_url': instance.search_url,
    };
