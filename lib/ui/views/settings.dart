import 'package:elearning_app/ui/shared/dashboard_data.dart';
import 'package:elearning_app/ui/views/calendar.dart';
import 'package:elearning_app/ui/views/messages.dart';
import 'package:elearning_app/ui/views/notifications.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/ui/views/profile.dart';
import 'package:elearning_app/ui/views/login_page.dart';

import 'dashboard.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      initialIndex: 0,
      child: Scaffold(
        appBar: buildAppBar(),
        body: Center(child: BodyLayout()),
        bottomNavigationBar: Container(
          color: Color(0xff5c001e),
          child: TabBar(
            indicatorColor: Color(0xffffffff),
            tabs: [
              GestureDetector(
                onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage())),
                child: Tab(
                  text: 'Logout',
                  icon: Icon(Icons.arrow_downward),
                  
                ),
              )
            ],
            labelColor: Color(0xffffffff),
          ),
        ),
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Text('Settings'),
        )
      ],
    ),
  );
}

class BodyLayout extends StatefulWidget {
  @override
  _BodyLayoutState createState() => _BodyLayoutState();
}

class _BodyLayoutState extends State<BodyLayout> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      ListTile(
        title: Text('Dashboard'),
        leading: Icon(Icons.folder, color: Color(0xff5c001e)),
        onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardPage(mockDataDashboard))),
      ),
      ListTile(
        title: Text('Profile'),
        leading: Icon(Icons.person, color: Color(0xff5c001e)),
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfilePage())),
      ),
      ListTile(
        title: Text('Messages'),
        leading: Icon(Icons.message, color: Color(0xff5c001e)),
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => MessagesPage())),

      ),
      ListTile(
        title: Text('Notifications'),
        leading: Icon(Icons.notifications, color: Color(0xff5c001e)),
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => NotificationsPage())),
      ),
      ListTile(
        title: Text('Private Files'),
        leading: Icon(Icons.lock, color: Color(0xff5c001e)),
      ),
      ListTile(
        title: Text('Calendar'),
        leading: Icon(Icons.calendar_today, color: Color(0xff5c001e)),
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => CalendarPage())),
      ),
      ListTile(
        title: Text('Archive'),
        leading: Icon(Icons.archive, color: Color(0xff5c001e)),
      ),
      ListTile(
        title: Text('Help'),
        leading: Icon(Icons.help, color: Color(0xff5c001e)),
      )
    ]);
  }
}
