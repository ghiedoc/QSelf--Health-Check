import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trial_three/authenticate/auth.dart';
import 'package:flutter_trial_three/database/dbFirebase.dart';
import 'package:provider/provider.dart';
import 'data.dart';
import 'package:flutter_trial_three/screen/userList.dart';

class AdminUserListPage extends StatefulWidget {
  static const routeName = '/adminuserlist';

  @override
  _AdminUserListPageState createState() => _AdminUserListPageState();
}

class _AdminUserListPageState extends State<AdminUserListPage> {
  final AuthService _auth = AuthService();

  int count = 0;

  GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {



    final border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    );
    final padding = const EdgeInsets.all(4.0);
    return StreamProvider<List<userList>>.value(
      value: dbService().user,
      child: Scaffold(
        backgroundColor: Color(0xFFEFEFEF),
        appBar: AppBar(
          backgroundColor: Color(0xFFEFEFEF),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(""),
        ),
        //BODY
        body: userInfo(),
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
      ),
    );
  }




}