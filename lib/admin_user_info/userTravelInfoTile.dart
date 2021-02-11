import 'package:flutter/material.dart';
import 'package:flutter_trial_three/screen/data.dart';
import 'package:timeago/timeago.dart' as timeago;

class travelTile extends StatelessWidget {
  final userList user_t;
  final travelInfo user_travel;
  travelTile({this.user_t, this.user_travel});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5.0),
        child: ListTile(
            leading: Icon(
              Icons.flight,
              size: 50,
              color: Color(0xFF4AA786),
            ),
            title: Text('Name: ${user_t.fname}' + " " +'${user_t.lname} \n'
                "Arrival Date: ${user_travel.travel_arrival_date} \n"
                "Country: ${user_travel.travel_country}"),
        ),
      ),
    );
  }
}
