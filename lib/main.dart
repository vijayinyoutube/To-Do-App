import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> todoitems = [];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController eCtrl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("My Task"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          actions: <Widget>[
                            FlatButton(
                              //  child: Text('Ok',),
                              child: Icon(Icons.check),
                              textColor: Colors.green,

                              onPressed: () {
                                todoitems
                                    .add(eCtrl.text); // Append Text to the list
                                eCtrl.clear(); // Clear the Text area
                                setState(() {}); // R
                                Navigator.pop(context);

                                // Redraw the Stateful Widget
                              },
                            ),
                          ],
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15)),
                          title: Text('Task'),
                          content: TextField(
                            controller: eCtrl,
                            onSubmitted: (text) {
                              Navigator.pop(context);
                              todoitems.add(text); // Append Text to the list
                              eCtrl.clear(); // Clear the Text area
                              setState(() {}); // Redraw the Stateful Widget
                            },
                            decoration: InputDecoration(hintText: "Add a Task"),
                          ));
                    });
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            new Expanded(
              child: new ListView.builder(
                  itemCount: todoitems.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Card(child: new Text(todoitems[index]));
                  }),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
