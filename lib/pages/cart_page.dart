import 'package:flutter/material.dart';
import 'package:testing/widgets/MyTheme.dart';
import 'package:velocity_x/velocity_x.dart';


class MyCartPage extends StatelessWidget {
  const MyCartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: 'My Cart'.text.black.make(),
      ),
    );
  }
} 