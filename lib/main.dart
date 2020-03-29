import 'package:elearning_app/ui/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() => runApp(App());


class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
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
<<<<<<< HEAD
}

Widget _myListView(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        title: Text('Dashboard'),
        leading: Icon(Icons.folder, color: Color(0xff5c001e)),
      ),
      ListTile(
        title: Text('Profile'),
        leading: Icon(Icons.person, color: Color(0xff5c001e)),
      ),
      ListTile(
        title: Text('Messages'),
        leading: Icon(Icons.
        message, color: Color(0xff5c001e)),
      ),
      ListTile(
        title: Text('Notification'),
        leading: Icon(Icons.notifications, color: Color(0xff5c001e)),
      ),
      ListTile(
        title: Text('Private Files'),
        leading: Icon(Icons.lock, color: Color(0xff5c001e)),
      ),
      ListTile(
        title: Text('Calendar'),
        leading: Icon(Icons.calendar_today, color: Color(0xff5c001e)),
      ),
      ListTile(
        title: Text('Archive'),
        leading: Icon(Icons.archive, color: Color(0xff5c001e)),
=======
  
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        primaryColor: Color(0xff5c001e),
        fontFamily: 'Arial',
>>>>>>> 75a5540437f542baf0a91d0aaade9dae8335bfe7
      ),
    home: LoginPage(),
   );
 }
}
