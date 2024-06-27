import 'package:flutter/material.dart';
import 'tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:my_todo_manager/models/tasks_data.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            itemBuilder: (context, index) {
              final task = taskData.tasks[index];
              return TaskTile(
                  taskTitle: task.name,
                  isChecked: task.isDone,
                  checkboxCallback: (checkboxState) {
                    taskData.updateTask(task);
                  },
                  longPressCallback: () {
                    taskData.deleteTask(task);
                  },

              );
            },
            itemCount: taskData.taskCount);
      }
    );
  }
}
