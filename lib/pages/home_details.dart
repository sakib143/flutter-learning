import 'package:flutter/material.dart';
import 'package:testing/model/CatelogModel.dart';
import 'package:testing/widgets/MyTheme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetails extends StatelessWidget {
  final Item catelog;

  const HomeDetails({Key? key, required this.catelog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          "\$${catelog.price}".text.bold.xl4.red800.make(),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  MyTheme.darkBluishColor,
                ),
                shape: MaterialStateProperty.all(
                  StadiumBorder(),
                )),
            child: "Add to cart".text.make(),
          ).wh(130, 45)
        ],
      ).p32(),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: Key(catelog.id.toString()),
              child: Image.network(catelog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                height: 30.0,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catelog.name.text.bold.xl4.make(),
                      catelog.desc.text.xl.make(),
                      10.heightBox,
                    ],
                  ).py64(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
