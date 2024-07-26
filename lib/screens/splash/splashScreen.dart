import 'package:flutter/material.dart';
import 'package:perpus1/screens/boarding/onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Navigasi ke halaman berikutnya setelah delay selesai
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => (OnBoardingScreen())), // Ganti OnBoarding dengan halaman tujuan
      );
    });

    return Scaffold(
      backgroundColor: Color(0xff27374D), // Warna latar belakang
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'TBLibrary',
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xffDDE6ED),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
