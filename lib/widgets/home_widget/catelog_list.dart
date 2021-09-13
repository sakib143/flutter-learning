import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:testing/model/CatelogModel.dart';
import 'package:testing/model/cart_model.dart';
import 'package:testing/pages/home_details.dart';
import 'package:testing/utils/MyRoutes.dart';
import 'package:testing/widgets/MyTheme.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetails(catelog: catalog),
            ),
          ),
          child: CatalogItem(catelog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catelog;
  const CatalogItem({
    Key? key,
    required this.catelog,
  })  : assert(catelog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catelog.id.toString()),
          child: CatelogImage(image: catelog.image),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catelog.name.text.bold.make(),
              catelog.desc.text.make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catelog.price}".text.bold.xl.make(),
                  AddToCart(item: catelog)
                ],
              )
            ],
          ),
        )
      ],
    )).white.square(150).roundedLg.py12.make();
  }
}

class AddToCart extends StatefulWidget {
  final Item item;
  const AddToCart({Key? key, required this.item}) : super(key: key);
  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
 bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle(); //VelocityX library change boolean value simulatniosly
        final _catelog = CatalogModel();
        final _cart = CartModel();
        _cart.catelog = _catelog;
        _cart.addItem(widget.item);
        setState(() {});
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            MyTheme.darkBluishColor,
          ),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isAdded ? Icon(Icons.done) : "Add to cart".text.make(),
    );
  }
}

class CatelogImage extends StatelessWidget {
  final String image;
  const CatelogImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Image.network(image)
            .box
            .rounded
            .p8
            .color(MyTheme.creamColor)
            .make()
            .p16()
            .w40(context)
      ],
    )).white.roundedLg.py12.make();
  }
}
