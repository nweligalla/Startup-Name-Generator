import 'package:flutter/material.dart';
import './random_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codelab 1',
      theme: ThemeData(primaryColor: Colors.white),
      home: RandomWord(),
    );
  }
}
