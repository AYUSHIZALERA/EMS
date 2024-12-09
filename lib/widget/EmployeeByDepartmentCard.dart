import 'package:flutter/material.dart';


class EmployeeByDepartmentCard extends StatelessWidget {
  final List<Map<String, dynamic>> departments = [
    {"name": "UI / UX", "percentage": 60},
    {"name": "Development", "percentage": 90},
    {"name": "Management", "percentage": 40},
    {"name": "HR", "percentage": 20},
    {"name": "Testing", "percentage": 50},
    {"name": "Marketing", "percentage": 80},
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Employees By department",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.calendar_today, size: 16),
                  label: Text("This Week", style: TextStyle(fontSize: 14)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Column(
              children: departments.map((department) {
                return _buildDepartmentRow(department['name'], department['percentage']);
              }).toList(),
            ),
            SizedBox(height: 16),
            Divider(color: Colors.grey[300]),
            SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.blue[900],
                ),
                SizedBox(width: 8),
                RichText(
                  text: TextSpan(
                    text: "No of Employees increased by ",
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                    children: [
                      TextSpan(
                        text: "+20%",
                        style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: " from last week"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDepartmentRow(String name, int percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              name,
              style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: percentage / 100,
                  child: Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
