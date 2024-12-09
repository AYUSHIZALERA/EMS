import 'package:flutter/material.dart';

class TodoWidget extends StatefulWidget {
  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  final List<Map<String, dynamic>> _tasks = [
    {"task": "Add Holidays", "isDone": false},
    {"task": "Add Meeting to Client", "isDone": false},
    {"task": "Chat with Adrian", "isDone": false},
    {"task": "Management Call", "isDone": false},
    {"task": "Add Payroll", "isDone": false},
    {"task": "Add Policy for Increment", "isDone": false},
  ];

  final TextEditingController _taskController = TextEditingController();

  void _toggleTask(int index) {
    setState(() {
      _tasks[index]['isDone'] = !_tasks[index]['isDone'];
    });
  }

  void _addTask(String newTask) {
    if (newTask.isNotEmpty) {
      setState(() {
        _tasks.add({"task": newTask, "isDone": false});
      });
      _taskController.clear();
    }
  }

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add New Task"),
          content: TextField(
            controller: _taskController,
            decoration: const InputDecoration(hintText: "Enter task"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                _addTask(_taskController.text);
                Navigator.of(context).pop();
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Todo task",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {Text('today',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold));},
                      icon: const Icon(Icons.calendar_today, color: Colors.black),
                    ),
                    IconButton(
                      onPressed: _showAddTaskDialog,
                      icon: const Icon(Icons.add, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Task List
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return _buildTodoItem(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTodoItem(int index) {
    final task = _tasks[index];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Checkbox(
            value: task['isDone'],
            onChanged: (_) => _toggleTask(index),
            checkColor: Colors.white,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              task['task'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: task['isDone'] ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
