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
import 'package:flutter_trial_three/screen/changepassword.dart';

void main() async {
  runApp(MyApp());
}
/**
 *  pantawag sa mga file
 */
class MyApp extends StatelessWidget {
  static const routeName = '/personalinfo';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: LoginPage(),
      routes: {
        starts.routeName: (ctx)=> starts(),
        LoginPage.routeName: (ctx)=> LoginPage(),
        SignUpPage.routeName: (ctx)=> SignUpPage(),
        PersonalInfoPage.routeName: (ctx) => PersonalInfoPage(),
        ContactInfoPage.routeName: (ctx) => ContactInfoPage(),
        TravelHistoryPage.routeName: (ctx) => TravelHistoryPage(),
        WelcomePage.routeName: (ctx) => WelcomePage(),
        AdminDashboardPage.routeName: (ctx) => AdminDashboardPage(),
        AdminUserInfoPage.routeName: (ctx) => AdminUserInfoPage(),
        AdminUserListPage.routeName: (ctx) => AdminUserListPage(),
        DashboardPage.routeName: (ctx) => DashboardPage(),
        SelfDiagnosisFormPage.routeName: (ctx) => SelfDiagnosisFormPage(),
//        HomeScreen.routeName: (ctx)=> HomeScreen(),
      },
    );
  }
}

