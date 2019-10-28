import 'package:flutter/material.dart';
import 'package:my_app/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.brown,
        accentColor: Colors.orange,
      ),
    );
  }
}
