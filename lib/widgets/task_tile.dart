import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todotask/model/task.dart';
import 'package:todotask/model/task_data.dart';
import 'package:todotask/screens/create_task_screen.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final int index;
  final Function(bool?) checkboxCallback;

  const TaskTile(
      {super.key,
      required this.task,
      required this.index,
      required this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Checkbox(
          value: task.isDone,
          onChanged: checkboxCallback,
        ),
        onLongPress: () =>
            Provider.of<TaskData>(context, listen: false).deleteTask(index),
        title: Text(
          task.name,
          style: TextStyle(
            color: Colors.white,
            decorationColor: Colors.white,
            decorationThickness: 3.0,
            decoration: task.isDone
                ? TextDecoration.lineThrough
                : null, // Add a strikethrough if checked
          ),
        ),
        subtitle: Text(
          task.description,
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: IconButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskFormScreen(
                      index: index,
                      oldTask: task,
                    ),
                  ),
                ),
            icon: const Icon(Icons.edit_rounded)));
  }
}
