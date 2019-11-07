import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tododo/model/task.dart';
import 'package:tododo/providers/todos_model.dart';

class TaskListItem extends StatelessWidget {
  final Task task;

  const TaskListItem({Key key, @required this.task}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: task.completed,
        onChanged: (bool checked) {
          Provider.of<TodosModel>(context, listen: false).toggleTodo(task);
        },
      ),
      title: Text(task.title),
      trailing: IconButton(
        icon: Icon(
          Icons.delete_outline,
          color: Colors.red,
        ),
        onPressed: () {
          final _alertDialog = AlertDialog(
            title: Text('Delete Item'),
            content: Text('Are you sure you want to delete this item?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text('NO'),
              ),
              FlatButton(
                onPressed: () {
                  Provider.of<TodosModel>(context).deleteTodo(task);
                  Navigator.pop(context);
                },
                child: Text('YES'),
              ),
            ],
          );
          showDialog(context: context, builder: (context) => _alertDialog);
        },
      ),
    );
  }
}