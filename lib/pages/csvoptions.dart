import 'package:flutter/material.dart'; // Import the correct screen
import 'package:flutter_app/pages/TimelineOptions.dart';
import 'package:flutter_app/pages/homescreen.dart';
import 'package:google_fonts/google_fonts.dart';

class Csvoptions extends StatefulWidget {
  @override
  _CsvoptionsState createState() => _CsvoptionsState();
}

class _CsvoptionsState extends State<Csvoptions> {
  List<String> headers = ['Temperature', 'Humidity', 'TVOC', 'CO2'];
  List<List<String>> data = [
    ['35°C', '10%', '950', '25'],
    ['35°C', '5%', '500', '30'],
    ['36°C', '15%', '980', '35'],
    ['36°C', '12%', '500', '50'],
    ['36°C', '15%', '500', '40'],
  ];

  void _addColumn() {
    setState(() {
      headers.add('New Column');
      for (var row in data) {
        row.add('Data');
      }
    });
  }

  void _deleteColumn(int index) {
    setState(() {
      if (headers.length > 1) {
        // Ensure there's at least one column left
        headers.removeAt(index);
        for (var row in data) {
          row.removeAt(index);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildContent(),
          _buildButtons(context),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 67, 18, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/image_8.png',
                    width: 34,
                    height: 34,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildRow(headers, isHeader: true),
                    for (var row in data) buildRow(row),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRow(List<String> items, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                item,
                textAlign: TextAlign.center,
                style: GoogleFonts.oxygen(
                  fontWeight: isHeader ? FontWeight.w700 : FontWeight.w400,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Homescreen()),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                'Back',
                style: GoogleFonts.oxygen(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Timelineoptions()),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                'Next',
                style: GoogleFonts.oxygen(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _addColumn,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                'Add Column',
                style: GoogleFonts.oxygen(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () =>
                  _deleteColumn(0), // Example: deletes the first column
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                'Delete Column',
                style: GoogleFonts.oxygen(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
