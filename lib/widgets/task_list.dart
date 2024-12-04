import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todotask/model/task_data.dart';
import 'package:todotask/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      if (taskData.tasks.isEmpty) {
        return const Center(
          child: Text(
            "Create New Tasks!",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24),
          ),
        );
      }
      return ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
            task: taskData.tasks[index],
            index: index,
            checkboxCallback: (checkboxState) =>
                taskData.toggleChecked(index, checkboxState),
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
