import 'package:flutter/material.dart';
import 'package:hook_food/pages/home/food_detail.dart';
import 'package:hook_food/pages/home/home.dart';
import 'package:hook_food/pages/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
          headline3: TextStyle(fontSize: 40),
          headline4: TextStyle(fontSize: 35),
          headline5: TextStyle(fontSize: 30),
          headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 20,),
          bodyText2: TextStyle(fontSize: 15,),
        ),
      ),
      // home: LoginPage(),
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        Home.routeName: (context) => const Home(),
        FoodDetail.routeName: (context) => const FoodDetail(),
      },
      initialRoute: LoginPage.routeName,
    );
  }
}