// lib/main.dart
import 'package:flutter/material.dart'; // Add this import
import 'pages/onboarding_screen.dart';
import 'pages/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure all bindings are initialized
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AQS: Air Quality Sensor',
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingScreen(),
        '/login': (context) => Login(),
      },
    );
  }

  Future<void> fetchData() async {
    final url =
        'http://localhost:3000/actia-backend'; // Replace with your backend endpoint
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final data = jsonDecode(response.body);
      print(data);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
