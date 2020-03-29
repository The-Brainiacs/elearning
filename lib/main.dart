import 'package:elearning_app/ui/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() => runApp(App());

class App extends StatefulWidget {

class _MyAppState extends State<MyApp> {

  

 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        primaryColor: Color(0xff5c001e),
        fontFamily: 'Arial',
      ),
    home: LoginPage(),
   );
 }
}
}