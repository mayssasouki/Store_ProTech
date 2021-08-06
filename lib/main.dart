import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card_ui/views/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Grocery Store',
      theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: 'JosefinSans',
      ),
      home: MyHomePage(),
    );
  }
}























