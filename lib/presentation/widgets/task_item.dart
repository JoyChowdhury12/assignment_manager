import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Task Title",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text("Task subtitle/caption"),
            Row(
              children: [
                const Chip(
                  label: Text("New"),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
