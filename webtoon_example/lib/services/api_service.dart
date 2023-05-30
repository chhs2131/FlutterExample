
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  // https://pub.dev/packages/http
  void getTodaysToons() async {
    final url = Uri.parse("$baseUrl/$today");
    final http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}