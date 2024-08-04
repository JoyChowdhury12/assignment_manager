import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Task Title",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Task subtitle/caption"),
            Row(
              children: [Chip(label: Text("New"))],
            )
          ],
        ),
      ),
    );
  }
}
