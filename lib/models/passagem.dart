import "package:json_annotation/json_annotation.dart";

part 'passagem.g.dart';

@JsonSerializable()
class Passagens {
  Passagens({
    this.result = const [],
  });

  List<List<String>> result;

  factory Passagens.fromJson(Map<String, dynamic> json) =>
      _$PassagensFromJson(json);
  Map<String, dynamic> toJson() => _$PassagensToJson(this);
}
