import 'package:elearning_app/ui/views/newmessage.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
 final List _msg;
MessagesPage(this._msg);

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
       body: ListView.separated(
        itemCount: widget._msg.length,
        itemBuilder: (context, index) => 
        ListTile(
          title: Text(widget._msg[index].email),
          subtitle: Text(widget._msg[index].content),
        ),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
      ),
       floatingActionButton: FloatingActionButton.extended(
         label: const Text('Add New Message'),
              icon: const Icon(Icons.add),
              heroTag: null,
              onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => NewMessagePage())),
            ),
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
            title: Text('', style: TextStyle(color: Colors.white),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications,

             color: Colors.white),
            title: Text('', style: TextStyle(color: Colors.white),),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder, color: Colors.white),
            title: Text('', style: TextStyle(color: Colors.white),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail, color: Colors.white),
            title: Text('', style: TextStyle(color: Colors.white),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app, color: Colors.white),
            title: Text('', style: TextStyle(color: Colors.white),),
          ),
        ],
  );
}
