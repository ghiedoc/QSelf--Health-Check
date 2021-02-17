import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trial_three/screens/tracker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CovidUpdatePage extends StatefulWidget {
  static const routeName = '/covidUpdate';

  @override
  _CovidUpdatePageState createState() => _CovidUpdatePageState();
}

class _CovidUpdatePageState extends State<CovidUpdatePage> {

  final appTitle = '';

  DateTime backButtonPressTime;

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
    return Scaffold(
      backgroundColor: Color(0xFFFA8072),
        body:  WillPopScope(
            onWillPop: btnbackdd,
            child: Tracker()),
    );
  }
}
