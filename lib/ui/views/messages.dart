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
      body: ListView.separated(
        itemCount: _msgs.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.blueGrey,
        ),
        itemBuilder: (context, index) {
          final _msg = _msgs[index];
          return ListTile(
            // trailing: _buildThumbButtons(index),
            title: Text(_msg.name,
                textAlign: TextAlign.justify, style: TextStyle(fontSize: 12)),
            subtitle: Text(_msg.textmsg,
                textAlign: TextAlign.justify, style: TextStyle(fontSize: 12)),
            //  onLongPress: () async {
            //   await dataService.deleteMsg(
            //       id: _msgs[index].id); // Delete todo at the database
            //   setState(() => _msgs.removeAt(index)); // Update UI
            // },
          );
        },
      ),
      floatingActionButton: Row(
        children: <Widget>[
        
        
        FloatingActionButton.extended(
      label: const Text('Add new message'),
      heroTag: null,
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
                        // _controller.clear();
                        // _controller2.clear();
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 30),
                    FloatingActionButton.extended(
                      label: const Text('Send'),
                      heroTag: null,
                      // onPressed: () => Navigator.of(context).pop(),
                      onPressed: () async {
          final newMsg = await dataService.createMsg(
            msg: Msg(name: _controller.text,
            textmsg: _controller2.text),
          ); // Update server. Id for the new Todo will be given by the server

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

          FloatingActionButton(
         child: Icon(Icons.refresh),


            onPressed: () {
              setState(() {
                dataService.getAllMsgs();
              });
            },
      ),
        ],
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
            Text('Fetching quotes... Please wait'),
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
