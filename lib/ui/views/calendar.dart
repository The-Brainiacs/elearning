import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  //TextEditingController _eventController;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    //_eventController = TextEditingController();
    _events = {};
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              events: _events,
              initialCalendarFormat: CalendarFormat.week,
              calendarStyle: CalendarStyle(
                  todayColor: Colors.orange,
                  selectedColor: Theme.of(context).primaryColor,
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white)),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events) {
                print(date.toIso8601String());
              },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              calendarController: _controller,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
        onPressed: () {},
      ),
      bottomNavigationBar: buildBottomNav(),
    );
  }

  // _showAddDialog() {
  //   showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //             content: TextField(
  //               controller: _eventController,
  //             ),
  //             actions: <Widget>[
  //               FlatButton(
  //                 child: Text('Save'),
  //                 onPressed: () {
  //                   if (_eventController.text.isEmpty) return;
  //                   setState(() {
  //                     if (_events[_controller.selectedDay] != null) {
  //                       _events[_controller.selectedDay]
  //                           .add(_eventController.text);
  //                     } else {
  //                       _events[_controller.selectedDay] = [
  //                         _eventController.text
  //                       ];
  //                     }
  //                   });
  //                 },
  //               )
  //             ],
  //           ));
  // }
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
