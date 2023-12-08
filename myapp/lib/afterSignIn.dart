import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;

class WelcomeScreen extends StatelessWidget {
  final String userEmail;

  const WelcomeScreen({super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, $userEmail!',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add any logic for navigating to other pages or performing actions
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
