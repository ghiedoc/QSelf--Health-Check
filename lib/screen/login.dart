import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'login.dart';
import 'start.dart';
import 'signup.dart';
import 'package:flutter_trial_three/authenticate/auth.dart';
import 'data.dart';
import 'dashboard.dart';
import 'selfdiagnosisform.dart';

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

  void validate() async {}

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
                                      validator: (value) {
                                        if (value.isEmpty ||
                                            !value.contains("@") ||
                                            !value.contains(".com")) {
                                          return 'INVALID EMAIL ADDRESS';
                                        }
                                        return null;
                                      },
                                      onChanged: (val) {
                                        data.email = val;
                                      }),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: 300.0,
                                  child: TextFormField(
                                      decoration: InputDecoration(
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
                                          return 'Enter New Passowrd';
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
                                      }),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
//                                  database paasok
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
                          if (formkey.currentState.validate()) {
                            dynamic result =
                                await _auth.signIn(data.email, data.password);
                            print("pasok na: $result");
                            Navigator.of(context)
                                .pushReplacementNamed(SelfDiagnosisFormPage.routeName);
                          }else{
                            print("not validated");
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
