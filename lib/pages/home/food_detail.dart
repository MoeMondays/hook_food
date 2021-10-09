import 'package:flutter/material.dart';
import 'package:hook_food/pages/home/models/food_items.dart';

class FoodDetail extends StatelessWidget {
  static const routeName = "/food_Detail";

  const FoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var detail = ModalRoute.of(context)!.settings.arguments as FoodItems;

    return Scaffold(
      appBar: AppBar(title: Text(detail.name)),

      body: Column(
        children: [
          Image.asset("assets/images/${detail.image}", fit: BoxFit.fill,),
          Text("ชื่อเมนู: ${detail.name}", style: Theme.of(context).textTheme.headline5,),
          Text("ราคา: ${detail.price}", style: Theme.of(context).textTheme.headline6,),
        ],
      ),
    );
  }
}
