import 'package:flutter/cupertino.dart';
import 'package:todotask/model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];

  int get taskCount {
    return tasks.length;
  }

  void createTask(String newTaskTitle, newTaskDescription) {
    final task = Task(name: newTaskTitle, description: newTaskDescription);
    tasks.add(task);
    notifyListeners();
  }

  void toggleChecked(int index, bool? value) {
    tasks[index].isDone = value ?? false;
    notifyListeners();
  }

  void updateTask(int index, Task task) {
    tasks[index] = task;
    notifyListeners();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}
