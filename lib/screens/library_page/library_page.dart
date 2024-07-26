import 'dart:math'; // Import dart:math untuk menggunakan fungsi Random
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perpus1/data/dummy_categories.dart';
import 'package:perpus1/screens/category_books_page/category_books_page.dart';
import 'package:perpus1/screens/profile/profile.dart';
import 'package:perpus1/widgets/BookSearchDelegate.dart';
import 'package:perpus1/widgets/notification_page.dart';

class LibraryPage extends StatelessWidget {
  final List<Category> categories = dummyCategories;
  
  // Daftar URL gambar yang bisa digunakan secara acak
  final List<String> categoryImages = [
    'assets/images/1.png',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    // Tambahkan URL gambar lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TBLibrary.',
          style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xff27374D),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              showSearch(context: context, delegate: BookSearchDelegate());
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NotificationPage()));
            },
          ),
        ],
      ),
      backgroundColor: Color(0xff27374D),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xff27374D),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            // Add more ListTile for other options
          ],
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          // Pilih gambar secara acak dari daftar URL gambar
          String randomImage = categoryImages[Random().nextInt(categoryImages.length)];
          
          return CategoryCard(
            title: categories[index].title,
            imageUrl: randomImage, // Gunakan gambar acak
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryBooksPage(
                    category: categories[index].title,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl; // Tambahkan variabel imageUrl untuk menampilkan gambar
  final VoidCallback onTap;

  const CategoryCard({
    required this.title,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl), // Gunakan gambar dari URL
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}