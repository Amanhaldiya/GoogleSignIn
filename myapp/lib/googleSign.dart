import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'afterSignIn.dart';



  class HomeScreen extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final String sheetUrl = 'https://script.google.com/macros/s/AKfycbyZtI1IDrcQnnpsob1BUNx30k8wqFp5wQMoFP6TZJptQcoqdoJR8Vh4xIsgl3Hs3ZHg/exec';

  HomeScreen({super.key});

  Future<void> _logDataToGoogleSheet(String email, String latitude, String longitude) async {
    final url = '$sheetUrl?email=$email&latitude=$latitude&longitude=$longitude';
    try {
      await http.get(Uri.parse(url));
    } catch (e) {
      print('Error logging data to Google Sheet: $e');
    }
  }

  Future<void> _navigateToWelcomePage(BuildContext context, String userEmail) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen(userEmail: userEmail)),
    );
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final Position position = await Geolocator.getCurrentPosition();
        final String latitude = position.latitude.toString();
        final String longitude = position.longitude.toString();

        await _logDataToGoogleSheet(googleSignInAccount.email ?? '', latitude, longitude);
        await _navigateToWelcomePage(context, googleSignInAccount.email ?? '');
      }
    } catch (e) {
      print('Error signing in with Google: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Signup and Sheet Logging'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Image.asset(
              "assetss/files/login.png",
              fit: BoxFit.cover,
              height: 200,
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Welcome to The App this app accepts google sign in and logs the user email and location to a google sheet',
                style: TextStyle(color:Color.fromARGB(255, 13, 91, 209), fontSize: 15),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _signInWithGoogle(context),
              child: const Text('Sign In with Google'),
            ),
          ],
        ),
      ),
    );
  }
}