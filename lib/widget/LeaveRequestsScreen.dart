import 'package:flutter/material.dart';


class LeaveRequestsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> leaveRequests = [
    {
      "id": "ID7865",
      "name": "Sarah Smith",
      "leaveType": "Sick Leave",
      "startDate": "05/22/2024",
      "endDate": "05/27/2024",
      "days": 6,
      "status": "Approve",
    },
    {
      "id": "ID9357",
      "name": "Sarah Smith",
      "leaveType": "Casual Leave",
      "startDate": "06/12/2024",
      "endDate": "06/15/2024",
      "days": 4,
      "status": "Reject",
    },
    {
      "id": "ID3987",
      "name": "Sarah Smith",
      "leaveType": "Marriage Leave",
      "startDate": "02/02/2024",
      "endDate": "02/12/2024",
      "days": 6,
      "status": "Pending",
    },
    {
      "id": "ID2483",
      "name": "Sarah Smith",
      "leaveType": "Maternity Leave",
      "startDate": "01/10/2024",
      "endDate": "03/10/2024",
      "days": 90,
      "status": "Approve",
    },
    {
      "id": "ID2986",
      "name": "Sarah Smith",
      "leaveType": "Unpaid Leave",
      "startDate": "06/09/2024",
      "endDate": "06/11/2024",
      "days": 3,
      "status": "Reject",
    },
    {
      "id": "ID1267",
      "name": "Sarah Smith",
      "leaveType": "Sick Leave",
      "startDate": "05/20/2024",
      "endDate": "05/22/2024",
      "days": 2,
      "status": "Pending",
    },
    {
      "id": "ID3398",
      "name": "Sarah Smith",
      "leaveType": "Casual Leave",
      "startDate": "07/10/2024",
      "endDate": "07/11/2024",
      "days": 3,
      "status": "Reject",
    },
    {
      "id": "ID7865",
      "name": "Sarah Smith",
      "leaveType": "Sick Leave",
      "startDate": "04/11/2024",
      "endDate": "04/13/2024",
      "days": 4,
      "status": "Approve",
    },
  ];

  Color getStatusColor(String status) {
    switch (status) {
      case 'Approve':
        return Colors.green;
      case 'Reject':
        return Colors.red;
      case 'Pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leave Requests'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: MaterialStateColor.resolveWith(
                  (states) => Colors.grey.shade200,
            ),
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Employee Name')),
              DataColumn(label: Text('Leave Type')),
              DataColumn(label: Text('Start Date')),
              DataColumn(label: Text('End Date')),
              DataColumn(label: Text('Days')),
              DataColumn(label: Text('Status')),
              DataColumn(label: Text('Details')),
            ],
            rows: leaveRequests.map((leave) {
              return DataRow(cells: [
                DataCell(Text(leave['id'])),
                DataCell(Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150'), // Replace with actual profile picture
                    ),
                    const SizedBox(width: 8),
                    Text(leave['name']),
                  ],
                )),
                DataCell(Text(leave['leaveType'])),
                DataCell(Text(leave['startDate'])),
                DataCell(Text(leave['endDate'])),
                DataCell(Text(leave['days'].toString())),
                DataCell(Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: getStatusColor(leave['status']).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    leave['status'],
                    style: TextStyle(
                      color: getStatusColor(leave['status']),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
                DataCell(
                  Text(
                    'Details',
                    style: TextStyle(
                      color: Colors.blue.shade700,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
