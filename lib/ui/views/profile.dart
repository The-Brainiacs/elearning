import 'package:flutter/material.dart';
// import 'package:elearning_app/ui/views/login_page.dart';


class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildProfileInfoContainer(),
            buildCoursesContainer(),
            buildDetailsContainer(),
          ]
        )
      ),
      bottomNavigationBar: buildBottomNav(),
    );
  }
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
            'Muhammad Aiman Bin Azwak',
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xff5c001e),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'A17CS0000',
            style: TextStyle(
              fontSize: 17.0,
              color: Color(0xff5c001e),
            ),
          ),
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

Container buildCoursesContainer() {
  return Container( // Courses
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
      )
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: buildStudentCourses(),
    ),
  );
}

Container buildDetailsContainer() {
  return Container( // Details
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
      )
    ),
    child: buildStudentDetails(),
  );
}

Column buildStudentCourses() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Text(
            'Courses', 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19.0,
              color: Color(0xff5c001e)
            ),
          ),
          Text(
            '+4 more', 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Color(0xff5c001e)
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
            'Software Engineering Project 1 (SCSJ3032-01)', 
            style: TextStyle(
              fontSize: 17.0,
              color: Color(0xff5c001e)
            ),
          ),
          SizedBox(
            height: 5,
            width: 300,
          ),
          Text(
            'Theory Of Computer Science (SCSJ3203-05)', 
            style: TextStyle(
              fontSize: 17.0,
              color: Color(0xff5c001e)
            ),
          ),
        ],
      ),
    ],
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
            'Details', 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19.0,
              color: Color(0xff5c001e)
            ),
          ),
          Text(
            '+3 more', 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Color(0xff5c001e)
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
            'User Details', 
            style: TextStyle(
              fontSize: 17.0,
              color: Color(0xff5c001e)
            ),
          ),
          SizedBox(
            height: 5,
            width: 300,
          ),
          Text(
            'Privacy And Policy', 
            style: TextStyle(
              fontSize: 17.0,
              color: Color(0xff5c001e)
            ),
          ),
          SizedBox(
            height: 5,
            width: 300,
          ),
          Text(
            'Reports', 
            style: TextStyle(
              fontSize: 17.0,
              color: Color(0xff5c001e)
            ),
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