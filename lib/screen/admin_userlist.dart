import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trial_three/authenticate/auth.dart';
import 'package:flutter_trial_three/database/dbFirebase.dart';
import 'package:provider/provider.dart';
import 'data.dart';
import 'package:flutter_trial_three/screen/userList.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminUserListPage extends StatefulWidget {

  static const routeName = '/adminuserlist';

  @override
  _AdminUserListPageState createState() => _AdminUserListPageState();
}

  DateTime backButtonPressTime;

class _AdminUserListPageState extends State<AdminUserListPage> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    @override
    Widget build(BuildContext context) {
      Future<bool> btnbackdd() async {
        DateTime currentTime = DateTime.now();
        bool backbtn = backButtonPressTime == null ||
            currentTime.difference(backButtonPressTime) > Duration(seconds: 3);
        if (backbtn) {
          backButtonPressTime = currentTime;
          Fluttertoast.showToast(
            msg: 'Double Tap to Close app',
            backgroundColor: Colors.black,
            textColor: Colors.white,
          );
          return false;
        }
        return true;
      }

      final border = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      );
      final padding = const EdgeInsets.all(4.0);
      return StreamProvider<List<userList>>.value(
        value: dbService().user,
        child: Scaffold(
          backgroundColor: Color(0xFFFA8072),
          appBar: AppBar(
            backgroundColor: Color(0xFFFA8072),
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text("User Diagnosis Results"),
          ),
          //BODY
          body: WillPopScope(
              onWillPop: btnbackdd,
              child: userInfo()),
        ),
      );
    }
  }
}