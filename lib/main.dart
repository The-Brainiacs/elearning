import 'package:elearning_app/settings.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
      title: 'Settings',
      theme: ThemeData(
        primaryColor: Color(0xFFFFE6A2),
        fontFamily: 'Arial',
      ),
    home: Settings(),
   );
 }
}
