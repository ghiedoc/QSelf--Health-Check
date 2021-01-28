import 'package:flutter/material.dart';
import 'package:flutter_trial_three/screen/login.dart';

createSuccessDialog(BuildContext context){
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed:  () {
      Navigator.of(context).pop(false);
    },
  );

  Widget continueButton = FlatButton(
    child: Text("Yes"),
    onPressed:  () async {
      try {
//          await _auth.signOut();
//        Navigator.push(
//            context,
//            new MaterialPageRoute(
//                builder: (context) => new LoginPage()));
      }catch(e){
        return Container();
      }
    },
  );

  Widget okButton = FlatButton(
    child: Text("Okay"),
    onPressed:  () {
      Navigator.of(context).pop(false);
    },
  );

  // set up the AlertDialog
  AlertDialog successAlert = AlertDialog(
    title: Text("Reset email link sent!"),
    actions: [
      okButton,
    ],
  );

  AlertDialog failedAlert = AlertDialog(
    title: Text("Sending link failed!"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return successAlert;
    },
  );
}

createFailedDialog(BuildContext context){

  Widget okButton = FlatButton(
    child: Text("Okay"),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog failedAlert = AlertDialog(
    title: Text("Sending link failed!"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return failedAlert;
    },
  );
}