// import 'dart:html';

import 'package:elearning_app/ui/shared/dashboard_data.dart';
import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';

import 'assigment.dart';


class DashboardPage extends StatefulWidget {
  final List <Course> course;

  DashboardPage(this.course);

  @override
  State<StatefulWidget> createState() {
    return _DashboardPageState();
  }
}

class _DashboardPageState extends State<DashboardPage> {

void _navigate(int index) async {
    final Course updateCourse = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AssignmentPage(Course.copy(widget.course[index]))));

    if (updateCourse != null) {
      setState(() => widget.course[index] = updateCourse);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView.separated(
        itemCount: widget.course.length,
        itemBuilder: (context, index) => Card (
      
          color: Color(0xffFFA500).withOpacity(0.5),
            child:
        Column(
          children: <Widget>[
            ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          leading: CircleAvatar(
              radius: 55,
              backgroundColor: Color(0xffFDCF09),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(widget.course[index].pictPath),
              ),
            ),
          title: Text(widget.course[index].title,), 
          subtitle: Text(widget.course[index].lecturer),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () => _navigate(index),
        ),
        LinearPercentIndicator(
                
                width: MediaQuery.of(context).size.width -8,
                animation: true,
                lineHeight: 15.0,
                animationDuration: 2000,
                percent: (widget.course[index].prog.round())/100,
                center: Text( widget.course[index].prog.round().toString() + '%',  style: TextStyle(color: Colors.white)),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Color(0xff5c001e).withOpacity(1),
              ),
          ] )),
        separatorBuilder: (context, index) => Divider(
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: buildBottomNav(),
    );
  }
}



AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Color(0xff5c001e),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Text('Dashboard'),
        )
      ],
    ),
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

// class Chart extends StatefulWidget{
//   @override
//   State <StatefulWidget> createState(){
//     return _ChartState();
//   }
// }

// class _ChartState extends State<Chart>{
//   @override
//   Widget build(BuildContext context){
//     return Container(
//       child: AspectRatio(aspectRatio: 1, child: flChart,),
//     );
//   }
// }