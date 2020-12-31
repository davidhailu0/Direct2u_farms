import 'dart:async';
import 'package:direct2u_farms/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(FirstScreen());

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), nextPage);
  }

  void nextPage() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUp()));
    SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff61E002),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/splash.png'), fit: BoxFit.cover),
          ),
        ));
  }
}
