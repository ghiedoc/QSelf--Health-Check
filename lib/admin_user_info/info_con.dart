import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_trial_three/screen/data.dart';
import 'admin_info.dart';
import 'userTravelInfoTile.dart';
import 'package:flutter_trial_three/screen/loading.dart';


class adminCon extends StatefulWidget {
  @override
  _adminConState createState() => _adminConState();
}

class _adminConState extends State<adminCon> {
  @override
  Widget build(BuildContext context) {
    bool loading = true;
    final user = Provider.of<List<userList>>(context) ?? [];
    final travel = Provider.of<List<travelInfo>>(context) ?? [];
    try {
      return Container(
        child: ListView.builder(
          itemCount: user.length,
          itemBuilder: (context, index) {
            try {
              return travelTile(
                  user_t: user[index], user_travel: travel[index]);
            }catch(e){
              return loading ? Loading() : Container(child: Text("LOADING"),);
            }
          },
        ),
      );
    } catch (e) {
      return Container(child: Text("LOADING"),);
    }
  }
}
