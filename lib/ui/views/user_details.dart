import 'package:elearning_app/ui/models/student.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/ui/views/profile.dart';
import 'package:elearning_app/services/profile_data_service.dart';

class UserDetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserDetailsPageState();
  }
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  Student _student;

  final dataService = StudentDataService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Student>(
        future: dataService.getStudent(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _student = snapshot.data;
            return _buildMainScreen();
          }
          return _buildFetchingDataScreen();
        });
  }

  Widget _buildMainScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildProfileInfoContainer(),
              buildDetailsContainer(),
              Container(
                width: 360,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 20.0,
                ),
                child: Align(
                  child: Column(
                    children: <Widget>[
                      Text(
                        '*Changes in Student\'s Name and Matric Number must be made by School\'s Admin',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xff5c001e),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                        width: 300,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
      bottomNavigationBar: buildBottomNav(),
    );
  }

  Widget buildProfileInfoContainer() {
    return Container(
      width: 360,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 20.0,
      ),
      child: Align(
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile_picture.jpg'),
            ),
            Text(
              _student.name,
              style: TextStyle(
                fontSize: 20.0,
                color: Color(0xff5c001e),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _student.matric,
              style: TextStyle(
                fontSize: 17.0,
                color: Color(0xff5c001e),
              ),
            ),
            FlatButton(
                child: Text('Profile'),
                color: Color(0xff5c001e),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                }),
            SizedBox(
              height: 10,
              width: 300,
              child: Divider(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDetailsContainer() {
    return Container(
      // Details
      width: 360,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 25.0,
      ),
      decoration: BoxDecoration(
          color: Color(0xffEEE9EA),
          border: Border.all(
            color: Color(0xff5c001e),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          )),
      child: buildStudentDetails(),
    );
  }

  Column buildStudentDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'User Details',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19.0,
                  color: Color(0xff5c001e)),
            ),
          ],
        ),
        SizedBox(
          height: 5,
          width: 300,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 5,
              width: 300,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Email: ' + _student.email,
                  style: TextStyle(fontSize: 17.0, color: Color(0xff5c001e)),
                ),
              ],
            ),
            SizedBox(
              height: 5,
              width: 300,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Phone: ' + _student.phone,
                  style: TextStyle(fontSize: 17.0, color: Color(0xff5c001e)),
                ),
              ],
            ),
            SizedBox(
              height: 5,
              width: 300,
            ),
            SizedBox(
              height: 5,
              width: 300,
            ),
            SizedBox(
              height: 5,
              width: 300,
            ),
          ],
        ),
      ],
    );
  }

  BottomNavigationBar buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff5c001e),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today, color: Colors.white),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications, color: Colors.white),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.folder, color: Colors.white),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mail, color: Colors.white),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.exit_to_app, color: Colors.white),
          title: Text(''),
        ),
      ],
    );
  }

  // The fetching screen (loading)
  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching quotes... Please wait'),
          ],
        ),
      ),
    );
  }
}
