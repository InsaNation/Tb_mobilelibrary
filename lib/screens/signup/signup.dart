import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perpus1/main.dart';
import 'package:perpus1/screens/signin/signin.dart';
import 'package:perpus1/screens/signup/signup.dart';
  // Pastikan untuk mengimpor halaman MainPage

class signupscreen extends StatelessWidget {
  const signupscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Color(0xFF27374D),
          margin: const EdgeInsets.all(0),
          padding: EdgeInsets.only(top: 175), // Reduce the top padding to minimize the gap
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _header(context),
              SizedBox(height: 20), // Adjust the height to reduce the gap
              _inputField(context),
              SizedBox(height: 10), // Adjust the height to reduce the gap
              _signin(context),
            ],
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sign Up",
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: Color.fromARGB(255, 221, 230, 237),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  _inputField(context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Username",
              hintStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.black.withOpacity(0.10),
              filled: true,
              prefixIcon: const Icon(Icons.person, color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.black.withOpacity(0.10),
              filled: true,
              prefixIcon: const Icon(Icons.email, color: Colors.white), // Correct icon for email
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.black.withOpacity(0.10),
              filled: true,
              prefixIcon: const Icon(Icons.lock, color: Colors.white), // Correct icon for password
            ),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Color.fromARGB(255, 157, 178, 191),
            ),
            child: const Text(
              "Sign Up",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  _signin(context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10), // Adjust the padding to reduce the gap
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Already have an account? ",
            style: TextStyle(color: Color.fromARGB(255, 157, 178, 191)),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
            },
            child: const Text(
              "Sign In",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
