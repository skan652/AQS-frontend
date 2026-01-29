import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/pages/csvoptions.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Temperatureparameters extends StatefulWidget {
  final String period;
  final String selectedParameter;

  Temperatureparameters(
      {required this.period, required this.selectedParameter});

  @override
  _TemperatureparametersState createState() => _TemperatureparametersState();
}

class _TemperatureparametersState extends State<Temperatureparameters> {
  String? _selectedSubParameter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature parameters'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.fromLTRB(18, 67, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildImageSection(),
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Selected parameter: ${widget.selectedParameter}',
                  style: GoogleFonts.oxygen(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
              _buildCategorySection(),
              _buildBackButton(),
              _buildExportButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
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
      padding: const EdgeInsets.symmetric(vertical: 20),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCategoryTile('Temperature', EdgeInsets.all(10), 20),
              _buildCategoryTile('Humidity', EdgeInsets.all(10), 24),
              _buildCategoryTile('Both', EdgeInsets.all(10), 24),
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
          _selectedSubParameter = text;
        });
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
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Csvoptions(),
            ),
          );
        },
        child: Text('Back to CSV'),
        style: ElevatedButton.styleFrom(
          textStyle: GoogleFonts.oxygen(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildExportButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Align(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: _selectedSubParameter == null
              ? null
              : () async {
                  String textData = _generateText();
                  await _saveTextFile(textData);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Text file exported successfully!")),
                  );
                },
          child: Text('Export'),
          style: ElevatedButton.styleFrom(
            textStyle: GoogleFonts.oxygen(
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }

  String _generateText() {
    String textData = '''
    Selected Period: ${widget.period}
    Selected Parameter: ${widget.selectedParameter}
    Selected Sub-Parameter: $_selectedSubParameter
    ''';

    return textData;
  }

  Future<void> _saveTextFile(String textData) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/exported_data.txt';
    final file = File(path);
    await file.writeAsString(textData);
    print("Text file saved at $path");
  }
}
