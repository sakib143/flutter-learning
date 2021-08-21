import 'package:flutter/material.dart';
import 'package:testing/model/CatelogModel.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print('${item.name} is pressed');
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
            '\$${item.price.toString()}',
            textScaleFactor: 1.5,
            style:
                TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
