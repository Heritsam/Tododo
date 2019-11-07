import 'package:flutter/material.dart';
import 'package:tododo/model/task.dart';
import 'package:tododo/views/widgets/task_list_item.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  const TaskList({Key key, @required this.tasks}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _getChildrenTasks(),
    );
  }

  List<Widget> _getChildrenTasks() {
    return tasks.map((todo) => TaskListItem(task: todo)).toList();
  }
}