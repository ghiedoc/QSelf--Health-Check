import 'package:flutter/material.dart';
import 'data.dart';

class FormTile extends StatelessWidget {
  final userform userRes;

  final selectedDiagnosis;
  FormTile({this.userRes, this.selectedDiagnosis});

  @override
  Widget build(BuildContext context) {
    if (selectedDiagnosis == userRes.userID) {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: Card(
            elevation: 3.0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Align(
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    ' Day - ${userRes.day} \n'
                    ' Fever - ${userRes.fever} \n Cough - ${userRes.cough} \n Diffculty in Breathing - ${userRes.diff_breathing} \n Sore Throat - ${userRes.sore_throat} \n Headache - ${userRes.headache} \n '
                    'Body Weakness - ${userRes.sore_throat} ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } else  {
      return Padding(padding: EdgeInsets.all(0.0));
    }
  }
}
