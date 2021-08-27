import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing/model/CatelogModel.dart';
import 'package:testing/widgets/Drawer.dart';
import 'package:testing/widgets/ItemWidget.dart';

class Homepagge extends StatefulWidget {

  @override
  _HomepaggeState createState() => _HomepaggeState();
}

class _HomepaggeState extends State<Homepagge> {

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
   var mEncodeJson =  await rootBundle.loadString('assets/files/catelog.json');
   //After getting json formated value, now we need to decode to object.
   var mDecodeJson = jsonDecode(mEncodeJson);
  }

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(5, (index) => CatalogModel.items[0]);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home '),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              // itemCount: CatalogModel.items.length,
              // itemBuilder: (context,index) {
              //   return ItemWidget(item: CatalogModel.items[index]);
              // },


              //Here we have load static array value.
              itemCount: dummyList.length,
              itemBuilder: (context,index) {
                return ItemWidget(item: dummyList[index]);
              },
            ),
          ),
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}
