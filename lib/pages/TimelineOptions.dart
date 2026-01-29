import 'package:flutter/material.dart';
import 'package:flutter_app/pages/GasParameters.dart'; // Import Homescreen
import 'package:flutter_app/pages/homescreen.dart';
import 'package:google_fonts/google_fonts.dart';

class Timelineoptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              padding: const EdgeInsets.fromLTRB(18, 67, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImage('assets/images/image_8.png', 34, 34,
                      const EdgeInsets.only(bottom: 109)),
                  _buildCategorySection(context),
                ],
              ),
            ),
          ),
          _buildBackButton(context),
        ],
      ),
    );
  }

  Widget _buildImage(
      String asset, double width, double height, EdgeInsetsGeometry padding) {
    return Padding(
      padding: padding,
      child: Align(
        alignment: Alignment.topLeft,
        child: Image.asset(asset, width: width, height: height),
      ),
    );
  }

  Widget _buildCategorySection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 3, 40),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          padding: const EdgeInsets.fromLTRB(0, 41, 0, 65),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildCategoryTile('Day', const EdgeInsets.fromLTRB(2.2, 6, 0, 6),
                  context, 'Day'),
              _buildCategoryTile('Month',
                  const EdgeInsets.fromLTRB(0, 5, 1.3, 7), context, 'Month'),
              _buildCategoryTile('Year',
                  const EdgeInsets.fromLTRB(7.9, 6, 0, 6), context, 'Year'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTile(String text, EdgeInsetsGeometry padding,
      BuildContext context, String period) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Gasparameters(
                period: period), // Pass the selected period to Csv2
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xFF378837),
          boxShadow: [
            BoxShadow(
                color: const Color(0x40000000),
                offset: const Offset(0, 4),
                blurRadius: 2),
          ],
        ),
        padding: padding,
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.oxygen(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Homescreen()),
          );
        },
        child: Text('Back'),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          backgroundColor: Colors.black, // Background color of the button
          foregroundColor: Colors.white, // Text color of the button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
