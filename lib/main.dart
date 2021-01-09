import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trial_three/screen/login.dart';
import 'package:flutter_trial_three/screen/signup.dart';
import 'package:flutter_trial_three/screen/start.dart';
import 'package:flutter_trial_three/screen/personalinfo.dart';
import 'package:flutter_trial_three/screen/contactinfo.dart';
import 'package:flutter_trial_three/screen/travelhistory.dart';
import 'package:flutter_trial_three/screen/covidupdates.dart';
import 'package:flutter_trial_three/screen/welcome.dart';
import 'package:flutter_trial_three/screen/dashboard.dart';
import 'package:flutter_trial_three/screen/admin_dashboard.dart';
import 'package:flutter_trial_three/screen/admin_userlist.dart';
import 'package:flutter_trial_three/screen/admin_userinfo.dart';
import 'package:flutter_trial_three/screen/selfdiagnosisform.dart';

void main() async {
  runApp(MyApp());
}
/**
 *  pantawag sa mga file
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: starts(),
      routes: {
        SignUpPage.routeName: (ctx)=> SignUpPage(),
        LoginPage.routeName: (ctx)=> LoginPage(),
        starts.routeName: (ctx)=> starts(),
        PersonalInfoPage.routeName: (ctx) => PersonalInfoPage(),
        ContactInfoPage.routeName: (ctx) => ContactInfoPage(),
        TravelHistoryPage.routeName: (ctx) => TravelHistoryPage(),
        WelcomePage.routeName: (ctx) => WelcomePage(),
        AdminDashboardPage.routeName: (ctx) => AdminDashboardPage(),



//        HomeScreen.routeName: (ctx)=> HomeScreen(),
      },
    );
  }
}

