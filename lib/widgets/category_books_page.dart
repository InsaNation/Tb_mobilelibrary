import 'package:flutter/material.dart';

class CategoryBooksPage extends StatelessWidget {
  final String category;

  CategoryBooksPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Books'),
      ),
      body: Center(
        child: Text('Books in $category category'),
      ),
    );
  }
}
