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
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Startup Name Generator",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: RandomWord(),
      ),
    );
  }
}
