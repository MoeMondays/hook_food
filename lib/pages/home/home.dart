import 'package:flutter/material.dart';
import 'package:hook_food/pages/home/food_list_page.dart';
import 'package:hook_food/pages/home/order_page.dart';
import 'package:hook_food/pages/home/profile_page.dart';

class Home extends StatefulWidget {
  static const routeName = "/home";

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title[_page]),),

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
                    child: Text("Thanakorn Hemsart", style: Theme.of(context).textTheme.bodyText1),
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
