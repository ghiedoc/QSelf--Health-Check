import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data.dart';
import 'package:flutter_trial_three/authenticate/auth.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DiagnosisForm extends StatefulWidget {

  DiagnosisForm({Key key}) : super(key: key);
  static const routeName = '/DiagnosisForm';

  @override
  _DiagnosisFormState createState() => _DiagnosisFormState();

}

class _DiagnosisFormState extends State<DiagnosisForm> {

  final AuthService auth = AuthService();
  bool singleTap = true;
  int _counter = 0;
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  var data;
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormFieldState> _specifyTextFieldKey =
  GlobalKey<FormFieldState>();

  // ONCHANGED HERE
  ValueChanged _onChanged = (val) => print(val);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FormBuilder(
                // context,
                key: _fbKey,
//                autovalidate: true,
                readOnly: false,
                child: Column(
                  children: <Widget>[
                    FormBuilderRadioGroup(
                      activeColor: Color(0xFFFFF5555),
                      decoration:
                      InputDecoration(labelText: 'Fever (more than 38 degree Celsius)'),
                      attribute: "fever",
                      onChanged: _onChanged,
                      validators: [FormBuilderValidators.required()],
                      options:
                      ["Yes", "No"]
                          .map((diagnose) =>
                          FormBuilderFieldOption(
                            value: diagnose,
                            child: Text('$diagnose'),
                          ))
                          .toList(growable: false),
                    ),
                    FormBuilderRadioGroup(
                      activeColor: Color(0xFFFFF5555),
                      decoration:
                      InputDecoration(
                        labelText: 'Cough',
                        fillColor: Colors.red,
                      ),
                      attribute: "cough",
                      //leadingInput: true,
                      onChanged: _onChanged,
                      validators: [FormBuilderValidators.required()],
                      options:
                      ["Yes", "No"]
                          .map((diagnose) =>
                          FormBuilderFieldOption(
                            value: diagnose,
                            child: Text('$diagnose'),
                          ))
                          .toList(growable: false),
                    ),
                    FormBuilderRadioGroup(
                      activeColor: Color(0xFFFFF5555),
                      decoration:
                      InputDecoration(labelText: 'Difficulty in Breathing'),
                      attribute: "dif_breathing",
                      //leadingInput: true,
                      onChanged: _onChanged,
                      validators: [FormBuilderValidators.required()],
                      options:
                      ["Yes", "No"]
                          .map((diagnose) =>
                          FormBuilderFieldOption(
                            value: diagnose,
                            child: Text('$diagnose'),
                          ))
                          .toList(growable: false),
                    ),
                    FormBuilderRadioGroup(
                      activeColor: Color(0xFFFFF5555),
                      decoration:
                      InputDecoration(labelText: 'Sorethroat'),
                      attribute: "sore_throat",
                      //leadingInput: true,
                      onChanged: _onChanged,
                      validators: [FormBuilderValidators.required()],
                      options:
                      ["Yes", "No"]
                          .map((diagnose) =>
                          FormBuilderFieldOption(
                            value: diagnose,
                            child: Text('$diagnose'),
                          ))
                          .toList(growable: false),
                    ),
                    FormBuilderRadioGroup(
                      activeColor: Color(0xFFFFF5555),
                      decoration:
                      InputDecoration(labelText: 'Headache'),
                      attribute: "headache",
                      //leadingInput: true,
                      onChanged: _onChanged,
                      validators: [FormBuilderValidators.required()],
                      options:
                      ["Yes", "No"]
                          .map((diagnose) =>
                          FormBuilderFieldOption(
                            value: diagnose,
                            child: Text('$diagnose'),
                          ))
                          .toList(growable: false),
                    ),
                    FormBuilderRadioGroup(
                      activeColor: Color(0xFFFFF5555),
                      decoration:
                      InputDecoration(labelText: 'Body Weakness'),
                      attribute: "body_weakness",
                      //leadingInput: true,
                      onChanged: _onChanged,
                      validators: [FormBuilderValidators.required()],
                      options:
                      ["Yes", "No"]
                          .map((diagnose) =>
                          FormBuilderFieldOption(
                            value: diagnose,
                            child: Text('$diagnose'),
                          ))
                          .toList(growable: false),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      color: Color(0xFFFFF5555),
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (_fbKey.currentState.saveAndValidate()) {
                          print(_fbKey.currentState.value);
                        } else {
                          print(_fbKey.currentState.value);
                          print("validation failed");
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
