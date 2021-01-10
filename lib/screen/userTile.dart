import 'package:flutter/material.dart';
import 'data.dart';

class userTile extends StatelessWidget {

  final userList user_t;
  userTile({this.user_t});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text('Name: ${user_t.fname}' + " " +'${user_t.lname} \n'
              "Passport Number: ${user_t.passport_no}"),
            subtitle: Text("Nationality: " + user_t.nationality),
        ),

      ),
    );
  }
}

