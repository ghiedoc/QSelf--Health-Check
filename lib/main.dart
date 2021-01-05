import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trial_three/screen/login.dart';
import 'package:flutter_trial_three/screen/signup.dart';
import 'package:flutter_trial_three/screen/start.dart';


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
//        HomeScreen.routeName: (ctx)=> HomeScreen(),
      },
    );
  }
}

