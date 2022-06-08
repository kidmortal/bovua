import 'package:json_annotation/json_annotation.dart';

part 'passagem.g.dart';

@JsonSerializable()
class PassagemTrip {
  String? departure_ap;
  String? arrival_ap;
  String? departure_date;
  String? return_date;
  String? lowest_company;
  String? lowest_company_code;
  double? total;
  String? search_url;

  PassagemTrip({
    this.departure_ap,
    this.arrival_ap,
    this.departure_date,
    this.return_date,
    this.lowest_company,
    this.lowest_company_code,
    this.total,
    this.search_url,
  });

  factory PassagemTrip.fromJson(Map<String, dynamic> json) =>
      _$PassagemTripFromJson(json);
  Map<String, dynamic> toJson() => _$PassagemTripToJson(this);
}
