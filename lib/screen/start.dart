import 'package:flutter/material.dart';
import 'package:flutter_trial_three/screen/login.dart';
import 'login.dart';
import 'signup.dart';
import 'loading.dart';

class starts extends StatefulWidget {
  @override
  static const routeName = '/starts';
  _startState createState() => _startState();
}

class _startState extends State<starts> {

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFA8072),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 90),
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Your Health Matters",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 42
                  ),),
                  SizedBox(height: 20,),
                  Text("an application that helps you self-diagnose for 14-days",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16
                  ),),
                ],
              ),
              SizedBox(height: 70),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 30
                ),
                height: MediaQuery.of(context).size.height / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/qselflogodark.png')
                  )
                )
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed
                            (SignUpPage.routeName);
                        },
                        color: Color(0xFBB1F1F1F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                      child: Text("Get Started", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ))
                    ),
                    SizedBox(height: 15,),
                    Container(
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed
                              (LoginPage.routeName);
                          },
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.white,
                              width: 3,
                            ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text("Sign in", style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ))
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        )
      ),
    );
  }
}