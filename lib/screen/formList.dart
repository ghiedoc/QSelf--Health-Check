import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data.dart';
import 'FormTile.dart';

class formList extends StatefulWidget {
  @override
  _formListState createState() => _formListState();
}

class _formListState extends State<formList> {
  @override
  Widget build(BuildContext context) {
    final form = Provider.of<List<userform>>(context);

    return ListView.builder(
      itemCount: form.length,
      itemBuilder: (context, index){
        return FormTile(userRes: form[index]);
      },

    );
  }
}

