import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing/model/CatelogModel.dart';
import 'package:testing/utils/MyRoutes.dart';
import 'package:testing/widgets/MyTheme.dart';
import 'package:testing/widgets/home_widget/Catelog_header.dart';
import 'package:testing/widgets/home_widget/catelog_list.dart';
import 'package:velocity_x/velocity_x.dart';

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
    var mEncodeJson = await rootBundle.loadString('assets/files/catelog.json');
    //After getting json formated value, now we need to decode to object.
    var mDecodeJson = jsonDecode(mEncodeJson);
    var productArray = mDecodeJson['products'];
    CatalogModel.items =
        List.from(productArray).map<Item>((itm) => Item.fromMap(itm)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyTheme.darkBluishColor,
          child: Icon(CupertinoIcons.cart),
          onPressed: () => Navigator.pushNamed(context, MyRoutess.cartRoute),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatelogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand()
              ],
            ),
          ),
        ));
  }
}
