import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data.dart';
import 'package:flutter_trial_three/authenticate/auth.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_trial_three/database/dbFirebase.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'loading.dart';
import 'package:fluttertoast/fluttertoast.dart';


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

  //pambilang ng history (day)
  QuerySnapshot querySnapshots;

  void initState(){
    initialize();
    super.initState();
    getDiagnoseForm().then((results){
      setState(() {
        querySnapshots = results;
      });
    });
  }
  //pang kuha ng Diagnosis
  getDiagnoseForm() async{
    return await Firestore.instance.collection('diagnose_form').getDocuments();
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  AndroidFlutterLocalNotificationsPlugin androidFlutterLocalNotificationsPlugin;
  AndroidInitializationSettings androidInitializationSettings;
  IOSInitializationSettings iosInitializationSettings;

  InitializationSettings initializationSettings;

  void initialize() async {
    androidInitializationSettings =
        AndroidInitializationSettings('qlogo');
    iosInitializationSettings = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  void _showNotificationsAfterSecond() async {
    await notificationAfterSec();
  }


  Future<void> notificationAfterSec() async {
    var timeDelayed = DateTime.now().
    add(Duration(seconds: 5));
    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
        'second channel ID', 'second Channel title', 'second channel body',
        priority: Priority.high,
        importance: Importance.max,
        ticker: 'test');

    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails, iOS: iosNotificationDetails);
    await flutterLocalNotificationsPlugin.schedule(1, 'You are done for today!',
        'You have filled up the form, Thank you :)', timeDelayed, notificationDetails);
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



  var timeDelayed = DateTime.now().
  add(Duration(seconds: 5));
  
  DateTime backButtonPressTime;

  @override
  Widget build(BuildContext context) {
    Future<bool> btnbackdd() async {
      DateTime currentTime = DateTime.now();
      bool backbtn = backButtonPressTime == null ||
          currentTime.difference(backButtonPressTime) > Duration(seconds: 3);
      if(backbtn){
        backButtonPressTime = currentTime;
        Fluttertoast.showToast(
          msg: 'Double Tap to Close app',
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );
        return false;
      }
      return true;
    }
    
    final successAlert = _buildButton(
      onTap: () async {
        if (_fbKey.currentState.saveAndValidate()) {
          dynamic result = await auth.insertForm(data.email, data.password);
          print("pasok na: $result");
          _fbKey.currentState.reset();
          _showNotificationsAfterSecond();
          _fbKey.currentState.reset();
          CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            text: "Responses completed successfully!",
          );

        } else {
          print(_fbKey.currentState.value);
          print("validation failed");
        }
      },
      color: Color(0xFFFFF5555),
      text: "Submit",

    );

    bool loading = true;
    final user= Provider.of<User>(context);
    int day=0;
    try{
      for(int x =0; x < querySnapshots.documents.length; x++) {
        if (querySnapshots.documents[x].data['userID'] == user.uid) {
          day++;
        }
      }}catch(e){
      return loading ? Loading() : Container(
          child: Text('Loading')
      );
    }
    diagnoseForm.day = day+1;

    try{
      if(day >= 14){
        return Container(
          child:
          Center(
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/completed.png',
                  height: 300,
                  width: 300,
                ),
                Text("You're all done!",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.grey,
                    )
                ),
                SizedBox(
                    height: 10
                ),
                Text("Enjoy your day!",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    )
                ),
              ],
            ),
          ),
        );
      }
    }catch(e){

    }

    final form= Provider.of<User>(context);
    return StreamBuilder<userform>(
        stream: dbService(uid: form.uid).userRes,
        builder: (context, snapshot) {
          try{
            return Scaffold(
              body: WillPopScope(
                onWillPop: btnbackdd,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FormBuilder(
                            // context,
                            key: _fbKey,
                            readOnly: false,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Daily Self-Check',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  'Do you have any of the following symptoms today?',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: FormBuilderRadio(
                                    activeColor: Color(0xFFFFF5555),
                                    decoration:
                                    InputDecoration(
                                      labelText: 'Fever above 37.6 degree Celsius (lagnat)',
                                      labelStyle: TextStyle(
                                        color: Color(0xFFFA8072),
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    attribute: "fever",
                                    onChanged: (val){
                                      diagnoseForm.fever = val;
                                      print(val);
                                    },
                                    leadingInput: true,
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
                                ),
                                FormBuilderRadio(
                                  activeColor: Color(0xFFFFF5555),
                                  decoration:
                                  InputDecoration(
                                    labelText: 'Cough (ubo at sipon)',
                                    labelStyle: TextStyle(
                                      color: Color(0xFFFA8072),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  attribute: "cough",
                                  //leadingInput: true,
                                  onChanged: (val){
                                    diagnoseForm.cough = val;
                                    print(val);
                                  },
                                  leadingInput: true,
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
                                    labelText: 'Difficulty in Breathing (hirap sa paghinga)',
                                    labelStyle: TextStyle(
                                      color: Color(0xFFFA8072),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  attribute: "dif_breathing",
                                  //leadingInput: true,
                                  onChanged: (val){
                                    diagnoseForm.diff_breathing = val;
                                    print(val);
                                  },
                                  leadingInput: true,
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
                                    labelText: 'Sorethroat(pananakit ng lalamunan)',
                                    labelStyle: TextStyle(
                                      color: Color(0xFFFA8072),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  attribute: "sore_throat",
                                  //leadingInput: true,
                                  onChanged: (val){
                                    diagnoseForm.sore_throat = val;
                                    print(val);
                                  },
                                  leadingInput: true,
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
                                    labelText: 'Headache(pananakit ng ulo)',
                                    labelStyle: TextStyle(
                                      color: Color(0xFFFA8072),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  attribute: "headache",
                                  //leadingInput: true,
                                  onChanged: (val){
                                    diagnoseForm.heacache = val;
                                    diagnoseForm.userID = form.uid;
                                    print(val);
                                  },
                                  leadingInput: true,
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
                                    labelText: 'Body Weakness(pananakit ng katawan)',
                                    labelStyle: TextStyle(
                                      color: Color(0xFFFA8072),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  attribute: "body_weakness",
                                  //leadingInput: true,
                                  onChanged: (val){
                                    diagnoseForm.body_weaknesses = val;
                                    print(val);
                                  },
                                  leadingInput: true,
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
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child:successAlert,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }catch(e){
            return Container();
          }

        }
    );

  }

Widget _buildButton({VoidCallback onTap, String text, Color color}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: MaterialButton(
      color: color,
      minWidth: double.infinity,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
}
