import 'package:flutter/material.dart';
import 'formList.dart';
import 'data.dart';

class FormTile extends StatelessWidget {
  final userform userRes;
  FormTile({this.userRes});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        child: Card(
          elevation: 3.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 20.0, horizontal: 20.0),
            child: Align(
              alignment: Alignment.center,
              child: Center(
                child: Text(' Day - ${userRes.day} \n'
                  ' Fever - ${userRes.fever} \n Cough - ${userRes
                      .cough} \n Diffculty in Breathing - ${userRes
                      .diff_breathing} \n Sore Throat - ${userRes
                      .sore_throat} \n Headache - ${userRes.headache} \n '
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
    );
  }
}
