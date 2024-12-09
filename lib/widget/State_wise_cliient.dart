import 'package:flutter/material.dart';
import "package:pie_chart/pie_chart.dart";

class StateWiseClientCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Data for the pie chart
    Map<String, double> dataMap = {
      "Gujarat": 23,
      "Maharashtra": 32,
      "Kerala": 12,
      "Punjab": 32,
    };

    // Color scheme for the chart
    final List<Color> colorList = [
      Colors.teal,
      Colors.blue,
      Colors.orange,
      Colors.purple,
    ];

    return SizedBox(
      width: 410, // Set the width to 410
      height: 508, // Set the height to 508
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "State wise Client",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: PieChart(
                  dataMap: dataMap,
                  animationDuration: Duration(milliseconds: 900),
                  chartRadius: 150, // Reduce the radius to fit in the smaller card
                  colorList: colorList,
                  chartType: ChartType.ring,
                  ringStrokeWidth: 22, // Adjust the stroke width for proportions
                  legendOptions: LegendOptions(showLegends: false),
                  chartValuesOptions: ChartValuesOptions(
                    showChartValues: false,
                  ),
                ),
              ),
              SizedBox(height: 16),
              _buildStateRow("Gujarat", "23", "+32%", Colors.teal),
              _buildStateRow("Maharashtra", "32", "+12%", Colors.blue),
              _buildStateRow("Kerala", "12", "-12%", Colors.orange),
              _buildStateRow("Punjab", "32", "+3%", Colors.purple),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStateRow(
      String state, String clients, String change, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 6,
                backgroundColor: color,
              ),
              SizedBox(width: 8),
              Text(
                state,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                clients,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(width: 8),
              Text(
                change,
                style: TextStyle(
                  fontSize: 16,
                  color: change.startsWith('-') ? Colors.red : Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
