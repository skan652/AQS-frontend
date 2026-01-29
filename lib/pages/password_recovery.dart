import 'package:flutter/material.dart';
import 'package:flutter_app/pages/login.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordRecovery extends StatefulWidget {
  @override
  _PasswordRecoveryState createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  // TextEditingController for password and retype password inputs
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController retypePasswordController =
      TextEditingController();

  // Variable to store the new password
  String newPassword = '';

  @override
  void dispose() {
    // Dispose controllers when the widget is removed from the tree
    passwordController.dispose();
    retypePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 62),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image
            Image.asset(
              'assets/images/images_photoroom_fotor_bg_remover_20240726178241.png',
              width: 252,
              height: 223,
            ),
            SizedBox(height: 30),
            // Password Input
            Container(
              width: 359,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Icon(Icons.lock, size: 34),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: passwordController,
                      obscureText: true, // Hide the password input
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                      ),
                      style: GoogleFonts.oxygen(
                        fontWeight: FontWeight.w300,
                        fontSize: 25,
                        color: Color(0xFF505050),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Retype Password Input
            Container(
              width: 359,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Icon(Icons.lock, size: 34),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: retypePasswordController,
                      obscureText: true, // Hide the password input
                      decoration: InputDecoration(
                        hintText: 'Retype Password',
                        border: InputBorder.none,
                      ),
                      style: GoogleFonts.oxygen(
                        fontWeight: FontWeight.w300,
                        fontSize: 25,
                        color: Color(0xFF505050),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Resend Code Text
            Text(
              'Click here if you didn’t receive the code',
              style: GoogleFonts.oxygen(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                decoration: TextDecoration.underline,
                color: Color(0xFF008000),
              ),
            ),
            SizedBox(height: 20),
            // Continue Button
            ElevatedButton(
              onPressed: () {
                if (passwordController.text == retypePasswordController.text) {
                  setState(() {
                    newPassword = passwordController.text; // Save new password
                  });
                  // Navigate to login with the new password
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(newPassword: newPassword),
                    ),
                  );
                } else {
                  // Show an error if passwords do not match
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Passwords do not match')),
                  );
                }
              },
              child: Text(
                'Continue',
                style: GoogleFonts.oxygen(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
