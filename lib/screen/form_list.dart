import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data.dart';

import 'userTileResult.dart';


class formList extends StatefulWidget {
  @override
  _formListState createState() => _formListState();
}

class _formListState extends State<formList> {
  @override
  Widget build(BuildContext context) {
    final _form = Provider.of<List<userform>>(context);


    return ListView.builder(
      itemBuilder: (context, index){
       return userTileForm(form_list:_form[index]);
      }
    );
  }
}

