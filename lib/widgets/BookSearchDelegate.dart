// lib/widgets/search_delegate.dart
import 'package:flutter/material.dart';
import 'package:perpus1/data/dummy_data.dart';
import 'package:perpus1/models/book.dart';
import 'package:perpus1/widgets/book_item.dart';


class BookSearchDelegate extends SearchDelegate<Book?> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = dummyBooks.where((book) => book.title.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (ctx, index) {
        return BookItem(results[index]);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = dummyBooks.where((book) => book.title.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (ctx, index) {
        return BookItem(suggestions[index]);
      },
    );
  }
}
