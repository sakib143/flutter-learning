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
    await Future.delayed(Duration(seconds: 5));
   var mEncodeJson =  await rootBundle.loadString('assets/files/catelog.json');
   //After getting json formated value, now we need to decode to object.
   var mDecodeJson = jsonDecode(mEncodeJson);
   var productArray = mDecodeJson['products'];
   CatalogModel.items = List.from(productArray).map<Item>((itm) => Item.fromMap(itm)).toList();

   setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home '),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child:(CatalogModel.items.isNotEmpty ) ? ListView.builder(
              itemCount: CatalogModel.items.length,
              itemBuilder: (context,index) {
                return ItemWidget(item: CatalogModel.items[index]);
              },
            ) : Center(
              child: CircularProgressIndicator(),
            ) ,
          ),
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}
