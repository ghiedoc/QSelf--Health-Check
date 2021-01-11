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
      ),
    );
  }
}