import 'package:flutter/material.dart';
import 'package:testing/model/CatelogModel.dart';
import 'package:testing/widgets/Drawer.dart';
import 'package:testing/widgets/ItemWidget.dart';

class Homepagge extends StatelessWidget {

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
