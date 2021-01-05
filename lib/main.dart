import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trial_three/login.dart';
import 'package:flutter_trial_three/signup.dart';


void main() => runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: "OpenSans",
//        scaffoldBackgroundColor: const Color(0xFFFA8072),
      ),
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    ));

class HomePage extends StatelessWidget {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Get Started. \nYour Health \nMatters.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 36
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
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 30
                ),
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/qselflogodark.png')
                  )
                )
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {},
                      color: Color(0xFBB1F1F1F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                    child: Text("Get Started", style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ))
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {},
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
              )
            ],
          )
        )
      ),
    );
  }
}