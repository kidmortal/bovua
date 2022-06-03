import 'dart:convert';

Passagens passagensFromJson(String str) => Passagens.fromJson(json.decode(str));

String passagensToJson(Passagens data) => json.encode(data.toJson());

class Passagens {
  Passagens({
    this.result = const [],
  });

  List<List<String>> result;

  factory Passagens.fromJson(Map<String, dynamic> json) => Passagens(
        result: List<List<String>>.from(
            json["result"].map((x) => List<String>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(
            result.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
