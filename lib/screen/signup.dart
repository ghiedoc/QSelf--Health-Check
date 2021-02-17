import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'login.dart';
import 'start.dart';
import 'personalinfo.dart';
import 'data.dart';
import 'package:flutter_trial_three/authenticate/auth.dart';
import 'loading.dart';

class SignUpPage extends StatefulWidget {
  data d = new data();
  @override
  static const routeName = '/signup';
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController _passwordController = new TextEditingController();
  final AuthService auth = AuthService();

  FocusNode myFocusNode = new FocusNode();
  bool loading = false;

//  validation field
  void validate() async {
    if (formkey.currentState.validate()) {
      successfulToast();
      setState(() => loading = true);
      Navigator.of(context).pushReplacementNamed(PersonalInfoPage.routeName);
    } else {
      unsuccessfulToast();
      loading = false;
      print("not validated");
    }
  }

  void successfulToast() {
    Fluttertoast.showToast(
        msg: "Sign up Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void unsuccessfulToast() {
    Fluttertoast.showToast(
        msg: "Error Signing up!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

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
    return loading ? Loading() : Scaffold(
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
        body: WillPopScope(
          onWillPop: btnbackdd,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              margin: EdgeInsets.only(left: 50, right: 50),
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: <Widget>[
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 4,
                            child: Center(
                              child: Container(
                                child: Image.asset(
                                  'assets/images/qselflogolight.png',
                                  height: 170,
                                  width: 170,
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
                                      width: 300,
                                      child: TextFormField(
                                          decoration: InputDecoration(
                                            icon: new Icon(Icons.email),
                                            labelText: 'Email',
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
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: (value) {
                                            if (value.isEmpty ||
                                                !value.contains("@") ||
                                                !value.contains(".com")) {
                                              return 'Invalid email address';
                                            }
                                            return null;
                                          },
                                          onChanged: (val) {
                                            data.email = val;
                                          }),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 300,
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
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Invalid password';
                                            } else if (value.length < 8) {
                                              return 'Password must be atleast 8 characters long';
                                            } else if (!value.contains("@") &&
                                                (!value.contains("!") &&
                                                    !value.contains("#") &&
                                                    !value.contains("%"))) {
                                              return 'Password must be atleast 1 character';
                                            }
                                            return null;
                                          },
                                          onChanged: (val) {
                                            data.password = val;
                                            password:
                                            val;
                                          }
//                                  database paasok
                                          ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 300,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          icon: new Icon(Icons.lock),
                                          labelText: 'Confirm Password',
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
                                        validator: (value) {
                                          if (value.isEmpty ||
                                              value != _passwordController.text) {
                                            return 'Password do not match, try again';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: Container(
                          padding: EdgeInsets.only(top: 3, left: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: 300,
                            child: MaterialButton(
                              height: 50,
                              onPressed: () async {
                                validate();
                              },
                              color: Color(0xFFFF5555),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
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
                              "Already have an account?",
                              style: TextStyle(
                                color: Color(0xFF8A8A8A),
                                fontSize: 14,
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed(LoginPage.routeName);
                                },
                                child: Text(" Sign in here.",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF2353FF),
                                      fontSize: 14,
                                    ))),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
