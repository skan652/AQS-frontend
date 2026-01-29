import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/pages/TemperatureParameters.dart'; // Import Csv3

class Gasparameters extends StatefulWidget {
  final String period;

  Gasparameters({required this.period});

  @override
  _GasparametersState createState() => _GasparametersState();
}

class _GasparametersState extends State<Gasparameters> {
  String? selectedParameter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gas Parameters'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Return to the previous screen
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.fromLTRB(18, 67, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageSection(),
            _buildCategorySection(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Selected period: ${widget.period}',
                style: GoogleFonts.oxygen(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
            Spacer(),
            _buildBackButton(), // Navigation to Csv3
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 109),
      child: Align(
        alignment: Alignment.topLeft,
        child: Image.asset(
          'assets/images/image_8.png',
          width: 34,
          height: 34,
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
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
              _buildCategoryTile(
                  'TVOC', EdgeInsets.fromLTRB(5, 7, 5.6, 10), 20),
              _buildCategoryTile(
                  'CO2', EdgeInsets.fromLTRB(14, 8, 14.2, 4), 24),
              _buildCategoryTile('Both', EdgeInsets.fromLTRB(4, 6, 0, 6), 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTile(String text, EdgeInsets padding, double fontSize) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedParameter = text;
        });
        if (selectedParameter != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Temperatureparameters(
                period: widget.period, // Pass the period separately
                selectedParameter:
                    selectedParameter!, // Pass the selected parameter
              ),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(25),
          color: Color(0xFF378837),
          boxShadow: [
            BoxShadow(
              color: Color(0x40000000),
              offset: Offset(0, 4),
              blurRadius: 2,
            ),
          ],
        ),
        padding: padding,
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.oxygen(
              fontWeight: FontWeight.w700,
              fontSize: fontSize,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context); // Navigate back
        },
        child: Text('Back'),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          textStyle: GoogleFonts.oxygen(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
