import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:flutter_trial_three/database/DatabaseHelper.dart';
import 'data.dart';

class AdminUserListPage extends StatefulWidget {
  static const routeName = '/adminuserlist';

  @override
  _AdminUserListPageState createState() => _AdminUserListPageState();
}

class _AdminUserListPageState extends State<AdminUserListPage> {
  final dbHelper = DatabaseHelper.instance;

  List<userList> _userList = null;

  int count = 0;

  GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (_userList == null) {
      _userList = new List();
      updateListView();
    }

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
      body: populateListView(),
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

  updateListView() async {
    _userList = await dbHelper.getUserList();

    setState(() {
      _userList = _userList;
      count = _userList.length;
    });
  }


  ListView populateListView() {
    return (ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          userList UserList = this._userList[index];
//          title: Text(UserList.fname),
//          subtitle: Text(UserList.lname),

          return Container  (
            height: 130,
              child: Padding(
              padding: EdgeInsets.all(10.0),
                child: Card(
                child: ListTile(
                  title: Text(UserList.fname,
                    style: TextStyle(
                fontSize: 32,
      ),
                  ),
//                  subtitle: Text(UserList.lname),
//              elevation: 3.0,
//                   child: Padding(
//                padding: const EdgeInsets.symmetric(
//                    vertical: 20.0, horizontal: 20.0),
//                        child: Text(UserList.fname,
//                style: TextStyle(
//                fontSize: 32,
//                ),
//              ),
//            ),
                ),

            ),
            ),
          );

        }
    ));
  }
}