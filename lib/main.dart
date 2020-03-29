import 'package:elearning_app/ui/views/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

<<<<<<< Updated upstream
class App extends StatelessWidget {

  
=======
class App extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<App> {

  final FirebaseMessaging _messaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();

    _messaging.getToken().then((token) {
      print(token);
    });
  }
>>>>>>> Stashed changes

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
