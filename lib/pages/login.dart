import 'package:flutter/material.dart';
import 'package:flutter_app/pages/homescreen.dart';
import 'package:flutter_app/pages/password_recovery_1.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onboarding_screen.dart';
import 'signup.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Add newPassword parameter to accept the reset password
  final String newPassword;

  Login({this.newPassword = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/images_photoroom_fotor_bg_remover_20240726178241.png',
              width: 252,
              height: 223,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 30),
            _buildInputField('Username', Icons.person, usernameController),
            _buildInputField('Password', Icons.lock, passwordController,
                obscureText: true, suffixIcon: Icons.visibility_off),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                handleLogin(context);
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                textStyle: GoogleFonts.oxygen(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildFooterButtons(context),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text('Back'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                textStyle: GoogleFonts.oxygen(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(
      String hintText, IconData icon, TextEditingController controller,
      {bool obscureText = false, IconData? suffixIcon}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon, size: 34),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
              ),
              style: GoogleFonts.oxygen(
                fontWeight: FontWeight.w300,
                fontSize: 23,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Signup()),
            );
          },
          child: Text(
            "Don't have an account? Sign up!",
            style: GoogleFonts.oxygen(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.green,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PasswordRecovery1()),
            );
          },
          child: Text(
            "Forgot Password?",
            style: GoogleFonts.oxygen(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }

  void handleLogin(BuildContext context) async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both username and password')),
      );
    } else {
      final response = await loginApi(username, password);

      if (response == 'success') {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Homescreen()),
          (Route<dynamic> route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Incorrect username or password')),
        );
        sendEmailNotification(username);
      }
    }
  }

  Future<String> loginApi(String username, String password) async {
    // Use the new password for login if provided
    if (username == 'testuser' && password == newPassword) {
      return 'success';
    } else {
      return 'failure';
    }
  }

  void sendEmailNotification(String username) async {
    const apiKey = 'api_key_here';
    const url = 'https://api.sendgrid.com/v3/mail/send';

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'personalizations': [
          {
            'to': [
              {'email': 'user@example.com'}
            ],
            'subject': 'Suspicious Login Attempt Detected',
          }
        ],
        'from': {'email': 'no-reply@yourapp.com'},
        'content': [
          {
            'type': 'text/plain',
            'value': 'We noticed several failed login attempts on your account.'
          }
        ],
      }),
    );

    if (response.statusCode == 202) {
      print('Email sent successfully.');
    } else {
      print('Failed to send email: ${response.body}');
    }
  }
}
