import 'package:flutter/material.dart';
import 'package:perpus1/screens/boarding/onboarding.dart';
import 'package:perpus1/screens/log_out/logout.dart';
import 'dart:io';

import 'package:perpus1/screens/setting/setting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  File? _profileImage;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);  // Ensure this matches the number of tabs
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xff526D82),
      ),
      backgroundColor: Color(0xFFDDE6ED),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 500,
              decoration: BoxDecoration(
                color: Color.fromRGBO(39, 55, 77, 1),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              padding: EdgeInsets.symmetric(vertical: 60),
              child: Column(
                children: [
                  GestureDetector(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : NetworkImage('https://via.placeholder.com/150') as ImageProvider,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Dwi Canditya',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFDDE6ED),
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'dwi.canditya@example.com',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFFDDE6ED),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.blue),
                title: Text('Edit Profile'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Icon(Icons.settings, color: Colors.blue),
                title: Text('Settings'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
                },
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.blue),
                title: Text('Logout'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
                  // Perform logout operation
                },
              ),
            ),
            SizedBox(height: 20),
            TabBar(
              controller: _tabController,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(text: "History"),
                Tab(text: "Favorite"),
              ],
            ),
            Container(
              height: 400, // Adjust the height as needed
              child: TabBarView(
                controller: _tabController,
                children: [
                  HistoryTab(),
                  BookmarkTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryTab extends StatefulWidget {
  @override
  _HistoryTabState createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  // Contoh data riwayat baca
  final List<String> history = [
    'Manga 1: Chapter 10',
    'Manga 2: Chapter 5',
    'Manga 3: Chapter 23',
    'Manga 4: Chapter 7',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: history.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ListTile(
            title: Text(history[index]),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Tindakan ketika item di-tap, misalnya membuka detail manga
              print('Tapped on ${history[index]}');
            },
          ),
        );
      },
    );
  }
}

class BookmarkTab extends StatefulWidget {
  @override
  _BookmarkTabState createState() => _BookmarkTabState();
}

class _BookmarkTabState extends State<BookmarkTab> {
  // Contoh data bookmark
  final List<String> bookmarks = [
    'Manga 1: Chapter 10',
    'Manga 2: Chapter 5',
    'Manga 3: Chapter 23',
    'Manga 4: Chapter 7',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 1: Chapter 10',
    'Manga 2: Chapter 5',
    'Manga 3: Chapter 23',
    'Manga 4: Chapter 7',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
    'Manga 5: Chapter 15',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bookmarks.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ListTile(
            title: Text(bookmarks[index]),
            trailing: Icon(Icons.favorite),
            onTap: () {
              // Tindakan ketika item di-tap, misalnya membuka detail manga
              print('Tapped on ${bookmarks[index]}');
            },
          ),
        );
      },
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String _name = 'Dwi Canditya';
  String _email = 'dwi.canditya@example.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDDE6ED),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _name = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                initialValue: _email,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _email = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 20), // Atur ukuran teks disini
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
          },
        ),
      ),
    );
  }
}