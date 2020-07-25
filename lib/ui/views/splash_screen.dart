import 'dart:async';

import 'package:elearning_app/ui/views/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    loading();
  }

  Future<Timer> loading() async {
    return new Timer(Duration(seconds: 3), finishLoading);
  }

  finishLoading() async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/images/LOGO-UTM.png'),
        Text('UTM e-learning Application',
            style: TextStyle(fontSize: 15, color: Colors.white)),
        SizedBox(height: 50),
        
      ],
    );
  }
}