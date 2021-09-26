import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hook_food/pages/home/home.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/login";

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String input = "";

  _handleClickButton(int num){
    setState(() {
      if(num >= 0)
        input += num.toString();

      if(num==-1 && input.length>0)
        input = input.substring(0, input.length-1);

      if(input.length == 6){
        if(input == "123456"){
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => Home()),
          // );
          Navigator.pushReplacementNamed(context, "/home");
        }
        else{
          _errorDialog();
          input = "";
        }
      }
    });
  }

  _inputContainer(int n){
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: input.length>=n ? Colors.blue : Colors.blue.shade200,
        ),
      ),
    );
  }

  _errorDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("ERROR"),
          content: Text("Invalid PIN. Please try again"),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            )
          ],
        );
      },
    );
  }

  Container _buildButton() {
    return Container(
      // color: Colors.pink,
      child: Column(
        children: [
          [ 1, 2, 3],
          [ 4, 5, 6],
          [ 7, 8, 9],
          [-2, 0,-1],
        ].map((row){
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: row.map((item){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: LoginButton(
                  num: item,
                  onClick: (){_handleClickButton(item);},
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }

  Expanded _buildLockInfoPanel(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.lock_outline,
            size: 100,
          ),
          Text(
            "LOGIN",
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            "Enter PIN to login",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(""),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i=1; i<=6; i++)
                _inputContainer(i),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade50,
              Colors.blue.shade50,
              Colors.blue.shade100,
            ],
          ),
        ),

        child: SafeArea(
          child: Column(
            children: [
              _buildLockInfoPanel(context),
              _buildButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final int num;
  final Function() onClick;

  const LoginButton({
    required this.num,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: num == -2 ? null : onClick,

      child: Container(
        width: 80,
        height: 80,
        decoration: num == -2 ? null : BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2),
        ),
        child: Center(
          child: num >= 0
              ? Text(
                  num.toString(),
                  style: Theme.of(context).textTheme.headline6,
                )
              : (num == -1 ? Icon(Icons.backspace_outlined, size: 30) : SizedBox.shrink()),
        ),
      ),
    );
  }
}
