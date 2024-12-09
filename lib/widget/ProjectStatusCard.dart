import 'package:flutter/material.dart';

class ProjectStatusCard extends StatelessWidget {
  final List<Map<String, dynamic>> projects = [
    {"name": "Project A", "progress": 30, "duration": "2 Months"},
    {"name": "Project B", "progress": 51, "duration": "3 Months"},
    {"name": "Project C", "progress": 65, "duration": "1 Month"},
    {"name": "Project D", "progress": 70, "duration": "2 Months"},
    {"name": "Project E", "progress": 25, "duration": "3 Months"},
    {"name": "Project F", "progress": 80, "duration": "4 Months"},
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Project Status",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(2),
              },
              children: [
                _buildHeaderRow(),
                ...projects.map((project) => _buildProjectRow(project)).toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      children: [
        _buildTableHeader("Project"),
        _buildTableHeader("Progress"),
        _buildTableHeader("Duration"),
      ],
    );
  }

  TableRow _buildProjectRow(Map<String, dynamic> project) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            project['name'],
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: project['progress'] / 100,
                  backgroundColor: Colors.grey[300],
                  color: Colors.blue,
                  minHeight: 6,
                ),
              ),
              SizedBox(width: 8),
              Text(
                "${project['progress']}%",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            project['duration'],
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget _buildTableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
