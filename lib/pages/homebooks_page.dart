import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:technical_test/models/books_model.dart';
import 'package:technical_test/services/books_services.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  final _booksServices = BooksServices('RGcjW6cWDLjx1shwCl65ivEHaiAKfKuM');

  Books? _books;

  _fetchBooks() async {
    String order = 'lists/names.json';

    try {
      final books = await _booksServices.getBooks(order);
      setState(() {
        _books = books;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    super.initState();

    _fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seller List"),
      ),
      backgroundColor: Colors.grey[300],
      body: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: _books?.results.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(5),
              height: 50,
              color: Colors.red,
              child: Center(
                  child: TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => navigator[index]));
                      },
                      child: Text(
                        _books?.results[index]['display_name'] ?? "",
                        style: const TextStyle(color: Colors.black),
                      ))),
            );
          }),
    );
  }
}
