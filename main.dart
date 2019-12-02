import 'package:flutter/material.dart';
import 'home_widget.dart';
import 'Login.dart';
import 'register.dart';
import 'listtest.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VOTEBOOK',
      home: Login(),
    );
  }
}