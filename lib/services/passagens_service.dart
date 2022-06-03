import 'dart:convert';

import 'package:bovua/models/passagem.dart';
import 'package:http/http.dart' as http;

class PassagensService {
  static Future<List<List<String>>> getSuggestions(String word) async {
    String url = "https://geo.emitir.com.br/autosuggest/find?intl=1&term=";
    var urlQuery = Uri.parse(url + word);
    var response = await http.get(urlQuery);
    if (response.statusCode == 200) {
      Passagens passagemList = Passagens.fromJson(json.decode(response.body));
      return passagemList.result;
    } else {
      throw Exception('Falha ao carregar sugestões');
    }
  }
}
