import 'dart:convert';
import 'package:technical_test/models/books_model.dart';
import 'package:http/http.dart' as http;

class BooksServices {
  static const baseURL = "https://api.nytimes.com/svc/books/v3/";
  final String apiKey;

  BooksServices(this.apiKey);

  Future<Books> getBooks(String order) async {
    final response =
        await http.get(Uri.parse('$baseURL$order?api-key=$apiKey'));
    if (response.statusCode == 200) {
      // print(response.body);
      return Books.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load book data');
    }
  }
}
