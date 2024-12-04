import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todotask/model/task_data.dart';
import 'package:todotask/screens/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        theme: ThemeData.dark(useMaterial3: true),
        home: const TaskScreen(),
      ),
    );
  }
}
