import 'package:flutter/material.dart';
import 'package:flutter_trial_three/screen/changepassword.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {

  TextEditingController _passwordController = new TextEditingController();
  FocusNode myFocusNode = new FocusNode();

  @override
  static const routeName = '/';
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),

      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          margin: EdgeInsets.only(left: 10, right: 10),
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Change Password",
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
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
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                BorderSide(color: Colors.grey[400])),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                BorderSide(color: Colors.grey[400])),
                          ),
                          obscureText: true,
                          controller: _passwordController,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            filled: true,
                            labelStyle: TextStyle(
                                color: myFocusNode.hasFocus
                                    ? Colors.blue
                                    : Colors.black),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                BorderSide(color: Colors.grey[400])),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                BorderSide(color: Colors.grey[400])),
                          ),
                          obscureText: true,
                          controller: _passwordController,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 50,
                        onPressed: () {},
                        color: Color(0xFF1F1F1F),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
