import 'package:elearning_app/ui/models/student.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/ui/views/edit_profile.dart';
import 'package:elearning_app/ui/shared/dashboard_data.dart';
import 'package:elearning_app/ui/views/user_details.dart';

class ProfilePage extends StatefulWidget {
  final List <Course> course;

  ProfilePage(this.course);

  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    
    final studentCourses = Column(
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
            // Expanded(TODO
            //   child: new ListView.builder(
            //     itemCount: widget.course.length,
            //     itemBuilder: (context, index) {
            //       return Text(
            //         widget.course[index].title,
            //         style: TextStyle(
            //           fontSize: 17.0,
            //           color: Color(0xff5c001e)
            //         ),
            //       );
            //     },
            //     // itemCount: widget.course.length,
            //     // itemBuilder: (context, index) => Text(
            //     //   widget.course[index].title, 
            //     //   style: TextStyle(
            //     //     fontSize: 17.0,
            //     //     color: Color(0xff5c001e)
            //     //   ),
            //     // ),
            //   ),
            // ),
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

    final editProfileButton = FlatButton(
      child: Text('Edit Profile'),
      color: Color(0xff5c001e),
      textColor: Colors.white,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditProfilePage(mockStudent)),
        );
      }
    );

    final studentDetails = Column(
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
            InkWell(
                child: new Text(
                  'User Details', 
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Color(0xff5c001e)
                  ),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          UserDetailsPage(mockStudent)
                  ),
                ),
            ),
            SizedBox(
              height: 5,
              width: 300,
            ),
            InkWell(
                child: new Text(
                  'Privacy And Policy', 
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Color(0xff5c001e)
                  ),
                ),
                // onTap: () => Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) =>
                //           UserDetailsPage()
                //   ),
                // ),
            ),
            SizedBox(
              height: 5,
              width: 300,
            ),
            InkWell(
                child: new Text(
                  'Reports', 
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Color(0xff5c001e)
                  ),
                ),
                // onTap: () => Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) =>
                //           UserDetailsPage()
                //   ),
                // ),
            ),
          ],
        ),
      ],
    );

    final coursesContainer = Container( // Courses
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
        child: studentCourses,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: new SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildProfileInfoContainer(editProfileButton),
            coursesContainer,
            buildDetailsContainer(studentDetails),
          ]
        ),
        
      ),
      bottomNavigationBar: buildBottomNav(),
    );
  }
}

Container buildProfileInfoContainer(FlatButton editProfileButton) {
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
          editProfileButton,
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

Container buildDetailsContainer(Column studentDetails) {
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
    child: studentDetails,
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