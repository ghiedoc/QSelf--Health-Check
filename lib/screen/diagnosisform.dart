import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data.dart';
import 'package:flutter_trial_three/authenticate/auth.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/cupertino.dart';

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

//  var data;
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormFieldState> _specifyTextFieldKey =
  GlobalKey<FormFieldState>();

  // ONCHANGED HERE
  ValueChanged _onChanged = (val) => print(val);

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  AndroidFlutterLocalNotificationsPlugin androidFlutterLocalNotificationsPlugin;
  AndroidInitializationSettings androidInitializationSettings;
  IOSInitializationSettings iosInitializationSettings;

  InitializationSettings initializationSettings;

  void initialize() async {
    androidInitializationSettings =
        AndroidInitializationSettings('ic_launcher');
    iosInitializationSettings = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }
  void _showNotifications() async {
    await notification();
  }

  void _showNotificationsAfterSecond() async {
    await notificationAfterSec();
  }

  Future<void> notification() async {
    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
        'Channel ID', 'Channel title', 'channel body',
        priority: Priority.high,
        importance: Importance.max,
        ticker: 'test');

    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails, iOS: iosNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
        0, 'Hello there', 'please subscribe my channel', notificationDetails);
  }

  Future<void> notificationAfterSec() async {
    var timeDelayed = DateTime.now().add(Duration(seconds: 5));
    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
        'second channel ID', 'second Channel title', 'second channel body',
        priority: Priority.high,
        importance: Importance.max,
        ticker: 'test');

    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails, iOS: iosNotificationDetails);
    await flutterLocalNotificationsPlugin.schedule(1, 'Hello there',
        'please fill up your form thank you :)', timeDelayed, notificationDetails);
  }

  Future onSelectNotification(String payLoad) {
    if (payLoad != null) {
      print(payLoad);
    }

    // we can set navigator to navigate another screen
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: <Widget>[
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              print("");
            },
            child: Text("Okay")),
      ],
    );
  }





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
                    FormBuilderRadio(
                      activeColor: Color(0xFFFFF5555),
                      decoration:
                      InputDecoration(labelText: 'Fever (more than 38 degree Celsius)'),
                      attribute: "fever",
                      onChanged: (val){
                        diagnoseForm.fever = val;
                        print(val);
                      },
                      leadingInput: true,
                      //onChanged: _onChanged,
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
                    FormBuilderRadio(
                      activeColor: Color(0xFFFFF5555),
                      decoration:
                      InputDecoration(
                        labelText: 'Cough',
                        fillColor: Colors.red,
                      ),
                      attribute: "cough",
                      onChanged: (val){
                        diagnoseForm.cough = val;
                        print(val);
                      },
                      leadingInput: true,
                      //onChanged: _onChanged,
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
                    FormBuilderRadio(
                      activeColor: Color(0xFFFFF5555),
                      decoration:
                      InputDecoration(labelText: 'Difficulty in Breathing'),
                      attribute: "dif_breathing",
                      onChanged: (val){
                        diagnoseForm.diff_breathing = val;
                        print(val);
                      },
                      leadingInput: true,
                      //onChanged: _onChanged,
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
                    FormBuilderRadio(
                      activeColor: Color(0xFFFFF5555),
                      decoration:
                      InputDecoration(labelText: 'Sorethroat'),
                      attribute: "sore_throat",
                      onChanged: (val){
                        diagnoseForm.sore_throat = val;
                        print(val);
                      },
                      leadingInput: true,
                      //onChanged: _onChanged,
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
                    FormBuilderRadio(
                      activeColor: Color(0xFFFFF5555),
                      decoration:
                      InputDecoration(labelText: 'Headache'),
                      attribute: "headache",
                      onChanged: (val){
                        diagnoseForm.heacache = val;
                        print(val);
                      },
                      leadingInput: true,
                      //onChanged: _onChanged,
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
                    FormBuilderRadio(
                      activeColor: Color(0xFFFFF5555),
                      decoration:
                      InputDecoration(labelText: 'Body Weakness'),
                      attribute: "body_weakness",
                      onChanged: (val){
                        diagnoseForm.body_weaknesses = val;
                        print(val);
                      },
                      leadingInput: true,
                      //onChanged: _onChanged,
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
                      onPressed: () async {
                        if (_fbKey.currentState.saveAndValidate()) {
                          dynamic result = await auth.insertForm(data.email, data.password);
                            print("pasok na: $result");
                          _fbKey.currentState.reset();
                          _showNotificationsAfterSecond();
//                          print(_fbKey.currentState.value);
                          print(_fbKey.currentState.value);
                          _fbKey.currentState.reset();
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
