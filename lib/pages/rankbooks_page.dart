import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:technical_test/models/rankbooks_model.dart';
import 'package:technical_test/pages/detailbooksseller_page.dart';
import 'package:technical_test/services/rankbooks_services.dart';

class RankBooksPage extends StatefulWidget {
  const RankBooksPage({super.key});

  @override
  _RankBooksPageState createState() => _RankBooksPageState();
}

class _RankBooksPageState extends State<RankBooksPage> {
  final _rankBooksServices =
      RankBooksServices('RGcjW6cWDLjx1shwCl65ivEHaiAKfKuM');

  RankBooks? _rankBooks;

  _fetchBooks() async {
    DateTime today = DateTime.now();
    String dateStr = "${today.year}-${today.month}-${today.day}";

    try {
      final books = await _rankBooksServices.getData(dateStr);
      setState(() {
        _rankBooks = books;
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

  String getTextTitle(List<dynamic> books) {
    if (books.isNotEmpty) {
      String text1 = books[0]['title'] ?? '';
      String text2 = books[1]['title'] ?? '';
      String text3 = books[2]['title'] ?? '';
      String text4 = books[3]['title'] ?? '';
      String text5 = books[4]['title'] ?? '';

      return '$text1, $text2, $text3, $text4, $text5, ';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie List"),
      ),
      backgroundColor: Colors.grey[300],
      body: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: _rankBooks?.results.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(5),
              height: 55,
              color: Colors.red,
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailBooksSeller(
                                books: _rankBooks?.results[index]['books'] ??
                                    [])));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Seller : ',
                            style: TextStyle(color: Colors.black),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Text(
                              _rankBooks?.results[index]['display_name'] ?? "",
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: Text(
                          getTextTitle((_rankBooks?.results[index]['books'] ??
                              []) as List),
                          softWrap: false,
                          overflow: TextOverflow.clip,
                          style:
                              const TextStyle(color: Colors.black, fontSize: 7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
