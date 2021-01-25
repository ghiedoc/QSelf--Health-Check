import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trial_three/authenticate/auth.dart';
import 'package:flutter_trial_three/screen/changepassword.dart';

class ChangePasswordPage extends StatefulWidget {
  static const routeName = '/changepass';
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {

  TextEditingController _currentpasswordController = new TextEditingController();
  TextEditingController _newpasswordController = new TextEditingController();
  final AuthService _auth = AuthService();

  FocusNode myFocusNode = new FocusNode();

  @override
  static const routeName = '/changepass';
  var _formKey = GlobalKey<FormState>();
  bool checkCurrentPasswordValid = true;

  String _email;
  final auth = FirebaseAuth.instance;

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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _email = value.trim();
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Email',
                              errorText: checkCurrentPasswordValid ? null : "Please double check your current email",
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
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      //----------------PASSWORD HERE-----------------
                      child: MaterialButton(
                        onPressed: ()  {
                          auth.sendPasswordResetEmail(email: _email);
                          Navigator.of(context).pop();
                          print('RESET EMAIL SENT');
                        },
                        minWidth: double.infinity,
                        height: 50,
                        color: Color(0xFF1F1F1F),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "Send Request",
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
              SizedBox(
                height: 20.0,
              ),


            ],
          ),
        ),
      ),
    );
  }
}
