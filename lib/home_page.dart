import 'package:flutter/material.dart';

class Homepagge extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Catelog '),
        ),
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Center(
            child: Container(
              child: Text('Day one tutorial'),
            ),
          ),
        ),
      ),
    );
  }
}
