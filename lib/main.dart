import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tododo/providers/todos_model.dart';
import 'package:tododo/views/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TodosModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tododo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          primaryColor: Colors.indigoAccent,
          accentColor: Colors.indigoAccent,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            textTheme: TextTheme(
              title: Theme.of(context).textTheme.title,
            ),
            actionsIconTheme: IconThemeData(
              color: Colors.black87
            ),
            iconTheme: IconThemeData(
              color: Colors.black87
            )
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.indigoAccent,
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            )
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}