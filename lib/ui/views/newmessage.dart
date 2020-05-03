
import 'package:flutter/material.dart';


class NewMessagePage extends StatefulWidget {
  NewMessagePage({Key key}) : super(key: key);

  @override
  _NewMessagePageState createState() => new _NewMessagePageState();
}

/// State for [ExampleWidget] widgets.
class _NewMessagePageState extends State<NewMessagePage> {
  final TextEditingController _controller = new TextEditingController();

  @override
Widget build(BuildContext context) {
  return new Scaffold(
    body: new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new TextField(
            controller: _controller,
            decoration: new InputDecoration(
                hintText: 'Type something',
            ),
        ),
        new RaisedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  child: new AlertDialog(
                      title: new Text('What you typed'),
                      content: new Text(_controller.text),
                  ),
              );
            },
            child: new Text('DONE'),
        ),
      ],
    ),
  );
}
}