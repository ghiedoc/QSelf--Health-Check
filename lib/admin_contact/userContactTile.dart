import 'package:flutter/material.dart';
import 'package:flutter_trial_three/screen/data.dart';

class userContactTile extends StatelessWidget {
  final userList user_t;
  final AdminuserContact user_contact;
  userContactTile({this.user_t, this.user_contact});
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
                "Contact Number: ${user_contact.contact_number} \n"
                "Contact Emergency Number: ${user_contact.contact_emergency} \n"
                "Quarantine Hotel: ${user_contact.quar_hotel}"),
        ),
      ),
    );
  }
}