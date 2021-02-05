import 'package:flutter/material.dart';
import 'data.dart';
import 'package:provider/provider.dart';
import 'FormTile.dart';

class formList extends StatelessWidget {
  String selectedDiagnosis;
  formList({this.selectedDiagnosis});
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<List<userform>>(context) ?? [];

    return Container(
      child: ListView.builder(
        itemCount: user.length,
        itemBuilder: (context, index){
          return FormTile(userRes :user[index], selectedDiagnosis: selectedDiagnosis);
        },
      ),
    );
  }
}
