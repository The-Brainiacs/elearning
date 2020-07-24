import 'package:elearning_app/services/quotes_data_service.dart';
import 'package:flutter/material.dart';

import '../models/quote_model.dart';
// import '.../services/quote_data_service.dart';

class QuoteListScreen extends StatefulWidget {
  @override
  _QuoteListScreenState createState() => _QuoteListScreenState();
}

class _QuoteListScreenState extends State<QuoteListScreen> {
  List<Quote> _quotes;
  final dataService = QuoteDataService();

  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController();

  List<String> ctrl1 = [];
  List<String> ctrl2 = [];

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Quote>>(
        future: dataService.getAllQuotes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _quotes = snapshot.data;
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
        itemCount: _quotes.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.blueGrey,
        ),
        itemBuilder: (context, index) {
          final _quote = _quotes[index];
          return ListTile(
            // trailing: _buildThumbButtons(index),
            title: Text(_quote.data,
                textAlign: TextAlign.justify, style: TextStyle(fontSize: 12)),
            subtitle: Text(_quote.data,
                textAlign: TextAlign.justify, style: TextStyle(fontSize: 12)),
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
                              final newQuote = await dataService.createQuote(
                                quote: Quote(data: _controller.text),
                              ); // Update server. Id for the new Todo will be given by the server

                              setState(
                                  () => _quotes.add(newQuote)); // Update UI
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
                dataService.getAllQuotes();
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
