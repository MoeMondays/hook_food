import 'package:flutter/material.dart';
import 'package:hook_food/pages/home/food_detail.dart';
import 'package:hook_food/pages/home/models/food_items.dart';

class FoodListPage extends StatefulWidget {
  static const routeName = "/food_list";

  const FoodListPage({Key? key}) : super(key: key);

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  List<FoodItems> items = [
    FoodItems(id: 1, name: "ข้าวไข่เจียว", price: 25, image: "kao_kai_jeaw.jpg"),
    FoodItems(id: 2, name: "ข้าวหมูแดง", price: 30, image: "kao_moo_dang.jpg"),
    FoodItems(id: 3, name: "ข้าวมันไก่", price: 30, image: "kao_mun_kai.jpg"),
    FoodItems(id: 4, name: "ข้าวหน้าเป็ด", price: 30, image: "kao_na_ped.jpg"),
    FoodItems(id: 5, name: "ข้าวพัด", price: 30, image: "kao_pad.jpg"),
    FoodItems(id: 6, name: "ผัดซีอิ้ว", price: 30, image: "pad_sie_eew.jpg"),
    FoodItems(id: 7, name: "ผัดไทย", price: 30, image: "pad_thai.jpg"),
    FoodItems(id: 8, name: "ราดหน้า", price: 30, image: "rad_na.jpg"),
    FoodItems(id: 8, name: "ส้มตำ ไก่ย่าง", price: 30, image: "som_tum_kai_yang.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index){
          FoodItems item = items[index];

          return Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                print(item);
                Navigator.pushNamed(
                  context,
                  FoodDetail.routeName, //FoodDetails
                  arguments: item,
                );
              },
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/${item.image}",
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name, style: Theme.of(context).textTheme.bodyText1,),
                      Text("${item.price} บาท", style: Theme.of(context).textTheme.bodyText2,),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
