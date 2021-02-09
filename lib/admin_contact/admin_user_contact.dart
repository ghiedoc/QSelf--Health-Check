import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trial_three/database/dbFirebase.dart';
import 'package:provider/provider.dart';
import 'package:flutter_trial_three/screen/data.dart';
import 'userContact.dart';

class AdminUserContact extends StatefulWidget {
  static const routeName = '/admincontact';
  @override
  _AdminUserContactState createState() => _AdminUserContactState();
}

class _AdminUserContactState extends State<AdminUserContact> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<AdminuserContact>>.value(
      value: dbService().contact,
      builder: (context, snapshot) {
        return StreamProvider<List<userList>>.value(
          value: dbService().user,
          child: Scaffold(
            backgroundColor: Color(0xFFFA8072),
            appBar: AppBar(
              backgroundColor: Color(0xFFFA8072),
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
              title: Text("User Contact"),
            ),
            //BODY
            body: userContactInfo(),
          ),
        );
      }
    );
  }
}

