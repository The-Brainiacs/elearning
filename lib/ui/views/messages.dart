import 'package:elearning_app/ui/models/message_data.dart';
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
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController();
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
      //  floatingActionButton: FloatingActionButton.extended(
      //    label: const Text('Add New Message'),
      //         icon: const Icon(Icons.add),
      //         heroTag: null,
      //         onPressed: () => Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => NewMessagePage())),
      //       ),
      floatingActionButton: FloatingActionButton.extended(
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
            label: const Text('Ok'),
            icon: const Icon(Icons.check_circle),
            heroTag: null,
            onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => MessagesPage(mockData))),
            
          ),
                  ],
                ),
              );
            },
            
          ),
        ],
                          ),
                      
                    ),
                   
                  ],
                ),
              );
            },
            //   () => Navigator.push(
            // context, MaterialPageRoute(builder: (context) => MessagesPage(mockData))),
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
