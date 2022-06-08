import "package:json_annotation/json_annotation.dart";

part 'suggestion.g.dart';

@JsonSerializable()
class Suggestions {
  Suggestions({
    this.result = const [],
  });

  List<List<String>> result;

  factory Suggestions.fromJson(Map<String, dynamic> json) =>
      _$SuggestionsFromJson(json);
  Map<String, dynamic> toJson() => _$SuggestionsToJson(this);
}
