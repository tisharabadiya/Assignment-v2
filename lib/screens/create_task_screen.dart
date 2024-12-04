import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todotask/model/task.dart';
import 'package:todotask/model/task_data.dart';

class TaskFormScreen extends StatefulWidget {
  final Task? oldTask;
  final int? index;
  const TaskFormScreen({super.key, this.oldTask, this.index});

  @override
  State<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  String newTaskTitle = '';
  String newTaskDescription = '';
  @override
  void initState() {
    if (widget.oldTask != null) {
      newTaskTitle = widget.oldTask!.name;
      newTaskDescription = widget.oldTask!.description;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff1c1b44),
        title: const Text(
          'Create New Task',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffffff)),
        ),
      ),
      backgroundColor: const Color(0xffff1c1b44),
      body: Center(
        child: AspectRatio(
          aspectRatio: MediaQuery.of(context).size.height/
              MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.all(18.0),
                margin: const EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                    color: const Color(0xffff535c91),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: widget.oldTask?.name,
                      onChanged: (newText) {
                        newTaskTitle = newText;
                      },
                      maxLines: null,
                      style: const TextStyle(color: Color(0xffffffffff)),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                          fillColor: Color(0xffff535c91),
                          filled: true,
                          hintText: 'Enter Title: ',
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      height: 300.0,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: const Color(0xffffc3bfc5),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: TextFormField(
                        initialValue: widget.oldTask?.description,
                        onChanged: (newText) {
                          newTaskDescription = newText;
                        },
                        minLines: 10,
                        maxLength: 1000,
                        cursorColor: Colors.white,
                        maxLines: null,
                        style: const TextStyle(color: Color(0xffffffffff)),
                        decoration: const InputDecoration(
                            hintText: 'Write here...',
                            hintStyle: TextStyle(color: Colors.white70),
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: const Color(0xffff41c9e2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            padding:
                                const EdgeInsets.symmetric(vertical: 15.0)),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffff1c1b44)),
                        ),
                        onPressed: () {
                          if (newTaskTitle.isNotEmpty &&
                              newTaskDescription.isNotEmpty) {
                            if (widget.oldTask != null) {
                              Provider.of<TaskData>(context, listen: false)
                                  .updateTask(
                                      widget.index!,
                                      Task(
                                          name: newTaskTitle,
                                          description: newTaskDescription));
                            } else {
                              Provider.of<TaskData>(context, listen: false)
                                  .createTask(newTaskTitle, newTaskDescription);
                            }
                            Navigator.pop(context);
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                "Please fill all the fields!",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.red,
                            ));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
