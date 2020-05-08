import 'package:flutter/material.dart';
// import 'package:elearning_app/ui/views/login_page.dart';


class EditProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EditProfilePageState();
  }
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
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
          ]
        ),
        
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
          FlatButton(
            child: Text('Save Changes'),
            color: Color(0xff5c001e),
            textColor: Colors.white,
            onPressed: () {/** */},
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
          SizedBox(
            height: 5,
            width: 300,
          ),
          Text(
            'Email: ' + 'm.abu1998@gmmas.com', //TODO input changes
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
            'Phone Number: ' + 'call 911', //TODO input changes
            style: TextStyle(
              fontSize: 17.0,
              color: Color(0xff5c001e)
            ),
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