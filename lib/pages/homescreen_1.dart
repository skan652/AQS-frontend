import 'package:flutter/material.dart';
import 'package:flutter_app/pages/gas_particles.dart';
import 'package:flutter_app/pages/homescreen.dart';
import 'package:flutter_app/pages/login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen1 extends StatelessWidget {
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
          _buildLogoutButton(context)
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
      right: 780, // Adjust based on Figma design
      top: 231, // Adjust based on Figma design
      child: Container(
        padding: const EdgeInsets.all(22),
        width: 380, // Set to the same width as the other block
        height: 575, // Set to the same height as the other block
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(25),
          color: Colors.white.withOpacity(0.8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDataRow('CO2:', '500 kt', 'assets/images/image_17.png'),
            const SizedBox(height: 28),
            _buildSeparator(),
            const SizedBox(height: 24),
            _buildDataRow('TVOC:', '950', null),
            const SizedBox(height: 24),
            _buildThumbsUpImage(),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(String label, String value, String? imagePath) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.oxygen(fontSize: 30, color: Colors.black),
        ),
        Row(
          children: [
            if (imagePath != null)
              Padding(
                padding: const EdgeInsets.only(right: 11),
                child: Image.asset(
                  imagePath,
                  width: 55,
                  height: 55,
                ),
              ),
            Text(
              value,
              style: GoogleFonts.oxygen(fontSize: 30, color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSeparator() {
    return Container(
      height: 1,
      color: Colors.black,
    );
  }

  Widget _buildThumbsUpImage() {
    return Center(
      child: Image.asset(
        'assets/images/green_thumbs_up_1124611.png',
        width: 300,
        height: 300,
      ),
    );
  }

  Widget _buildSvgIcon(BuildContext context) {
    return Positioned(
      left: 20, // Adjust based on Figma design
      top: 500, // Adjust based on Figma design
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Homescreen()),
          );
        },
        child: Transform.rotate(
          angle: 100, // Rotate 180 degrees to point left
          child: SvgPicture.asset(
            'assets/vectors/polygon_31_x2.svg',
            width: 26, // Adjust size as needed
            height: 24, // Adjust size as needed
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButton(BuildContext context) {
    return Positioned(
      left: 850, // Adjust based on your design
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
            MaterialPageRoute(builder: (context) => GasParticlesGraph()),
          );
        },
        child: Text(
          'Check Gas Evolution',
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
