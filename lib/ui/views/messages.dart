// import 'package:elearning_app/ui/models/message_data.dart';
import 'package:elearning_app/services/msg_data_services.dart';
import 'package:elearning_app/ui/models/message_data.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  List<Msg> _msgs;
  final dataService = MsgDataService();

  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController();

  List<String> ctrl1 = [];
  List<String> ctrl2 = [];

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Msg>>(
        future: dataService.getAllMsgs(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _msgs = snapshot.data;
            return _buildMainScreen();
          }
          return _buildFetchingDataScreen();
        });
  }

  Scaffold _buildMainScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: _msgs.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                background: Container(
                  color: Colors.red),
                key: Key(_msgs[index].name),
                child: Container(
                  
                  padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                  height: 85,
                  color: Colors.red[50],
                  child: Center(
                    
                    child: Row(
                      
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.message, size: 60),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '   ${_msgs[index].name}',
                              
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '   ${_msgs[index].textmsg}',
                             
                              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                            ),
                           Text(
                              '-------------------------------------------------------------',
                               style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                onDismissed: (direction) async {
                 
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content:
                          Text("Messages from ${_msgs[index].name} deleted")));
                 
                  await dataService.deleteMsg(
                      id: _msgs[index].id); // Delete msgs at the database
                  setState(() {
                    _msgs.removeAt(index);
                  });
                },
              );
            }),
      ),

      floatingActionButton: SafeArea(
        left: false,
        child: FloatingActionButton.extended(
          label: const Text('Add new message'),
          heroTag: null,
          backgroundColor: Color(0xff5c001e),
          onPressed: () {
            showDialog(
              context: context,
              child: Column(
                children: <Widget>[
                  new AlertDialog(
                    title: Column(
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
                              prefixIcon: Icon(Icons.person),
                              filled: true,
                              fillColor: Colors.lightBlue[50],
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: "example : Misha Omar",
                              errorText: "*required",
                              errorStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                          onSubmitted: (text) {
                            ctrl1.add(text);

                            setState(() {});
                          },
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
                          // maxLines: 4,
                          controller: _controller2,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.message),
                            filled: true,
                            fillColor: Colors.lightBlue[50],
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: "Your messages",
                          ),
                          onSubmitted: (text) {
                            ctrl2.add(text);
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 30),
                        FloatingActionButton.extended(
                          label: const Text('Send'),
                          heroTag: null,
                          backgroundColor: Color(0xff5c001e),
                          onPressed: () async {
                            final newMsg = await dataService.createMsg(
                              msg: Msg(
                                  id: null,
                                  name: _controller.text,
                                  textmsg: _controller2.text),
                            );

                            setState(() => _msgs.add(newMsg)); // Update UI
                            
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),

      bottomNavigationBar: buildBottomNav(),
    );
  }

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
          ],
        ),
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
