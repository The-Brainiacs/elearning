import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MessagesPageState();
  }
}

class _MessagesPageState extends State<MessagesPage> {

int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        actions: <Widget>[
          new Stack(
            children: <Widget>[
              new IconButton(icon: Icon(Icons.notifications), onPressed: () {
                setState(() {
                  counter = 0;
                });
              }),
              counter != 0 ? new Positioned(
                right: 11,
                top: 11,
                child: new Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$counter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ) : new Container()
            ],
          ),
        ],
      ),
       body: Center(child: BodyLayout(), ),
       floatingActionButton: FloatingActionButton(onPressed: () {
        print("Increment Counter");
        setState(() {
          counter++;
        });
      }, child: Icon(Icons.add),),
      bottomNavigationBar: buildBottomNav(),
    );
  }
}

class BodyLayout extends StatefulWidget {
  
  @override
  _BodyLayoutState createState() => _BodyLayoutState();
  
}

class _BodyLayoutState extends State<BodyLayout> {
  
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      
      ListTile(
        title: Text('Nur Amira'),
        subtitle: Text('Google drive link on our project documentation: https://docs.google.com/document/d/1jDLdr6TH07H262SNvOI4Vy-CjuPc6mZ2Po2hwg2a1w0/edit',
        style: TextStyle(
                      fontSize: 15,
                    ),
        ),
        leading: Icon(Icons.person, color: Color(0xff5c001e)),
        onTap: () {
          final snackBar = SnackBar(
            content: Text('You have not submitted Project Proposal 1'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          // Find the Scaffold in the widget tree and use
          // it to show a SnackBar.
          Scaffold.of(context).showSnackBar(snackBar);
        },
        // child: Text('Show SnackBar'),
      ),
      ListTile(
        title: Text('Ahmad Fariz'),
        subtitle: Text('Meeting at 8 p.m. Please come in time. Thank you.',
        style: TextStyle(
                      fontSize: 15,
                    ),
        ),
        leading: Icon(Icons.person, color: Color(0xff5c001e)),
        
        // child: Text('Show SnackBar'),
      ),
      ListTile(
        
        title: Text('Shazwan Shakirin'),
        subtitle: Text('Ok.',
        style: TextStyle(
                      fontSize: 15,
                    ),
        ),
        
        leading: Icon(Icons.person, color: Color(0xff5c001e)),
        
        onTap: () {
          final snackBar = SnackBar(
            content: Text('Group 4 have not completed assignment 3, please submit by tomorrow'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          // Find the Scaffold in the widget tree and use
          // it to show a SnackBar.
          Scaffold.of(context).showSnackBar(snackBar);
        },
        
        // child: Text('Show SnackBar'),
      ),

      
    ]);
  }
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
            icon: Icon(Icons.notifications,

             color: Colors.white),
            title: Text('Messages', style: TextStyle(color: Colors.white),),

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
