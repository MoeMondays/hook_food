import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FLUTTER FOOD"),),

      body: Center(
        child: Text("THIS IS HOME PAGE", style: Theme.of(context).textTheme.headline1,),
      ),
    );
  }
}
