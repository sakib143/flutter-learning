import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing/pages/Login_page.dart';
import 'package:testing/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => LoginPage(),
        "/login": (context) => LoginPage(),
      },
    );
  }
}
