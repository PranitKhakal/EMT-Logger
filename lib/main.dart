import 'package:flutter/material.dart';
import 'splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMT Logger',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(), // Starting with SplashScreen
      debugShowCheckedModeBanner: false, // Hides the debug banner
    );
  }
}