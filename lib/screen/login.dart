import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trial_three/screen/admin_dashboard.dart';
import 'package:flutter_trial_three/screen/homePage.dart';
import 'package:flutter_trial_three/screen/homePage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'changepassword.dart';
import 'login.dart';
import 'start.dart';
import 'signup.dart';
import 'package:flutter_trial_three/authenticate/auth.dart';
import 'data.dart';
import 'dashboard.dart';
import 'selfdiagnosisform.dart';
import 'admin_result.dart';
import 'admin_userlist.dart';
import 'homePage.dart';
import 'package:flutter_trial_three/database/dbFirebase.dart';
import 'catch.dart';

enum AuthFormType { reset }

class LoginPage extends StatefulWidget {
  @override
  static const routeName = '/login';
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordController = new TextEditingController();
  FocusNode myFocusNode = new FocusNode();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();

//  String email = '';
//  String password = '';
//  String error = '';


//ERROR PA DITO
  void validate() async {
    var results = formkey.currentState.validate();
      try {
        if (results) {
          dynamic result = await _auth.signIn(data.email, data.password);
          print("pasok na naka log-in na siya: $result");
          if (result == null) {
            unsuccessfulToast();
            print(result);
        }else{
            successfulToast();
            Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          }
        } else {
          print("not validated");
        }
      } catch (e) {
        return e;
//      }
    }
  }

  void successfulToast() {
    Fluttertoast.showToast(
        msg: "Sign in Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void unsuccessfulToast() {
    Fluttertoast.showToast(
        msg: "Error Signing in!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(starts.routeName);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Color(0xFFFA8072),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          margin: EdgeInsets.only(left: 10, right: 10),
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "QSelf-Health Check",
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 5,
                        child: Center(
                          child: Container(
                            child: Image.asset(
                              'assets/images/qselflogolight.png',
                              height: 200,
                              width: 200,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Form(
                          key: formkey,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 300.0,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      filled: true,
                                        icon: new Icon(Icons.account_circle),
                                      labelStyle: TextStyle(
                                          color: myFocusNode.hasFocus
                                              ? Colors.blue
                                              : Colors.black),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 10),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.grey[400])),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.grey[400])),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (val) {
                                      setState(() {
                                        data.email = val;
                                      });
                                    },
                                    validator: (value) {
                                      if (value.isEmpty ||
                                          !value.contains("@") ||
                                          !value.contains(".com")) {
                                        return 'Incorrect Email or Password';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: 300.0,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      icon: new Icon(Icons.lock),
                                      labelText: 'Password',
                                      filled: true,
                                      labelStyle: TextStyle(
                                          color: myFocusNode.hasFocus
                                              ? Colors.blue
                                              : Colors.black),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 10),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.grey[400])),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.grey[400])),
                                    ),
                                    obscureText: true,
                                    controller: _passwordController,
                                    onChanged: (val) {
                                      setState(() {
                                        data.password = val;
                                      });
                                    },
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Incorrect Email or Password';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChangePasswordPage()));
                                  },
                                  child: Text("Forgot Password?",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF2353FF),
                                        fontSize: 14,
                                      )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(
                        minWidth: 300,
                        height: 50,
                        onPressed: () async {
                          if(data.email == "admin@email.com" && data.password == "123456"){
                            successfulToast();
                            Navigator.of(context).pushReplacementNamed(AdminDashboardPage.routeName);
                          }else{
                            validate();
                          }
                        },
                        color: Color(0xFFFF5555),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Color(0xFF8A8A8A),
                            fontSize: 14,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed(SignUpPage.routeName);
                          },
                          child: Text(" Sign up here.",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2353FF),
                                fontSize: 14,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
