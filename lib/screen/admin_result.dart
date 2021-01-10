import 'package:flutter/material.dart';

class AdminResultPage extends StatefulWidget {
  static const routeName = '/adminResult';
  @override
  _AdminResultPageState createState() => _AdminResultPageState();
}

class _AdminResultPageState extends State<AdminResultPage> {
  @override
  Widget build(BuildContext context) {
    final border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    );
    final padding = const EdgeInsets.all(4.0);

    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: AppBar(
        backgroundColor: Color(0xFFEFEFEF),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(""),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Container(
              height: 130,
              child: Padding(
                padding: padding,
                child: Card(
                  shape: border,
                  elevation: 3.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: const ListTile(
                          leading: Icon(Icons.wb_sunny, size: 60),
                          title: Text('Day 1',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text('Steve Rogers',
                              style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 250,
              child: Padding(
                padding: padding,
                child: Card(
                  shape: border,
                  elevation: 3.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        ' Fever - Yes \n Fever - Yes \n Fever - Yes \n Fever - Yes \n Fever - Yes \n Fever - Yes \n',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Maybe Name Here'),
              decoration: BoxDecoration(
                color: Color(0xFFFA8072),
              ),
            ),
            ListTile(
              title: Text('Updates on COVID-19'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
