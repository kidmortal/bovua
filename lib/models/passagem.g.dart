// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passagem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Passagens _$PassagensFromJson(Map<String, dynamic> json) => Passagens(
      result: (json['result'] as List<dynamic>?)
              ?.map(
                  (e) => (e as List<dynamic>).map((e) => e as String).toList())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PassagensToJson(Passagens instance) => <String, dynamic>{
      'result': instance.result,
    };
