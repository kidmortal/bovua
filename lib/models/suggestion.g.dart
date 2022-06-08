// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Suggestions _$SuggestionsFromJson(Map<String, dynamic> json) => Suggestions(
      result: (json['result'] as List<dynamic>?)
              ?.map(
                  (e) => (e as List<dynamic>).map((e) => e as String).toList())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SuggestionsToJson(Suggestions instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
