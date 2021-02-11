import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trial_three/database/dbFirebase.dart';
import 'package:provider/provider.dart';
import 'package:flutter_trial_three/screen/data.dart';
import 'info_con.dart';
class adminInfo extends StatefulWidget {
  static const routeName = '/admintravelhisto';
  @override
  _adminInfoState createState() => _adminInfoState();
}

class _adminInfoState extends State<adminInfo> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<travelInfo>>.value(
        value: dbService().travel,
        builder: (context, snapshot) {
          return StreamProvider<List<userList>>.value(
            value: dbService().user,
            child: Scaffold(
              backgroundColor: Color(0xFFFA8072),
              appBar: AppBar(
                backgroundColor: Color(0xFFFA8072),
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black),
                title: Text("User Travel History"),
              ),
              //BODY
              body: adminCon(),
            ),
          );
        }
    );
  }
}
