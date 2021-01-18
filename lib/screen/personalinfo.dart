import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'login.dart';
import 'start.dart';
import 'signup.dart';
import 'signup.dart';
import 'data.dart';
import 'package:flutter_trial_three/authenticate/auth.dart';
import 'contactinfo.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'admin_userinfo.dart';
import 'admin_userlist.dart';

class PersonalInfoPage extends StatefulWidget {
  @override
  static const routeName = '/personalinfo';
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  FocusNode myFocusNode = new FocusNode();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final AuthService auth = AuthService();

//  validation function
  void validation() async {
    if (formkey.currentState.validate()) {
      dynamic result = await auth.signUp(data.email, data.password);
      print("pasok na: $result");
      successfulToast();
      Navigator.of(context).pushReplacementNamed(ContactInfoPage.routeName);
    } else {
      unsuccessfulToast();
      print("not validated");
    }
  }

  void successfulToast(){
    Fluttertoast.showToast(
        msg: "Added Successfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  void unsuccessfulToast() {
    Fluttertoast.showToast(
        msg: "Error Adding Input!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  String valueChoose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
//          leading: IconButton(
//            onPressed: () {
//              Navigator.of(context)
//                  .pushReplacementNamed(SignUpPage.routeName);
//            },
//            icon: Icon(
//              Icons.arrow_back_ios,
//              size: 20,
//              color: Color(0xFFFA8072),
//            ),
//          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            margin: EdgeInsets.only(left: 10, right: 10),
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              "Personal Information",
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'First Name',
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
                              validator: (value) {
                                Pattern pattern = r'^[a-zA-Z]+$';
                                RegExp regex = RegExp(pattern);

                                if (value.toString().isEmpty ) {
                                  return 'Invalid entry';
                                } else if(!regex.hasMatch(value)) {
                                  return 'Must contain letters only';
                                }
                                return null;
                              },
                              onChanged: (val) {
                                data.fname = val;
                              },
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Last Name',
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
                                validator: (value) {
                                  Pattern pattern = r'^[a-zA-Z]+$';
                                  RegExp regex = RegExp(pattern);

                                  if (value.toString().isEmpty ) {
                                    return 'Invalid entry';
                                  } else if(!regex.hasMatch(value)) {
                                    return 'Must contain letters only';
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  data.lname = val;
                                }),
                            SizedBox(
                              height: 30.0,
                            ),
                            //dropdown
                            TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Nationality',
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
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return 'INVALID NATIONALITY';
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  data.nationality = val;
                                }),
                            SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Passport Number',
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
                                validator: (value) {
                                  Pattern pattern = r'^[A-PR-WY][1-9]\d\s?\d{4}[1-9]$';
                                  RegExp regex = RegExp(pattern);

                                  if (value.toString().isEmpty) {
                                    return 'Invalid passport number';
                                  }else if(!regex.hasMatch(value)){
                                    return 'Invalid passport number format';
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  data.passport_no = val;
                                }),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
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
                          onPressed: () {
                            validation();
                          },
                          color: Color(0xFFFF5555),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Next",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        successfulToast();
                      },
                      child: Text(
                        "enter"
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
