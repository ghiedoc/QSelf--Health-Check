import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
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
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Color(0xFFFA8072),),
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
                      Text("QSelf-Health \nCheck", style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,

                      ),),
                      SizedBox(height: 20,),
                      Container(
                          height: MediaQuery.of(context).size.height/4,
                          child: Center(
                            child: Container(
                              child: Image.asset('assets/images/qselflogolight.png',
                                height: 200,
                                width:  200,
                              ),
                            ),
                          ),
//                        decoration: BoxDecoration(
//                            image: DecorationImage(
//                                image: AssetImage('assets/qselflogolight.png')
//                            )
//                        )
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        makeInput(label: "Email"),
                        makeInput(label: "Password"),
                      ],
                    ),
                  ),
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
      ],
    );
  }
}
