import 'package:elearning_app/ui/models/student.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/ui/views/user_details.dart';


class EditProfilePage extends StatefulWidget {
  final Student student;
  EditProfilePage(this.student);
  @override
  State<StatefulWidget> createState() {
    return _EditProfilePageState();
  }
}

class _EditProfilePageState extends State<EditProfilePage> {
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    final profileInfoContainer = Container(
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
              onPressed: () {setState(() {
                widget.student.email = emailController.text;
                widget.student.phone = phoneController.text;
              });
                
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserDetailsPage(mockStudent)),
                );
              }
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            profileInfoContainer, 
            buildDetailsContainer(widget.student, emailController, phoneController),
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

Container buildDetailsContainer(Student student, TextEditingController emailController, TextEditingController phoneController) {
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
    child: buildStudentDetails(student, emailController, phoneController),
  );
}

Column buildStudentDetails(Student student, TextEditingController emailController, TextEditingController phoneController) {
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
          Row(
            children: <Widget>[
              Text(
                'Email: ', 
                style: TextStyle(
                  fontSize: 17.0,
                  color: Color(0xff5c001e)
                ),
              ),
              Expanded(child: 
                TextField(
                  controller: emailController,
                  //decoration: const InputDecoration(prefix: Text(student.email)), 
                ),
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
                'Phone: ', 
                style: TextStyle(
                  fontSize: 17.0,
                  color: Color(0xff5c001e)
                ),
              ),
              Expanded(child: 
                TextField(
                  controller: phoneController,
                  //decoration: const InputDecoration(hintText: '018293948'), //TODO input changes
                ),
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