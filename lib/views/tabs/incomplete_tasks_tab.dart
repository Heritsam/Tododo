import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tododo/views/widgets/task_list.dart';
import 'package:tododo/providers/todos_model.dart';

class IncompleteTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<TodosModel>(
        builder: (context, todos, child) {
          return TaskList(
            tasks: todos.incompleteTasks,
          );
        },
      ),
    );
  }
}