import 'package:flutter/material.dart';


class NotificationsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationsPageState();
  }
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: buildBody(),
      bottomNavigationBar: buildBottomNav(),
    );
  }
}

BottomNavigationBar buildBottomNav() {
  return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff5c001e),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, color: Colors.white),
            title: Text('Calendar', style: TextStyle(color: Colors.white),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.white),
            title: Text('Notifications', style: TextStyle(color: Colors.white),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder, color: Colors.white),
            title: Text('Archive', style: TextStyle(color: Colors.white),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail, color: Colors.white),
            title: Text('Messages', style: TextStyle(color: Colors.white),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app, color: Colors.white),
            title: Text('Log Out', style: TextStyle(color: Colors.white),),
          ),
        ],
  );
}

Column buildBody() {
  return Column(children: <Widget>[
    Row( // User's default picture, name & matric id
      children: [
        Container(
          color: Color(0xEEE9EA),
          margin: EdgeInsets.all(25.0),
          child: FlutterLogo(size: 60.0,),
          //nama
          //matrik
        ),
        // Container(),
      ],
    ),
    Row( // Courses
      children: [
        Container(
          color: Colors.black,
          margin: EdgeInsets.all(25.0),
          child: FlutterLogo(size: 60.0,),
        ),
        // Container(),
      ],
    ),
    Row( // Details
      children: [
        Container(),
        // Container(),
      ],
    ),
  ]
  );
}