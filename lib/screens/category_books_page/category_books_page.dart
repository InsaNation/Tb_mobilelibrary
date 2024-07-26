// lib/pages/category_books_page.dart
import 'package:flutter/material.dart';
import 'package:perpus1/data/dummy_data.dart';


class CategoryBooksPage extends StatelessWidget {
  final String category;

  CategoryBooksPage({required this.category});

  @override
  Widget build(BuildContext context) {
    // Filter books based on the category
    final categoryBooks = dummyBooks.where((book) => book.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Books'),
        backgroundColor: Color.fromARGB(126, 14, 47, 96),
      ),
      backgroundColor: Color(0xff27374D),
      body: ListView.builder(
        itemCount: categoryBooks.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(
              categoryBooks[index].title,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              categoryBooks[index].author,
              style: TextStyle(color: Colors.white70),
            ),
            onTap: () {
              // Navigate to the book detail page
            },
          );
        },
      ),
    );
  }
}
