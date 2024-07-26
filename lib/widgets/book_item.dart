// lib/widgets/book_item.dart
import 'package:flutter/material.dart';
import 'package:perpus1/models/book.dart';
import 'package:perpus1/widgets/book_detail_page.dart';

class BookItem extends StatelessWidget {
  final Book book;

  BookItem(this.book);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 41, 82, 107),
      child: ListTile(
        leading: Image.asset('assets/images/1.png'), // Use Image.asset to display an image from local assets
        title: Text(
          book.title,
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        subtitle: Text(
          book.author,
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetailPage(book: book),
            ),
          );
        },
      ),
    );
  }
}
