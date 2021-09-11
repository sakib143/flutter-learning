import 'package:flutter/cupertino.dart';
import 'package:testing/widgets/MyTheme.dart';
import 'package:velocity_x/velocity_x.dart';


class CatelogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Catelog App'.text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        'Trending product'.text.xl2.make()
      ],
    );
  }
}