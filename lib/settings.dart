import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
            tabs: [Tab(text: 'Logout', icon: Icon(Icons.arrow_downward))],
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(
          image:
              NetworkImage('https://brand.utm.my/files/2016/08/LOGO-UTM.png'),
          width: 100.0,
          height: 77.0,
        ),
        // Container(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text('Settings'),
        //     )
      ],
    ),
  );
}

// class ImageAsset  extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     AssetImage assetImage = AssetImage('images\LOGO-UTM.png');
//     Image image = Image(image: assetImage);
//     return Container(
//       child: image,
//     );
//   }
// }
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
        title: Text('Notifications'),
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
    ]);
  }
}