import 'package:bovua/models/passagem.dart';
import 'package:dio/dio.dart';

class PassagemService {
  static Future<List<PassagemTrip>> getFlights(
      String fromIata, String toIata) async {
    List<PassagemTrip> list = [];
    String url =
        "https://broker.api.emitir.com.br/fquery/$fromIata/$toIata?max_age=4&limit=20";
    var response = await Dio().get<List<dynamic>>(url);
    if (response.statusCode == 200) {
      final trips =
          response.data?.map((e) => PassagemTrip.fromJson(e)).toList();
      if (trips != null) {
        list = [...trips];
      }
      return list;
    }
    return list;
  }
}
