import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perpus1/data/dummy_data.dart';
import 'package:perpus1/screens/favorites_page/favorites_page.dart';
import 'package:perpus1/screens/library_page/library_page.dart';
import 'package:perpus1/screens/profile/profile.dart';
import 'package:perpus1/screens/splash/splashScreen.dart';
import 'package:perpus1/widgets/notification_page.dart';
import 'package:perpus1/widgets/BookSearchDelegate.dart';
import 'package:perpus1/widgets/book_item.dart';
import 'package:perpus1/widgets/categories.dart';
import 'package:perpus1/widgets/recommended_books.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Book Library',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    HomePage(),
    LibraryPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Category',
          ),
        ],
        backgroundColor: Color(0xff526D82),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TBLibrary.',
          style: TextStyle(
  fontFamily:  GoogleFonts.poppins().fontFamily,
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.bold,
), 
        ),
        backgroundColor: Color(0xff27374D),
        actions: [
          IconButton(
            icon: Icon(Icons.search , color: Colors.white,),
            onPressed: () {
              showSearch(context: context, delegate: BookSearchDelegate());
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle , color: Colors.white,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications , color: Colors.white,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage()));
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecommendedBooks(),
            Categories(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'All Books',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: dummyBooks.length,
              itemBuilder: (ctx, index) {
                return BookItem(dummyBooks[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}