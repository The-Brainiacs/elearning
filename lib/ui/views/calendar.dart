import 'package:elearning_app/core/services/calendar_services.dart';
import 'package:elearning_app/ui/models/calendar_model.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
//import 'package:firebase/firebase.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  Calendar events;

  String datecontroller;
  TextEditingController descriptioncontroller = TextEditingController();

  List<Calendar> list;
  final dataService = CalendarService();

  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
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
    return FutureBuilder<List<Calendar>>(
        future: dataService.displayEvent(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            list = snapshot.data; //List
            print(list[0].description);
            return _buildMainScreen();
          }
          return _buildFetchingDataScreen();
        });
  }

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching data... Please wait'),
          ],
        ),
      ),
    );
  }

  Scaffold _buildMainScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[buildTableCalendar(context), buildEvent()],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orange,
        label: Text('Add Event'),
        icon: Icon(Icons.check_circle),
        onPressed: () async {
          DateTime date = DateTime.now();
          String description = descriptioncontroller.text;

          Calendar eve = await dataService.createEvent(
              list.length.toString(), date.toIso8601String(), description);
          setState(() {
            events = eve;
          });
        },
      ),
      bottomNavigationBar: buildBottomNav(),
    );
  }

  TableCalendar buildTableCalendar(BuildContext context) {
    return TableCalendar(
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
    );
  }

  Container buildEvent() {
    return Container(
        width: 380,
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 25.0,
        ),
        decoration: BoxDecoration(
            color: Colors.white10,
            border: Border.all(
              color: Color(0xff5c001e),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            )),
        child: Column(children: <Widget>[
          buildEventDetails(),
          Text('${list[0].description}'),
        ]));
  }

  Column buildEventDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Upcoming Event',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Color(0xff5c001e)),
            ),
          ],
        ),
        SizedBox(
          height: 20,
          width: 400,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Date',
              style: TextStyle(fontSize: 12.0, color: Color(0xff5c001e)),
            ),
            RaisedButton(
                child: Text(datecontroller.toString()),
                color: Colors.amberAccent,
                onPressed: () {
                  showDatePicker(
                          context: context,
                          initialDate: datecontroller == null
                              ? DateTime.now()
                              : datecontroller,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2022))
                      .then((date) {
                    setState(() {
                      datecontroller = date.toIso8601String();
                    });
                  });
                }),
            SizedBox(
              height: 5,
              width: 300,
            ),
            Text(
              'Description',
              style: TextStyle(fontSize: 12.0, color: Color(0xff5c001e)),
            ),
            TextField(
              controller: descriptioncontroller,
            ),
            events == null
                ? Container()
                : Text("Event ${events.description} created successfully")
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
}
