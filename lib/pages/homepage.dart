import 'package:flutter/material.dart';
import 'package:technical_test/pages/homebooks_page.dart';
import 'package:technical_test/pages/rankbooks_page.dart';
import 'package:technical_test/pages/weather_page.dart';

final List<String> entries = <String>[
  'Weather Today',
  'Best Seller Book New York',
  'Top 5 Books Today'
];
final List<Widget> navigator = <Widget>[
  const WeatherPage(),
  const BooksPage(),
  const RankBooksPage(),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Technical Test')),
        backgroundColor: Colors.grey,
        body: Center(
          child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  height: 50,
                  color: Colors.red,
                  child: Center(
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => navigator[index]));
                          },
                          child: Text(
                            entries[index],
                            style: const TextStyle(color: Colors.black),
                          ))),
                );
              }),
        ));
  }
}
