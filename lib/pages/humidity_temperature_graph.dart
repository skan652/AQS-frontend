import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_app/pages/csvoptions.dart';
import 'package:google_fonts/google_fonts.dart';

class HumidityTemperatureGraph extends StatefulWidget {
  @override
  _HumidityTemperatureGraphState createState() =>
      _HumidityTemperatureGraphState();
}

class _HumidityTemperatureGraphState extends State<HumidityTemperatureGraph> {
  String selectedTimeline = 'Day';
  String selectedParameter = 'Both';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildContent(),
          _buildDropdownMenus(),
          _buildBackAndExportButtons(context),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Positioned(
      left: 16,
      top: 120,
      right: 16,
      bottom: 80,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: false), // Hide grid lines
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: Text(
                        _getXTitle(value),
                        style: GoogleFonts.oxygen(fontSize: 14),
                      ),
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  interval: 10,
                  getTitlesWidget: (value, meta) {
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: Text(
                        _getYTitle(value),
                        style: GoogleFonts.oxygen(fontSize: 14),
                      ),
                    );
                  },
                ),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: Colors.black.withOpacity(0.4),
                width: 1,
              ),
            ),
            lineBarsData: _getLineBarsData(),
            lineTouchData: LineTouchData(enabled: false),
            minX: 0,
            maxX: _getMaxX(), // Set based on selected timeline
            minY: 0,
            maxY: _getMaxY(), // Set based on selected parameter
          ),
        ),
      ),
    );
  }

  List<LineChartBarData> _getLineBarsData() {
    List<LineChartBarData> lineBarsData = [];

    if (selectedParameter == 'Temperature' || selectedParameter == 'Both') {
      lineBarsData.add(
        LineChartBarData(
          spots: _getTemperatureData(),
          isCurved: true,
          color: Colors.green, // Color for temperature line
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
      );
    }

    if (selectedParameter == 'Humidity' || selectedParameter == 'Both') {
      lineBarsData.add(
        LineChartBarData(
          spots: _getHumidityData(),
          isCurved: true,
          color: Colors.blue, // Color for humidity line
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
      );
    }

    return lineBarsData;
  }

  List<FlSpot> _getTemperatureData() {
    // Sample temperature data; replace with actual data
    return [
      FlSpot(0, 30),
      FlSpot(1, 35),
      FlSpot(2, 40),
      FlSpot(3, 50),
      FlSpot(4, 45),
      FlSpot(5, 60),
      FlSpot(6, 70),
      FlSpot(7, 65),
      FlSpot(8, 80),
      FlSpot(9, 75),
    ];
  }

  List<FlSpot> _getHumidityData() {
    // Sample humidity data; replace with actual data
    return [
      FlSpot(0, 60),
      FlSpot(1, 65),
      FlSpot(2, 70),
      FlSpot(3, 80),
      FlSpot(4, 75),
      FlSpot(5, 85),
      FlSpot(6, 90),
      FlSpot(7, 85),
      FlSpot(8, 95),
      FlSpot(9, 90),
    ];
  }

  double _getMaxX() {
    // Adjust the maxX value based on selected timeline
    switch (selectedTimeline) {
      case 'Month':
        return 30; // Example for months
      case 'Year':
        return 365; // Example for days in a year
      default:
        return 10; // Example for days
    }
  }

  double _getMaxY() {
    // Adjust the maxY value based on selected parameter
    if (selectedParameter == 'Temperature') {
      return 100; // Max temperature value
    } else if (selectedParameter == 'Humidity') {
      return 100; // Max humidity value
    } else {
      return 100; // Example for 'Both'
    }
  }

  String _getXTitle(double value) {
    // Example X-axis titles based on selected timeline
    if (selectedTimeline == 'Day') {
      return value.toInt().toString();
    } else if (selectedTimeline == 'Month') {
      return (value.toInt() + 1).toString();
    } else {
      return (value.toInt() + 1).toString();
    }
  }

  String _getYTitle(double value) {
    // Example Y-axis titles based on selected parameter
    return value.toInt().toString();
  }

  Widget _buildDropdownMenus() {
    return Positioned(
      top: 40,
      left: 16,
      right: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: DropdownButtonFormField<String>(
              value: selectedTimeline,
              items: ['Day', 'Month', 'Year']
                  .map((timeline) => DropdownMenuItem<String>(
                        value: timeline,
                        child: Text(timeline,
                            style: GoogleFonts.oxygen(fontSize: 16)),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedTimeline = value!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 12), // Space between dropdowns
          Expanded(
            child: DropdownButtonFormField<String>(
              value: selectedParameter,
              items: ['Temperature', 'Humidity', 'Both']
                  .map((parameter) => DropdownMenuItem<String>(
                        value: parameter,
                        child: Text(parameter,
                            style: GoogleFonts.oxygen(fontSize: 16)),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedParameter = value!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackAndExportButtons(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous screen
            },
            child: Text(
              'Back',
              style: GoogleFonts.oxygen(fontSize: 18, color: Colors.white),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Csvoptions()), // Navigate to Csv1 screen
              );
            },
            child: Text(
              'Export',
              style: GoogleFonts.oxygen(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
