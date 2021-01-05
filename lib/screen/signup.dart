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
              Navigator.of(context).pushReplacementNamed
                (starts.routeName);
            },
            icon: Icon(Icons.arrow_back_ios, size: 20, color: Color(0xFFFA8072),),
          ),
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
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Sign Up", style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,

                        ),),
                        SizedBox(height: 20,),
//                        Container(
//                          height: MediaQuery.of(context).size.height/4,
//                          child: Center(
//                            child: Container(
//                              child: Image.asset('assets/images/qselflogolight.png',
//                                height: 200,
//                                width:  200,
//                              ),
//                            ),
//                          ),
////                        decoration: BoxDecoration(
////                            image: DecorationImage(
////                                image: AssetImage('assets/qselflogolight.png')
////                            )
////                        )
//                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          makeInput(label: "Email"),
                          makeInput(label: "Password", obscureText: true),
                          makeInput(label: "Confirm Password", obscureText: true),
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
                          color: Color(0xFFFF5555),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text("Sign up", style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Already have an account?", style: TextStyle(
                            color: Color(0xFF8A8A8A),
                            fontSize: 14,
                          ),),
                          Text(" Sign in here.", style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2353FF),
                            fontSize: 14,
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }

  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: TextStyle(
          fontSize: 15,
          color:Color(0xFF8A8A8A),
        ),),
        SizedBox(height: 5,),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey[400])
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey[400])
            ),
          ),
        ),
        SizedBox(height: 30,),
      ],
    );
  }
}
