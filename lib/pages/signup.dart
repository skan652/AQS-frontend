import 'package:flutter/material.dart';
import 'package:flutter_app/pages/homescreen.dart';
import 'package:flutter_app/pages/login.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatelessWidget {
  // Controllers for username, password, and phone number inputs
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildImageContainer(
                'assets/images/images_photoroom_fotor_bg_remover_20240726178241.png',
                252,
                223),
            SizedBox(height: 30),
            // Username Input
            _buildInputField('Username', Icons.person, usernameController),
            // Password Input
            _buildInputField('Password', Icons.lock, passwordController,
                suffixIcon: Icons.visibility_off),
            // Phone Number Input
            _buildInputField('Phone Number', Icons.phone, phoneController,
                suffixIcon: Icons.visibility_off),
            SizedBox(height: 50),
            // Continue Button
            _buildContinueButton(context),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the Login screen
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
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

  Widget _buildImageContainer(String imagePath, double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }

  Widget _buildInputField(
      String label, IconData icon, TextEditingController controller,
      {IconData? suffixIcon}) {
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
              controller: controller, // Add the controller here
              obscureText: suffixIcon != null,
              decoration: InputDecoration(
                hintText: label,
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

  Widget _buildContinueButton(BuildContext context) {
    return Container(
      width: 213,
      padding: EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF000000)),
        borderRadius: BorderRadius.circular(25),
        color: Color(0x99378837),
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            offset: Offset(0, 4),
            blurRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: TextButton(
          onPressed: () {
            // Call the validation method before proceeding
            handleSignup(context);
          },
          child: Text(
            'Continue',
            style: GoogleFonts.oxygen(
              fontWeight: FontWeight.w700,
              fontSize: 25,
              color: Color(0xFF000000),
            ),
          ),
        ),
      ),
    );
  }

  // Method to validate signup inputs
  void handleSignup(BuildContext context) {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();
    String phone = phoneController.text.trim();

    if (username.isEmpty || password.isEmpty || phone.isEmpty) {
      // Show a message if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields'),
        ),
      );
    } else {
      // Proceed with signup or API call here
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Homescreen()),
        (Route<dynamic> route) => false,
      );
    }
  }
}
