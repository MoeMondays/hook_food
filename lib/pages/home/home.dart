import 'package:flutter/material.dart';
import 'package:hook_food/pages/login/login_page.dart';

class Home extends StatefulWidget {
  static const routeName = "/home";

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _subPageIndex = 0;
  var _selectedBottomNavIndex = 0;

  Row _buildDrawerItem(Widget icon, String title) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: icon,
        ),
        Text(title),
      ],
    );
  }

  _buildSubPage(){
    switch(_subPageIndex){
      case 0:
        return Text("HOME PAGE", style: Theme.of(context).textTheme.headline1,);
      case 1:
        return Text("PAGE 1", style: Theme.of(context).textTheme.headline1,);
      case 2:
        return Text("PAGE 2", style: Theme.of(context).textTheme.headline1,);
      case 3:
        return Text("SETTINGS", style: Theme.of(context).textTheme.headline1,);
    }
  }

  _showSubPage(int index){
    setState(() {
      _subPageIndex = index;
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FLUTTER FOOD"),),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                  Text("Hello World", style: TextStyle(color: Colors.white),),
                ],
              ),
            ),

            ListTile(
              title: _buildDrawerItem(Icon(Icons.home), "HOME"),
              onTap: () => _showSubPage(0),
            ),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.person), "PAGE 1"),
              onTap: () => _showSubPage(1),
            ),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.file_copy), "PAGE 2"),
              onTap: () => _showSubPage(2),
            ),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.settings), "SETTINGS"),
              onTap: () => _showSubPage(3),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedBottomNavIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        onTap: (index){
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ),

      body: Center(
        child: _buildSubPage(),
      ),
    );
  }
}
