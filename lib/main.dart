import 'package:ems/widget/DashboardCards.dart';
import 'package:ems/widget/EmployeeByDepartmentCard.dart';
import 'package:ems/widget/JobApplicantsCard.dart';
import 'package:ems/widget/LeaveRequestsScreen.dart';
import 'package:ems/widget/State_wise_cliient.dart';
import 'package:ems/widget/todo_task.dart';
import 'package:flutter/material.dart';
import 'package:ems/deshboad.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
       // Ensures no debug banner
    );
  }
}
