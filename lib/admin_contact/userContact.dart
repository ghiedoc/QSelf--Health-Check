import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_trial_three/screen/data.dart';
import 'userContactTile.dart';
import 'package:flutter_trial_three/screen/loading.dart';


class userContactInfo extends StatefulWidget {
  @override
  _userContactInfoState createState() => _userContactInfoState();
}

class _userContactInfoState extends State<userContactInfo> {
  @override
  Widget build(BuildContext context) {
    bool loading = true;
    final user = Provider.of<List<userList>>(context) ?? [];
    final contact = Provider.of<List<AdminuserContact>>(context) ?? [];
    try{
      return Container(
        child: ListView.builder(
          itemCount: user.length,
          itemBuilder: (context, index){
            try{
              return userContactTile(user_t:user[index], user_contact: contact[index]);
            }catch(e){
              return loading ? Loading() : Container(child: Text("LOADING"),);
            }

          },
        ),
      );
    }catch (e){
      return Container(child: Text("LOADING"),);
    }

}
}

