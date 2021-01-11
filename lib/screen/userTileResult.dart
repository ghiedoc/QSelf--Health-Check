import 'package:flutter/material.dart';
import 'data.dart';

class userTileForm extends StatelessWidget {
  final userform form_list;
  userTileForm({this.form_list});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Card(
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 20.0, horizontal: 20.0),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Fever - ${form_list.fever} \n Cough - ${form_list
                  .cough} \n Diffculty in Breathing - ${form_list
                  .diff_breathing} \n Sore Throat - ${form_list
                  .heacache} \n Body Weakness - ${form_list.sore_throat} ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
//    Container(
//      padding: EdgeInsets.all(20.0),
//      child: ListView(
//        children: <Widget>[
//          Container(
//            height: 130,
//            child: Padding(
//              child: Card(
//                elevation: 3.0,
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Center(
//                      child: const ListTile(
//                        leading: Icon(Icons.wb_sunny, size: 60),
//                        title: Text('Day 1',
//                            style: TextStyle(
//                                color: Colors.black,
//                                fontSize: 32,
//                                fontWeight: FontWeight.bold)),
//                        subtitle: Text('Steve Rogers',
//                            style: TextStyle(color: Colors.black)),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ),
//          Container(
//            height: 250,
//            child: Padding(
//              padding: padding,
//              child: Card(
//                shape: border,
//                elevation: 3.0,
//                child: Padding(
//                  padding: const EdgeInsets.symmetric(
//                      vertical: 20.0, horizontal: 20.0),
//                  child: Align(
//                    alignment: Alignment.center,
//                    child: Text(
//                      ' Fever - Yes \n Fever - Yes \n Fever - Yes \n Fever - Yes \n Fever - Yes \n Fever - Yes \n',
//                      style: TextStyle(
//                        fontSize: 20,
//                      ),
//                    ),
//                  ),
//                ),
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
  }
}
