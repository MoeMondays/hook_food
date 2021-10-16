import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = "/profile";

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Container(
                    width: 150,
                    height: 150,
                    child: Image.asset('assets/images/profile.png'),
                  )
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text("Thanakorn Hemsart", style: Theme.of(context).textTheme.headline6),
            ),
            Text("hemsart_t@silpakorn.edu", style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ),
    );
  }
}
