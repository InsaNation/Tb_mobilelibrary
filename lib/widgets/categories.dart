import 'package:flutter/material.dart';
import 'package:perpus1/data/dummy_categories.dart';
import 'package:perpus1/screens/category_books_page/category_books_page.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Categories',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Ubah warna teks menjadi putih
            ),
          ),
        ),
        Container(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dummyCategories.length,
            itemBuilder: (ctx, index) {
              final category = dummyCategories[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryBooksPage(category: category.title),
                      ),
                    );
                  },
                  child: Chip(
                    label: Text(
                      category.title,
                      style: TextStyle(color: const Color(0xff27374D)), // Ubah warna teks menjadi putih
                    ),
                    backgroundColor: Color(0xff9DB2BF), // Atur warna latar belakang chip
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
