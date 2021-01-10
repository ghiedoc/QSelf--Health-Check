import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdminUserInfoPage extends StatefulWidget {
  static const routeName = '/adminuserinfo';
  @override
  _AdminUserInfoPageState createState() => _AdminUserInfoPageState();
  static const routeName = '/adminUserInfo';
}

class _AdminUserInfoPageState extends State<AdminUserInfoPage> {
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
      //BODY
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return;
                    },
                  ),
                );
              },
              child: Container(
                height: 150,
                child: Padding(
                  padding: padding,
                  child: Card(
                    shape: border,
                    elevation: 3.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.call, size: 70),
                          title: Text('Contact Information', style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold)),
                          subtitle: Text('09354412563 \n09875542185\n Shangri-La Makati', style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //TRAVEL HISTORY
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return;
                    },
                  ),
                );
              },
              child: Container(
                height: 200,
                child: Padding(
                  padding: padding,
                  child: Card(
                    shape: border,
                    elevation: 3.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      child: Text(
                        'Travel History',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Color(0xFFF494949),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return;
                    },
                  ),
                );
              },
              child: Container(
                height: 100,
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
                          'Quarantine Status',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: Color(0xFFF494949),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        //DRAWER
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
