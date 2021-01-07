import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CovidUpdatePage extends StatefulWidget {
  @override
  _CovidUpdatePageState createState() => _CovidUpdatePageState();
}

class _CovidUpdatePageState extends State<CovidUpdatePage> {
  final appTitle = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFA8072),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFFA8072),
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(title)),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFFFA8072),
        ),
        child: BottomNavigationBar(
          currentIndex: 0, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: IconTheme(
                child: new Icon(Icons.notifications),
                data: IconThemeData(color: Colors.white),
              ),
              title: IconTheme(
                child: new Text(
                  'Notifications',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                data: IconThemeData(color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(
              icon: IconTheme(
                child: new Icon(Icons.home),
                data: IconThemeData(color: Colors.white),
              ),
              title: new Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: IconTheme(
                child: new Icon(Icons.fact_check),
                data: IconThemeData(color: Colors.white),
              ),
              title: new Text(
                'Self-Diagnose Form',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    child: Text(
                      "COVID-19 Statistics",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
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
