import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trial_three/authenticate/auth.dart';
import 'package:flutter_trial_three/screen/diagnosisform.dart';
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
import 'package:flutter_trial_three/screen/admin_result.dart';
import 'package:flutter_trial_three/screen/homePage.dart';
import 'package:flutter_trial_three/screen/changepassword.dart';
import 'package:flutter_trial_three/screen/data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_trial_three/admin_contact/admin_user_contact.dart';
import 'package:flutter_trial_three/admin_user_info/admin_info.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  static const routeName = '/personalinfo';
  @override
  Widget build(BuildContext context) {
    return  StreamProvider<User>.value(
      value: AuthService().user,
      child :MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Login App',
          theme: ThemeData(
            primaryColor: Colors.white,
          ),
          home: starts(),
          routes: {
            starts.routeName: (ctx)=> starts(),
            LoginPage.routeName: (ctx)=> LoginPage(),
            SignUpPage.routeName: (ctx)=> SignUpPage(),
            PersonalInfoPage.routeName: (ctx) => PersonalInfoPage(),
            ContactInfoPage.routeName: (ctx) => ContactInfoPage(),
            TravelHistoryPage.routeName: (ctx) => TravelHistoryPage(),
            WelcomePage.routeName: (ctx) => WelcomePage(),
            AdminDashboardPage.routeName: (ctx) => AdminDashboardPage(),
            AdminUserContact.routeName: (ctx) => AdminUserContact(),
            AdminUserListPage.routeName: (ctx) => AdminUserListPage(),
            adminInfo.routeName: (ctx) =>adminInfo (),
            DashboardPage.routeName: (ctx) => DashboardPage(),
            AdminResultPage.routeName: (ctx) => AdminResultPage(),
            CovidUpdatePage.routeName: (ctx) => CovidUpdatePage(),
            HomePage.routeName: (ctx) => HomePage(),
            ChangePasswordPage.routeName: (ctx) => ChangePasswordPage(),
            DiagnosisForm.routeName: (ctx) => DiagnosisForm(),
          },
    ),
    );
  }
}

