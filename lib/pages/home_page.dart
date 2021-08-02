import 'package:flutter/material.dart';
import 'package:testing/widgets/Drawer.dart';

class Homepagge extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home '),
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              child: Text('Day one tutorial'),
            ),
          ),
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}
