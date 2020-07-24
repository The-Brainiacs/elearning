import 'package:elearning_app/ui/models/student.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/ui/views/edit_profile.dart';
import 'package:elearning_app/ui/views/dashboard.dart';
import 'package:elearning_app/ui/shared/dashboard_data.dart';
import 'package:elearning_app/ui/views/user_details.dart';

import 'package:elearning_app/services/profile_data_service.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  //list course
  List<Course> _course;
  List<Student> _student;

  final dataService = StudentDataService(); 

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Student>>(
        future: dataService.getAllStudent(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _student = snapshot.data;
            return _buildMainScreen();
          }
          return _buildFetchingDataScreen();
        });
  }

  Scaffold _buildMainScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: new SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildProfileInfoContainer(),
              _buildCoursesContainer(),
              buildDetailsContainer(),
            ]),
      ),
      bottomNavigationBar: buildBottomNav(),
    );
  }

  Widget buildStudentDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Details',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19.0,
                  color: Color(0xff5c001e)),
            ),
            Text(
              '+3 more',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
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
            InkWell(
              child: new Text(
                'User Details',
                style: TextStyle(fontSize: 17.0, color: Color(0xff5c001e)),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserDetailsPage()),
              ),
            ),
            SizedBox(
              height: 5,
              width: 300,
            ),
            InkWell(
              child: new Text(
                'Privacy And Policy',
                style: TextStyle(fontSize: 17.0, color: Color(0xff5c001e)),
              ),
              onTap: () {
                print('Not Available yet');
              },
            ),
            SizedBox(
              height: 5,
              width: 300,
            ),
            InkWell(
              child: new Text(
                'Reports',
                style: TextStyle(fontSize: 17.0, color: Color(0xff5c001e)),
              ),
              onTap: () {
                print('Not Available yet');
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEditProfileButton() {
    return FlatButton(
        child: Text('Edit Profile'),
        color: Color(0xff5c001e),
        textColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditProfilePage()), //TODO
          );
        });
  }

  Widget buildFutureStudentCourse(BuildContext context) {
    return FutureBuilder<List<Course>>(
        future: dataService.getAllCourses(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _course = snapshot.data;
            return _buildStudentCourses();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 5,
                width: 300,
              ),
              CircularProgressIndicator(),
              SizedBox(
                height: 5,
                width: 300,
              ),
            ],
          );
        });
  }

  Widget _buildStudentCourses() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              child: new Text(
                'Courses',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19.0,
                    color: Color(0xff5c001e)),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DashboardPage(mockDataDashboard)),
              ),
            ),
            InkWell(
              child: Text(
                '+' + (_course.length-2).toString() + ' more', //Course length
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Color(0xff5c001e)),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DashboardPage(mockDataDashboard)),
              ),
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
            Text(
              _course[0].title, // Title Course
              style: TextStyle(fontSize: 17.0, color: Color(0xff5c001e)),
            ),
            SizedBox(
              height: 5,
              width: 300,
            ),
            Text(
              _course[1].title, // Title Course
              style: TextStyle(fontSize: 17.0, color: Color(0xff5c001e)),
            ),
          ],
        ),
      ],
    );
  }

  Container _buildCoursesContainer() {
    return Container(
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
      child: Align(
        alignment: Alignment.centerLeft,
        child: buildFutureStudentCourse(context),
      ),
    );
  }

  Container buildProfileInfoContainer() {
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
              _student[0].name, // Name
              style: TextStyle(
                fontSize: 20.0,
                color: Color(0xff5c001e),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _student[0].matric, // Matric
              style: TextStyle(
                fontSize: 17.0,
                color: Color(0xff5c001e),
              ),
            ),
            _buildEditProfileButton(),
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
