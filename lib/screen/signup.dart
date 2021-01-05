import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'login.dart';
import 'start.dart';

class SignUpPage extends StatefulWidget {
  @override
  static const routeName = '/signup';
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController _passwordController = new TextEditingController();
  FocusNode myFocusNode = new FocusNode();

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
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
//                        decoration: BoxDecoration(
//                            image: DecorationImage(
//                                image: AssetImage('assets/qselflogolight.png')
//                            )
//                        )
                        ),
                        Center(
                            child: Form(
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
                                    if (value.isEmpty || value == "@") {
                                      return 'INVALID EMAIL ADDRESS';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
//                                  database paasok
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
                                    if (value.isEmpty) {
                                      return 'INVALID PASSWORD';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
//                                  database paasok
                                  }),
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
                                onSaved: (value) {},
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

//  Widget makeInput({label, obscureText = false}) {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        Text(label, style: TextStyle(
//          fontSize: 15,
//          color:Color(0xFF8A8A8A),
//        ),),
//        SizedBox(height: 5,),
//        TextField(
//          obscureText: obscureText,
//          decoration: InputDecoration(
//            filled: true,
//            fillColor: Colors.white,
//            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//            enabledBorder: OutlineInputBorder(
//                borderRadius: BorderRadius.circular(10),
//                borderSide: BorderSide(color: Colors.grey[400])
//            ),
//            border: OutlineInputBorder(
//                borderRadius: BorderRadius.circular(10),
//                borderSide: BorderSide(color: Colors.grey[400])
//            ),
//          ),
//        ),
//        SizedBox(height: 30,),
//      ],
}
