import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'login.dart';
import 'start.dart';
import 'signup.dart';
import 'package:flutter_trial_three/database/DatabaseHelper.dart';
import 'signup.dart';
import 'data.dart';
import 'contactinfo.dart';

class PersonalInfoPage extends StatefulWidget {
  @override
  static const routeName = '/personalinfo';
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  FocusNode myFocusNode = new FocusNode();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final dbHelper = DatabaseHelper.instance;


//    function signUp btn
  void insert() async{
    Map<String, dynamic> row = {
      DatabaseHelper.c_email : data.email,
      DatabaseHelper.c_password : data.password,
      DatabaseHelper.c_fname : data.fname,
      DatabaseHelper.c_lname : data.lname,
      DatabaseHelper.c_nationality : data.nationality,
      DatabaseHelper.c_passport_no : data.passport_no,
  };

    final id = await dbHelper.insert(row);
    print("pasok na database: Id is:  $id");

  }
//  validation function
  void validation(){
    if(formkey.currentState.validate()){
      Navigator.of(context)
          .pushReplacementNamed(ContactInfoPage.routeName);
        insert();
    }else{
      print("not validated");
    }
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
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(SignUpPage.routeName);
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
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 40),
                            child: Text(
                              "Personal \nInformation",
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
                                if(value.toString().isEmpty){
                                  return 'INVALID FIRST NAME';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                data.email = value;
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
                                if(value.toString().isEmpty){
                                  return 'INVALID LAST NAME';
                                }
                                return null;
                              },
                            onChanged: (val){
                              data.lname = val;
                            }
                          ),
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
                                if(value.toString().isEmpty){
                                  return 'INVALID NATIONALITY';
                                }
                                return null;
                              },
                            onChanged: (val){
                              data.nationality = val;
                            }
                          ),
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
                                if(value.toString().isEmpty){
                                  return 'INVALID PASSPORT NUMBER';
                                }
                                return null;
                              },
                            onChanged: (val){
                              data.passport_no = val;
                            }
                          ),
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
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
}

