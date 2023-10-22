import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:technical_test/models/rankbooks_model.dart';

class RankBooksServices {
  static const baseURL =
      "https://api.nytimes.com/svc/books/v3/lists/overview.json";
  final String apiKey;

  RankBooksServices(this.apiKey);

  Future<RankBooks> getData(String publishdate) async {
    final response = await http
        .get(Uri.parse('$baseURL?api-key=$apiKey&published_date=$publishdate'));
    if (response.statusCode == 200) {
      // print(response.body);
      return RankBooks.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load book data');
    }
  }
}
