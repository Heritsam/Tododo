import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tododo/providers/todos_model.dart';
import 'package:tododo/model/task.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final taskTitleController = TextEditingController();
  bool completedStatus = false;

  @override
  void dispose() {
    taskTitleController.dispose();
    super.dispose();
  }

  void onAdd() {
    final String textVal = taskTitleController.text;
    final bool completed = completedStatus;

    if (textVal.isNotEmpty) {
      final Task todo = Task(
        title: textVal,
        completed: completed,
      );
      Provider.of<TodosModel>(context, listen: false).addTodo(todo);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Task'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          TextField(
            controller: taskTitleController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title',
              prefixIcon: Icon(Icons.label_outline),
            ),
            textCapitalization: TextCapitalization.words,
          ),
          CheckboxListTile(
            value: completedStatus,
            onChanged: (checked) => setState(() {
              completedStatus = checked;
            }),
            title: Text('Complete?'),
          ),
          RaisedButton(
            child: Text('ADD'),
            onPressed: onAdd,
          ),
        ],
      ),
    );
  }
}