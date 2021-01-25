import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trial_three/authenticate/auth.dart';
import 'data.dart';
import 'admin_result.dart';
import 'package:flutter_trial_three/database/dbFirebase.dart';

class userTile extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final userList user_t;
  userTile({this.user_t});

   userList get userT {
//     print('dito ${user_t.uid}');
    return user_t;

  }
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
            print(user_t.uid);
//            print("pasok na naka log-in na siya: $result");
//            Navigator.of(context).pushNamed(AdminResultPage.routeName);
          }
        ),
      ),
    );
  }
}