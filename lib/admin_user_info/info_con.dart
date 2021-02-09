import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_trial_three/screen/data.dart';
import 'admin_info.dart';
import 'userTravelInfoTile.dart';


class adminCon extends StatefulWidget {
  @override
  _adminConState createState() => _adminConState();
}

class _adminConState extends State<adminCon> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<List<userList>>(context) ?? [];
    final travel = Provider.of<List<travelInfo>>(context) ?? [];
    return Container(
      child: ListView.builder(
        itemCount: user.length,
        itemBuilder: (context, index){
          return travelTile(user_t:user[index], user_travel: travel[index]);
        },
      ),
    );
  }
}
