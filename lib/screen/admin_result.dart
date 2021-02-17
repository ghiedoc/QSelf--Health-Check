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


  DateTime backButtonPressTime;

  @override
  Widget build(BuildContext context) {
    Future<bool> btnbackdd() async {
      DateTime currentTime = DateTime.now();
      bool backbtn = backButtonPressTime == null ||
          currentTime.difference(backButtonPressTime) > Duration(seconds: 3);
      if(backbtn){
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
        body: WillPopScope(
            onWillPop: btnbackdd,
            child: formList(selectedDiagnosis: uid)),
      ),
    );
  }
}