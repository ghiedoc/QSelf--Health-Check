import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trial_three/authenticate/auth.dart';
import 'data.dart';
import 'admin_result.dart';

class userTile extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final userList user_t;
  userTile({this.user_t});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5.0),
        child: ListTile(
          leading: Icon(
            Icons.person,
            size: 50,
            color: Color(0xFFFA8072),
          ),
          title: Text('Name: ${user_t.fname}' + " " +'${user_t.lname} \n'
              "Passport Number: ${user_t.passport_no}"),
          subtitle: Text("Nationality: " + user_t.nationality),
          onTap: () async {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => AdminResultPage(uid: user_t.uid)
            ));
          }
        ),
      ),
    );
  }
}