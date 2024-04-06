import 'dart:async'; // Import dart:async for Timer
import 'package:flutter/material.dart';
import '../homescreen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomeScreen after 2 seconds
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Your splash screen UI
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5, // Cover 50% of the screen width
          heightFactor: 0.5, // Cover 50% of the screen height
          child: Image.asset(
            'assets/images/logo.PNG',
            fit: BoxFit.contain, // Ensure the logo fits within the box
          ),
        ),
      ),
    );
  }
}
