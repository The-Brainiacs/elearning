
import 'package:elearning_app/ui/views/splash_screen.dart';

import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UTM e-Learning Application',
      theme: ThemeData(
        primaryColor: Color(0xff5c001e),
        fontFamily: 'Arial',
      ),
      home: SplashScreen(),
    );
  }
}
