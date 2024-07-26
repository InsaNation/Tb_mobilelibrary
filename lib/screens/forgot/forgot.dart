import 'package:flutter/material.dart';
import 'package:perpus1/screens/signin/signin.dart';
import 'package:perpus1/screens/signup/signup.dart';

void main() {
  runApp(Forgot());
}

class Forgot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ForgotPasswordScreen(),
    );
  }
}

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(39, 55, 77, 1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
          },
        ),
      ),
      backgroundColor: Color.fromRGBO(39, 55, 77, 1),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFDDE6ED)),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 16),
              Text(
                'Don\'t worry! It happens. Please enter your email, we will send the OTP on your email.',
                style: TextStyle(fontSize: 16, color: Color(0xFF9DB2BF)),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 60),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.white54),
                  enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.1),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16.0),
              Center(
                child: Container(
                  width: 330,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('OTP telah dikirim ke email Anda')),
                      );
                    },
                    child: Text('Send', style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff27374D),

                    ),),
                   style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Belum memiliki akun?', style: TextStyle(color: Color(0xFF9DB2BF))),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => signupscreen()),
                      );
                    },
                    child: Text('sign up', style: TextStyle(color: Color(0xFFDDE6ED))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}