// import 'package:elearning_app/ui/models/message_data.dart';
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

  List<String> ctrl1 = [];
  List<String> ctrl2 = [];

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        actions: <Widget>[
          Icon(Icons.message, color: Colors.white),
        ],
      ),
      body: new Column(
        children: <Widget>[
          SizedBox(
            height: 30,
            width: 350,
          ),
          new Expanded(
            child: new ListView.builder(
                itemCount: ctrl1.length,
                itemBuilder: (BuildContext ctxt, int iindex) {
                  final item = ctrl1[iindex];
                  return Column(
                    children: <Widget>[
                      Dismissible(
                        key: Key(item),
                        onDismissed: (direction) {
                          setState(() {
                            ctrl1.removeAt(iindex);
                            ctrl2.removeAt(iindex);
                          });
                        },
                        background: Container(color: Colors.red),
                        child: Row(
                          children: <Widget>[
                            new Icon(Icons.person),
                      new Text(
                        '  ' + ctrl1[iindex]  + '  ',
                        style: TextStyle(
                          fontSize: 21.0,
                          color: Color(0xff5c001e),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      new Text(
                        ctrl2[iindex],
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 350,
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  );
                }),
                
          ),
        ],
      ),
      // body: ListView.separated(
      //   itemCount: widget._msg.length,
      //   itemBuilder: (context, index) => ListTile(
      //     title: Text(widget._msg[index].email),
      //     subtitle: Text(widget._msg[index].content),
      //   ),
      //   separatorBuilder: (context, index) => Divider(
      //     color: Colors.grey,
      //   ),
      // ),

      floatingActionButton: FloatingActionButton.extended(
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
                          _controller.clear();
                          _controller2.clear();
                          setState(() {});
                        },
                      ),
                      SizedBox(height: 30),
                      FloatingActionButton.extended(
                        label: const Text('Send'),
                        heroTag: null,
                        onPressed: () => Navigator.of(context).pop(widget._msg),
                        // onPressed: () {
                        //   showDialog(
                        //     context: context,
                        //     child: Column(
                        //       children: <Widget>[
                        //         new AlertDialog(
                        //           title: Column(
                        //             children: <Widget>[
                        //               new Text('Send messages to '),
                        //               Text(
                        //                 _controller.text,
                        //                 style: TextStyle(
                        //                   fontStyle: FontStyle.italic,
                        //                 ),
                        //               ),
                        //               new Text(
                        //                   '----------------------------------------'),
                        //             ],
                        //           ),
                        //           content: new Text(_controller2.text),
                        //         ),
                        //         FloatingActionButton.extended(
                        //           label: const Text('Ok'),
                        //           icon: const Icon(Icons.check_circle),
                        //           heroTag: null,
                        //           onPressed: () => Navigator.push(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (context) =>
                        //                       MessagesPage(mockData))),
                        //           // Navigator.maybePop(context),
                        //           // Navigator.of(context).pushAndRemoveUntil(
                        //           //   MaterialPageRoute(builder: (context) =>MessagesPage(mockData)), ModalRoute.withName('settings')),
                        //           // Navigator.popUntil(context, ModalRoute.withName('messages')),
                        //         ),
                        //       ],
                        //     ),
                        //   );
                        // },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
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
