import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SelfDiagnosisFormPage extends StatefulWidget {

  SelfDiagnosisFormPage({Key key}) : super(key: key);

  static const routeName = '/selfDiagnosisForm';
  @override
  _SelfDiagnosisFormPageState createState() => _SelfDiagnosisFormPageState();
}

class _SelfDiagnosisFormPageState extends State<SelfDiagnosisFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFF5555),
        title: Text('Yow Sample'),
      ),

      body: SingleChildScrollView(
        child: new Container(
          child: new Column(
            children: <Widget> [
              new SizedBox(
                height: 10,
              ),
              new Text (
                'Daily Self-Check',
                style: new TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              new Text (
                'Do you have any of the following symptoms today?',
                style: new TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF757575),
                ),
              ),
              new SizedBox(
                height: 5,
              ),
              new Divider(
                  height: 5.0,
                  color: Colors.black
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 5),
                  /**
                   * Label lang 'to nung FEVER pero tignan
                   * mo naman ang daming naka-wrap HAHAHHAA
                   */
                  child: Row(
                    children: [
                      new Text(
                        'Fever',
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Color(0xFFFFF5555),
                        ),
                      ),
                      new Text(
                        ' (more than 38 degree Celsius)',
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          color: Color(0xFF8A8A8A),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /**
               * Radio Button para sa FEVER
               * yung value 0 is YES
               * yung value 1 is NO
               */
              Container(
                color: Colors.white,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    new Radio(
                      value: 0,
                    ),
                    new Text(
                      'Yes',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: 1,
                    ),
                    new Text(
                      'No',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              new Divider(
                  height: 5.0,
                  color: Colors.black
              ),

              /**
               * Label ng COUGH
               */
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 5),
                  child: Row(
                    children: [
                      new Text(
                        'Cough',
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Color(0xFFFFF5555),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /**
               * Radio Button para sa COUGH
               * yung value 0 is YES
               * yung value 1 is NO
               */
              Container(
                color: Colors.white,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    new Radio(
                      value: 0,
                    ),
                    new Text(
                      'Yes',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: 1,
                    ),
                    new Text(
                      'No',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              new Divider(
                  height: 5.0,
                  color: Colors.black
              ),

              /**
               * Label ng DIFFICULTY IN BREATHING
               */
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 5),
                  child: Row(
                    children: [
                      new Text(
                        'Difficulty in Breathing',
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Color(0xFFFFF5555),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /**
               * Radio Button para sa DIFFICULTY IN BREATHING
               * yung value 0 is YES
               * yung value 1 is NO
               */
              Container(
                color: Colors.white,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    new Radio(
                      value: 0,
                    ),
                    new Text(
                      'Yes',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: 1,
                    ),
                    new Text(
                      'No',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              new Divider(
                  height: 5.0,
                  color: Colors.black
              ),

              /**
               * Label ng SORETHROAT
               */
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 5),
                  child: Row(
                    children: [
                      new Text(
                        'Sorethroat',
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Color(0xFFFFF5555),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /**
               * Radio Button para sa SORETHROAT
               * yung value 0 is YES
               * yung value 1 is NO
               */
              Container(
                color: Colors.white,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    new Radio(
                      value: 0,
                    ),
                    new Text(
                      'Yes',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: 1,
                    ),
                    new Text(
                      'No',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              new Divider(
                  height: 5.0,
                  color: Colors.black
              ),

              /**
               * Label ng HEADACHE
               */
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 5),
                  child: Row(
                    children: [
                      new Text(
                        'Headache',
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Color(0xFFFFF5555),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /**
               * Radio Button para sa HEADACHE
               * yung value 0 is YES
               * yung value 1 is NO
               */
              Container(
                color: Colors.white,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    new Radio(
                      value: 0,
                    ),
                    new Text(
                      'Yes',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: 1,
                    ),
                    new Text(
                      'No',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              new Divider(
                  height: 5.0,
                  color: Colors.black
              ),

              /*
              * Label ng BODY WEAKNESS
              */
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 5),
                  child: Row(
                    children: [
                      new Text(
                        'Body Weakness',
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Color(0xFFFFF5555),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /**
               * Radio Button para sa BODY WEAKNESS
               * yung value 0 is YES
               * yung value 1 is NO
               */
              Container(
                color: Colors.white,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    new Radio(
                      value: 0,
                    ),
                    new Text(
                      'Yes',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: 1,
                    ),
                    new Text(
                      'No',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              new Divider(
                  height: 5.0,
                  color: Colors.black
              ),

              /*
              *  DITO YUNG SA BUTTON
              *  raised button ginamit ko kasi ayaw ng material btn ewan ko bakit
              */
              ButtonTheme(
                minWidth: double.infinity,
                height: 50.0,
                child: new RaisedButton(
                  color: Color(0xFFFF5555),
                  shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: new Text(
                    'Submit Form',
                    style: new TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () => {},
                ),
              ),
            ],
          ),
        ),
      ),

      /**
       * HAMBURGER DRAWER LOCATED HERE
       */

    );
  }
}
