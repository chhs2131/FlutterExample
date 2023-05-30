
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/webtoon_model.dart';

class ApiService {
  static const String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  // https://pub.dev/packages/http
  static Future<List<WebtoonModel>> getTodaysToons() async {  // async를 통해 반환될 때는 'Future' 를 wrapping 해야한다.
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse("$baseUrl/$today");
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}