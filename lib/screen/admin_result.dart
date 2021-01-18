import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'data.dart';
import 'package:flutter_trial_three/database/dbFirebase.dart';
class AdminResultPage extends StatefulWidget {
  static const routeName = '/adminResult';
  @override
  _AdminResultPageState createState() => _AdminResultPageState();
}

class _AdminResultPageState extends State<AdminResultPage> {
  @override
  Widget build(BuildContext context) {
    final form= Provider.of<User>(context);
    final border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    );
    final padding = const EdgeInsets.all(4.0);
    return StreamBuilder<userform>(
      stream: dbService(uid: form.uid).userRes,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          userform user_form  = snapshot.data;
          print('HEY ${user_form.cough}');
          return Scaffold(
            backgroundColor: Color(0xFFEFEFEF),
            appBar: AppBar(
              backgroundColor: Color(0xFFEFEFEF),
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
              title: Text(""),
            ),
            body: Container(
              padding: EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 130,
                    child: Padding(
                      padding: padding,
                      child: Card(
                        shape: border,
                        elevation: 3.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: const ListTile(
                                leading: Icon(Icons.wb_sunny, size: 60),
                                title: Text(''),
//                                    style: TextStyle(
//                                        color: Colors.black,
//                                        fontSize: 32,
//                                        fontWeight: FontWeight.bold)),
                                subtitle: Text('Steve Rogers',
                                    style: TextStyle(color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 250,
                    child: Padding(
                      padding: padding,
                      child: Card(
                        shape: border,
                        elevation: 3.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(' Day - ${user_form.day} \n'
                                ' Fever - ${user_form.fever} \n Cough - ${user_form
                                .cough} \n Diffculty in Breathing - ${user_form
                                .diff_breathing} \n Sore Throat - ${user_form
                                .sore_throat} \n Headache - ${user_form.headache} \n '
                                'Body Weakness - ${user_form.sore_throat} ',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return null;
        }
      }
    );
  }
}