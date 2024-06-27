import 'package:flutter/material.dart';
import 'package:my_todo_manager/models/tasks_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = "";

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            style: TextStyle(
              fontSize: 30,
              color: Colors.lightBlueAccent,
            ),
            textAlign: TextAlign.center,
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTaskTitle = newText;
            },
          ),
          FloatingActionButton(
            onPressed: () {
              Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
              Navigator.pop(context);
            },
            child: Text("Add"),
            backgroundColor: Colors.lightBlueAccent,
          )
        ],
      ),
    );
  }
}
