import 'package:flutter/material.dart';
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
          headline1: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          bodyText2: TextStyle(fontSize: 25),
        ),
      ),
      // home: LoginPage(),
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        Home.routeName: (context) => const Home(),
      },
      initialRoute: Home.routeName,
    );
  }
}