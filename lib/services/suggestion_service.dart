import 'dart:convert';

import 'package:bovua/models/suggestion.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class SuggestionService {
  static Future<List<List<String>>> getSuggestions(String word) async {
    String url = "https://geo.emitir.com.br/autosuggest/find?intl=1&term=$word";
    var response = await Dio().get(url);
    if (response.statusCode == 200) {
      return Suggestions.fromJson(response.data).result;
    } else {
      throw Exception('Falha ao carregar sugestões');
    }
  }
}
