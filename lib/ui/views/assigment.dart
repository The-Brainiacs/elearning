import 'package:elearning_app/services/dashboardService.dart';
import 'package:elearning_app/ui/models/dashboard_data.dart';
import 'package:flutter/material.dart';

class AssignmentPage extends StatefulWidget {
  // final Course course;
  final String id;
  final Course course;

  AssignmentPage(this.course, this.id);

  @override
  State<StatefulWidget> createState() {
    return _AssignmentPageState();
  }
}

class _AssignmentPageState extends State<AssignmentPage> {
  Course course;
  final dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5c001e),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.course.title),
            )
          ],
        ),
      ),
      body: ListView.separated(
        itemCount: widget.course.assignment.length,
        itemBuilder: (context, index) => Ink(
          child: CheckboxListTile(
            title: Text(
              widget.course.assignment[index].title,
            ),
            value: widget.course.assignment[index].status,
            onChanged: (bool value) {
              setState(() {
                widget.course.assignment[index].status = value;
              });
            },
          ),
        ),
        separatorBuilder: (context, index) => Divider(
          color: Colors.white,
        ),
      ),
      floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              color: Color(0xff5c001e),
              onPressed: () async {
                course = await dataService.updateAssignment(
                    id: widget.course.id, assignment: widget.course.assignment);
                Navigator.pop(context);
              },
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            ),
            FlatButton(
              color: Color(0xff5c001e),
              onPressed: () => Navigator.pop(context, null),
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ]),
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
        title: Text(
          'Calendar',
          style: TextStyle(color: Colors.white),
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications, color: Colors.white),
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.folder, color: Colors.white),
        title: Text(
          'Archive',
          style: TextStyle(color: Colors.white),
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.mail, color: Colors.white),
        title: Text(
          'Messages',
          style: TextStyle(color: Colors.white),
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.exit_to_app, color: Colors.white),
        title: Text(
          'Log Out',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ],
  );
}
