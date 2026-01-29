import 'package:flutter/material.dart';
import 'package:flutter_app/pages/homescreen_1.dart';
import 'package:flutter_app/pages/humidity_temperature_graph.dart';
import 'package:flutter_app/pages/login.dart'; // Ensure you have a LoginPage widget
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          _buildBackgroundImage(),
          _buildContent(),
          _buildSvgIcon(context),
          _buildNavigationButton(context),
          _buildLogoutButton(context), // Add the logout button here
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: Image.asset(
        'assets/images/image_9.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildContent() {
    return Positioned(
      left: 780, // Adjust as per Figma design
      top: 250, // Adjust as per Figma design
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 380, // Set to same width as the other block
        height: 575, // Set to same height as the other block
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white.withOpacity(0.8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tunis:',
                  style: GoogleFonts.oxygen(fontSize: 18, color: Colors.black),
                ),
                Row(
                  children: [
                    Icon(Icons.wb_cloudy, size: 18), // Weather icon
                    SizedBox(width: 4),
                    Text(
                      '35°C',
                      style:
                          GoogleFonts.oxygen(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            Divider(color: Colors.black), // Add a divider
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Humidity:',
                  style: GoogleFonts.oxygen(fontSize: 18, color: Colors.black),
                ),
                Row(
                  children: [
                    Icon(Icons.water_drop,
                        size: 18, color: Colors.blue), // Humidity icon
                    SizedBox(width: 4),
                    Text(
                      '10%',
                      style:
                          GoogleFonts.oxygen(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSvgIcon(BuildContext context) {
    return Positioned(
      right: 20, // Move the icon to the right
      top: 500, // Adjust based on Figma design
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Homescreen1()),
          );
        },
        child: Transform.rotate(
          angle: 300, // Rotate if needed
          child: SvgPicture.asset(
            'assets/vectors/polygon_31_x2.svg',
            width: 16, // Adjust size as needed
            height: 14, // Adjust size as needed
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButton(BuildContext context) {
    return Positioned(
      left: 800, // Adjust based on your design
      bottom: 50, // Adjust based on your design
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue, // Button background color
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HumidityTemperatureGraph()),
          );
        },
        child: Text(
          'Check Humidity and Temperature',
          style: GoogleFonts.oxygen(
              fontSize: 18, color: Colors.white), // Button text style
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Positioned(
      right: 20, // Position the logout button on the upper right
      top: 20, // Adjust based on your design
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.black, // Button background color
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Login()), // Ensure you have a Login widget
          );
        },
        child: Text(
          'Logout',
          style: GoogleFonts.oxygen(
              fontSize: 18, color: Colors.white), // Button text style
        ),
      ),
    );
  }
}
