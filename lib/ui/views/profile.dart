import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      initialIndex: 0,
      child: Scaffold(
      
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