import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data.dart';
import 'package:flutter_trial_three/database/dbFirebase.dart';
import 'formList.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminResultPage extends StatefulWidget {
  static const routeName = '/adminResult';
  String uid;
  AdminResultPage({this.uid});
  @override
  _AdminResultPageState createState() => _AdminResultPageState(uid: uid);

}
class _AdminResultPageState extends State<AdminResultPage> {
  String uid;
  _AdminResultPageState({this.uid});
  

  @override
  Widget build(BuildContext context) {

    final border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    );
    return StreamProvider<List<userform>>.value(
      value: dbService().Form,
      child: Scaffold(
        backgroundColor: Color(0xFFFA8072),
        appBar: AppBar(
          backgroundColor: Color(0xFFFA8072),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("User List"),
        ),
        //BODY
        body: formList(selectedDiagnosis: uid),
      ),
    );
  }
}