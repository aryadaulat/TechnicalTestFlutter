import 'package:flutter/material.dart';
import 'package:technical_test/pages/detailbook_page.dart';

class DetailBooksSeller extends StatelessWidget {
  final List books;

  const DetailBooksSeller({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Books In Seller"),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: books.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(10),
              // height: 55
              color: Colors.red,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailBook(books: books[index]),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image.network(
                    //   books[index]['book_image'],
                    //   width: 50,
                    //   height: 100,
                    // ),
                    Text('Author : ${books[index]['author'] ?? ''}'),
                    Text('Title : ${books[index]['title'] ?? ''}'),
                    Text('Publisher : ${books[index]['publisher'] ?? ''}'),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
