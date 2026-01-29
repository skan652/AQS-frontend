import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final bool isLastPage;
  final VoidCallback? onStart;
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;

  OnboardingPage({
    required this.imagePath,
    required this.title,
    required this.description,
    this.isLastPage = false,
    this.onStart,
    this.onNext,
    this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(imagePath, width: 430, height: 259, fit: BoxFit.cover),
        SizedBox(height: 30),
        Text(
          title,
          style: GoogleFonts.oxygen(
            fontWeight: FontWeight.w300,
            fontSize: 30,
            color: Color(0xFF008000),
          ),
        ),
        SizedBox(height: 20),
        Text(
          description,
          textAlign: TextAlign.center,
          style: GoogleFonts.oxygen(
            fontWeight: FontWeight.w300,
            fontSize: 20,
            color: Color(0xFF000000),
          ),
        ),
        if (isLastPage) SizedBox(height: 30),
        if (isLastPage)
          ElevatedButton(
            onPressed: onStart,
            child: Text(
              'Get Started',
              style: GoogleFonts.oxygen(
                fontWeight: FontWeight.w700,
                fontSize: 35,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        if (!isLastPage)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (onPrevious != null)
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: onPrevious,
                ),
              if (onNext != null)
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: onNext,
                ),
            ],
          ),
      ],
    );
  }
}
