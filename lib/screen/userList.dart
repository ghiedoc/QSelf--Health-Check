import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'admin_userlist.dart';
import 'data.dart';
import 'userTile.dart';

class userInfo extends StatefulWidget {
  @override
  _userInfoState createState() => _userInfoState();
}

class _userInfoState extends State<userInfo> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<List<userList>>(context);
    user.forEach((user){
    });

    return ListView.builder(
      itemCount: user.length,
      itemBuilder: (context, index){
        return userTile(user_t:user[index]);
      },
    );
  }
}

