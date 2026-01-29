import 'package:flutter/material.dart';
import 'package:flutter_app/pages/password_recovery.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordRecovery1 extends StatelessWidget {
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
            // Code Verification Input
            Container(
              width: 359,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 45,
                    height: 34,
                    child: SvgPicture.asset(
                      'assets/vectors/vector_13_x2.svg',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter code',
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
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => PasswordRecovery()),
                  (Route<dynamic> route) => false,
                );
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
