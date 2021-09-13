import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$50".text.xl.make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {},
            child: "Buy".text.make(),
          )
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          onPressed: (){},
          icon: Icon(Icons.remove_circle_outline),
        ),
        title: "Product one".text.make(),
      ),
    );
  }
}
