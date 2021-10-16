import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hook_food/pages/home/food_list_page.dart';
import 'package:hook_food/pages/home/order_page.dart';
import 'package:hook_food/pages/profile/profile_page.dart';
import 'package:http/http.dart' as http;

import 'models/food_items.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _subPageIndex = 0;
  var _selectedBottomNavIndex = 0;
  List _title = ["Food","Profile"];
  int _page = 0;

  _selectedColor(String title){
    if(_title[_page] == title)
      return Colors.blue;
    else
      return Colors.black;
  }

  Row _buildDrawerItem(Widget icon, String title) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: icon,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: _selectedColor(title),
            fontWeight: FontWeight.normal
          ),
        ),
      ],
    );
  }

  _buildFoodPage(){
    switch(_selectedBottomNavIndex){
      case 0:
        return FoodListPage();
      case 1:
        return OrderPage();
    }
  }

  _buildSubPage(){
    switch(_subPageIndex){
      case 0:
        return _buildFoodPage();
      case 1:
        return ProfilePage();
    }
  }

  _showSubPage(int index){
    setState(() {
      _subPageIndex = index;
      _page = index;
      Navigator.of(context).pop();
    });
  }

  _test() async {
    var url = Uri.parse("https://cpsu-test-api.herokuapp.com/foods");
    var response = await http.post(url, body: {
      "pin": "123456"
    });
    if(response.statusCode == 200){
      Map<String,dynamic> jsonBody = json.decode(response.body);
      String status = jsonBody["status"];
      String? message = jsonBody["message"];
      List<dynamic> data = jsonBody["data"];

      var foodList = data.map((element) => FoodItems(
        id: element["id"],
        name: element["name"],
        price: element["price"],
        image: element["image"],
      )).toList();

      print("press");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title[_page]),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.refresh)),
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          child: Image.asset('assets/images/profile.png'),
                        )
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text("Thanakorn Hemsart", style: Theme.of(context).textTheme.headline6),
                  ),
                  Text("hemsart_t@silpakorn.edu", style: Theme.of(context).textTheme.bodyText2),
                ],
              ),
            ),

            ListTile(
              title: _buildDrawerItem(Icon(Icons.fastfood, color: _selectedColor("Food"),), "Food"),
              onTap: () => _showSubPage(0),
            ),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.person, color: _selectedColor("Profile"),), "Profile"),
              onTap: () => _showSubPage(1),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _test,
        child: Icon(Icons.add),
      ),

      bottomNavigationBar: _subPageIndex == 0 ? BottomNavigationBar(
        currentIndex: _selectedBottomNavIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Menu",),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Your Order",),
        ],
        onTap: (index){
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ) : SizedBox.shrink(),

      body: Center(
        child: _buildSubPage(),
      ),
    );
  }
}
