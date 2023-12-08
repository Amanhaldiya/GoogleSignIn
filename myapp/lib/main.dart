import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
import 'googleSign.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Signup and Sheet Logging',
      home: HomeScreen(),
    );
  }
}

