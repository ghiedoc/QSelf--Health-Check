//import 'package:flutter/material.dart';
//import 'package:flutter_trial_three/authenticate/auth.dart';
//import 'package:flutter_trial_three/screen/covidupdates.dart';
//import 'package:flutter_trial_three/screen/dashboard.dart';
//import 'package:flutter_trial_three/screen/homePage.dart';
//import 'package:flutter_trial_three/screen/selfdiagnosisform.dart';
//import 'package:flutter_trial_three/screen/changepassword.dart';
//import 'package:flutter_trial_three/screen/login.dart';
//import 'package:provider/provider.dart';
//import 'package:flutter_trial_three/database/dbFirebase.dart';
//import 'data.dart';
////
//
//class formList extends StatefulWidget {
//  static const routeName = '/home';
//  @override
//  _formListState createState() => _formListState();
//}
//
//class _formListState extends State<formList> {
//  @override
//  Widget build(BuildContext context) {
//    return  StreamProvider<User>.value(
//      value: AuthService().user,
//      child :MaterialApp(
//        debugShowCheckedModeBanner: false,
//        title: 'Login App',
//        theme: ThemeData(
//          primaryColor: Colors.white,
//        ),
//        home: HomePage(),
//      ),
//    );
//  }
//}
//
