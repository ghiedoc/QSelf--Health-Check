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
        margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5.0),
        child: ListTile(
          leading: Icon(
            Icons.person,
            size: 50,
            color: Color(0xFFFA8072),
          ),
          title: Text(
            'Name: ${user_t.fname}' + " " + '${user_t.lname}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Nationality: ${user_t.nationality}' + " | " + 'Passport No. ${user_t.passport_no}'),
        ),
      ),
    );
  }
}
