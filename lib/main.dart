import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  final FirebaseMessaging _messaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();

    _messaging.getToken().then((token) {
      print(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Settings',
      theme: ThemeData(
        primaryColor:  Color(0xff5c001e),    
        fontFamily: 'Arial',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('Settings'),
              )
            ],
          ),
        ),
        body: Center(child: BodyLayout()),
        bottomNavigationBar: buildBottomAppBar(),
      ),
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
        color: Color(0xff5c001e),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text('Logout'),

            )
          ],
        ),
      );
  }
}

class BodyLayout extends StatefulWidget {
  @override
  _BodyLayoutState createState() => _BodyLayoutState();
}

class _BodyLayoutState extends State<BodyLayout> {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
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
        leading: Icon(Icons.message, color: Color(0xff5c001e)),
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
      ),
      ListTile(
        title: Text('Help'),
        leading: Icon(Icons.help, color: Color(0xff5c001e)),
      )
    ],
  );
}
