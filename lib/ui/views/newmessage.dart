import 'package:elearning_app/ui/models/message_data.dart';
import 'package:elearning_app/ui/views/messages.dart';
import 'package:flutter/material.dart';

class NewMessagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewMessagePageState();
  }
}

class _NewMessagePageState extends State<NewMessagePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Messages'),
      ),
      body: Center(
        child: BodyLayout(),
      ),
      bottomNavigationBar: buildBottomNav(),
    );
  }
}

class BodyLayout extends StatefulWidget {

  @override
  _BodyLayoutState createState() => _BodyLayoutState();
}

class _BodyLayoutState extends State<BodyLayout> {
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 40),
          new Text(
            'Recipient : ',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          new TextField(
            controller: _controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.lightBlue[50],
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "example@gmail.com",
                errorText: "*required",
                errorStyle:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 20),
          new Text(
            'Messages : ',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          new TextField(
              controller: _controller2,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.lightBlue[50],
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Your messages",
              )),
          SizedBox(height: 30),
          FloatingActionButton.extended(
            label: const Text('Send message'),
            heroTag: null,
            onPressed: () {
              showDialog(
                context: context,
                child: Column(
                  children: <Widget>[
                    new AlertDialog(
                      title: 
                          Column(
                            children: <Widget>[
                              new Text('Send messages to '),
                              Text( _controller.text, 
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                ),),
                              new Text('----------------------------------------'),
                            ],
                          ),
                      content: 
                          new Text(_controller2.text),
                    ),
                    FloatingActionButton.extended(
                      label: const Text('Send Message'),
                      heroTag: null,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MessagesPage(mockData))),
                    ),
                  ],
                ),
              );
            },
            //   () => Navigator.push(
            // context, MaterialPageRoute(builder: (context) => MessagesPage(mockData))),
          ),
        ],
      ),
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
          '',
          style: TextStyle(color: Colors.white),
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications, color: Colors.white),
        title: Text(
          '',
          style: TextStyle(color: Colors.white),
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.folder, color: Colors.white),
        title: Text(
          '',
          style: TextStyle(color: Colors.white),
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.mail, color: Colors.white),
        title: Text(
          '',
          style: TextStyle(color: Colors.white),
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.exit_to_app, color: Colors.white),
        title: Text(
          '',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ],
  );
}
