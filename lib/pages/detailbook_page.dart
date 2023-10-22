import 'package:flutter/material.dart';

class DetailBook extends StatelessWidget {
  final Map books;

  const DetailBook({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Books"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Image.network(
              books['book_image'],
              width: books['book_image_width'].toDouble() / 1.5,
              height: books['book_image_height'].toDouble() / 1.5,
            ),
          ),
          Text('Author : ${books['author']}'),
          Text('Title : ${books['title']}'),
          Text('Publisher : ${books['publisher']}'),
          const Text('Deskripsi'),
          Text(books['description']),
        ]),
      ),
    );
  }
}
