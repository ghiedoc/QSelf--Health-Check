import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'login.dart';
import 'start.dart';
import 'package:flutter_trial_three/database/DatabaseHelper.dart';
import 'personalinfo.dart';
import 'data.dart';

class SignUpPage extends StatefulWidget {
  data d = new data();
  @override
  static const routeName = '/signup';
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController _passwordController = new TextEditingController();
  FocusNode myFocusNode = new FocusNode();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final dbHelper = DatabaseHelper.instance;


//
//  validation field
  void validate(){
    if(formkey.currentState.validate()){
      Navigator.of(context)
          .pushReplacementNamed(PersonalInfoPage.routeName);
//      submit();
    }else{
      print("not validated");
    }

  }
//  function signUp btn
//  void submit() async{
//    Map<String, dynamic> row = {
//    DatabaseHelper.c_email : email,
//      DatabaseHelper.c_password : password,
//  };
//
//    final id = await dbHelper.insert(row);
//    print("pasok na database: Id is:  $id");
//
//  }

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
                          height: MediaQuery.of(context).size.height/4,
                          child: Center(
                            child: Container(
                              child: Image.asset('assets/images/qselflogolight.png',
                                height: 170,
                                width:  170,
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
                                  SizedBox(height: 5,),
                                  TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        filled: true,
                                        labelStyle: TextStyle(
                                            color: myFocusNode.hasFocus ? Colors.blue : Colors.black
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.grey[400])),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.grey[400])),
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if(value.isEmpty || !value.contains("@") || !value.contains(".com")){
                                          return 'INVALID EMAIL ADDRESS';
                                        }
                                        return null;
                                      },
                                      onChanged: (val) {
                                       data.email = val;

                                      }),
                                  SizedBox(height: 30,),
                                  TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        filled: true,
                                        labelStyle: TextStyle(
                                            color: myFocusNode.hasFocus ? Colors.blue : Colors.black
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.grey[400])),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.grey[400])),
                                      ),
                                      obscureText: true,
                                      controller: _passwordController,
                                      validator: (value) {
                                        if (value.isEmpty) {return 'Enter New Passowrd';
                                        }else if (value.length < 8){
                                          return 'Password must be atleast 8 characters long';
                                        }else if(!value.contains("@") && (!value.contains("!") && !value.contains("#") && !value.contains("%"))){
                                          return 'Password must be atleast 1 character';
                                        }
                                        return null;
                                      },
                                    onChanged: (val){
                                        data.password = val;
                                      password: val;
                                    }

//                                  database paasok
                                      ),
                                  SizedBox(height: 30,),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Confirm Password',
                                      filled: true,
                                      labelStyle: TextStyle(
                                          color: myFocusNode.hasFocus ? Colors.blue : Colors.black
                                      ),
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
                                    validator: (value) {
                                      if (value.isEmpty ||
                                          value != _passwordController.text) {
                                        return 'NOT MATCH PASSWORD, PLEASE TRY AGAIN';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),),),
                      ],
                    ),
//                    Padding(padding: EdgeInsets.symmetric(horizontal: 40),
//                      child: Column(
//                        children: <Widget>[
//                          makeInput(label: "Email"),
//                          makeInput(label: "Password", obscureText: true),
//                          makeInput(label: "Confirm Password", obscureText: true),
//                        ],
//                      ),
//                    ),
                    SizedBox(height: 30,),
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
                            validate();
//                            submit();
//                            signUp();
                          },
                          color: Color(0xFFFF5555),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Sign up",
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
        ));
  }
}
