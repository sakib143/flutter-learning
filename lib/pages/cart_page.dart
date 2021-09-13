import 'package:flutter/material.dart';
import 'package:testing/model/cart_model.dart';
import 'package:testing/widgets/MyTheme.dart';
import 'package:velocity_x/velocity_x.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: 'My Cart'.text.black.make(),
      ),
      body: Column(
        children: [
          CartList().p32().expand(),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
   final CartModel model = CartModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${model.totalPrice}".text.xl.make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              //Showing snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: "Buying not supported yet.".text.make()),
              );
            },
            child: "Buy".text.make(),
          )
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  final CartModel model = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: model.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.remove_circle_outline),
        ),
        title: model.items[index].name.text.make(),
      ),
    );
  }
}
