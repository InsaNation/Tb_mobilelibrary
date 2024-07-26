// lib/widgets/recommended_books.dart
import 'package:flutter/material.dart';
import 'package:perpus1/data/dummy_recommended.dart';
import 'package:perpus1/widgets/book_item.dart';

class RecommendedBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Recommended Books',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Atur warna teks menjadi putih
            ),
          ),
        ),
        Container(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recommendedBooks.length,
            itemBuilder: (ctx, index) {
              return Container(
                width: 250,
                child: BookItem(recommendedBooks[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
