import 'package:flutter/material.dart';
import 'package:flutter_trial_three/authenticate/auth.dart';
import 'package:flutter_trial_three/database/dbFirebase.dart';
import 'package:provider/provider.dart';
import 'data.dart';
import 'form_list.dart';
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

    return StreamProvider<List<userform>>.value(
      value: dbService().diagnose,
      child: Scaffold(
        backgroundColor: Color(0xFFEFEFEF),
        appBar: AppBar(
          backgroundColor: Color(0xFFEFEFEF),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(""),
        ),
        //BODY
        body: formList(),
      ),
    );

  }
}
