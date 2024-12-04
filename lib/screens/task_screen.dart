import 'package:flutter/material.dart';
import 'package:todotask/screens/create_task_screen.dart';

import '../widgets/task_list.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff1c1b44),
        title: const Text(
          'Task List',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffffff)),
        ),
      ),
      backgroundColor: const Color(0xffff1c1b44),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffff41c9e2),
        child: const Icon(
          Icons.add,
          color: Color(0xffff1c1b44),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TaskFormScreen()));
        },
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: MediaQuery.of(context).size.height /
              MediaQuery.of(context).size.width,
          child: const TaskList(),
        ),
      ),
    );
  }
}
