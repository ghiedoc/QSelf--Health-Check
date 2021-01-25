import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trial_three/screen/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data.dart';
import 'package:flutter_trial_three/authenticate/auth.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SelfDiagnosisFormPage extends StatefulWidget {
  SelfDiagnosisFormPage({Key key}) : super(key: key);

  static const routeName = '/selfDiagnosisForm';
  @override
  _SelfDiagnosisFormPageState createState() => _SelfDiagnosisFormPageState();
}

class _SelfDiagnosisFormPageState extends State<SelfDiagnosisFormPage> {
  final AuthService auth = AuthService();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool singleTap = true;
  int _counter = 0;
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  void disabledBtn() {
//  WAITS
  }

  _dayIncreement() async {
    int days = diagnoseForm.day;
    if (days == 0) {
      days = diagnoseForm.day;
      return diagnoseForm.day = 1;
    } else if (days == 1) {
      days = diagnoseForm.day;
      return diagnoseForm.day = 2;
    } else if (days == 2) {
      days = diagnoseForm.day;
      return diagnoseForm.day = 3;
    } else if (days == 3) {
      days = diagnoseForm.day;
      return diagnoseForm.day = 4;
    } else if (days == 4) {
      days = diagnoseForm.day;
      return diagnoseForm.day = 5;
    } else if (days == 5) {
      days = diagnoseForm.day;
      return diagnoseForm.day = 6;
    } else if (days == 6) {
      days = diagnoseForm.day;
      return diagnoseForm.day = 7;
    } else if (days == 7) {
      days = diagnoseForm.day;
      return diagnoseForm.day = 8;
    } else if (days == 8) {
      days = diagnoseForm.day;
      return diagnoseForm.day = 9;
    } else if (days == 9) {
      days = diagnoseForm.day;
      return diagnoseForm.day = 10;
    } else if (days == 10) {
      days = diagnoseForm.day;
      return diagnoseForm.day = 10;
    } else if (days == 11) {
      days = diagnoseForm.day;
      return diagnoseForm.day = 11;
    } else if (days == 12) {
      days = diagnoseForm.day;
      return diagnoseForm.day = 12;
    } else if (days == 13) {
      days = diagnoseForm.day;
      return diagnoseForm.day = 14;
    } else {
      return null;
    }
//    setState((){
//      days++;
//      diagnoseForm.day = days;
//      print('DAY: ${diagnoseForm.day}');
//    });
  }



  int selectedRadio;
  int selectedRadio2;
  int selectedRadio3;
  int selectedRadio4;
  int selectedRadio5;
  int selectedRadio6;
  @override
  void initState() {
    super.initState();
    initialize();
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  setSelectedRadio2(int val) {
    setState(() {
      selectedRadio2 = val;
    });
  }

  setSelectedRadio3(int val) {
    setState(() {
      selectedRadio3 = val;
    });
  }

  setSelectedRadio4(int val) {
    setState(() {
      selectedRadio4 = val;
    });
  }

  setSelectedRadio5(int val) {
    setState(() {
      selectedRadio5 = val;
    });
  }

  setSelectedRadio6(int val) {
    setState(() {
      selectedRadio6 = val;
    });
  }

  createConfirmation(context){ // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.of(context).pop(false);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed:  () async {
        dynamic result = await auth.insertForm(data.email, data.password);
          print("pasok na: $result");
          Navigator.of(context).pop(false);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Would you like to continue learning how to use Flutter alerts?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  AndroidFlutterLocalNotificationsPlugin androidFlutterLocalNotificationsPlugin;
  AndroidInitializationSettings androidInitializationSettings;
  IOSInitializationSettings iosInitializationSettings;

  InitializationSettings initializationSettings;

  void initialize() async {
    androidInitializationSettings = AndroidInitializationSettings('qlogo');
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
      body: SingleChildScrollView(
        child: new Container(
          child: new Column(
            children: <Widget>[
              new SizedBox(
                height: 10,
              ),
              new Text(
                'Daily Self-Check',
                style: new TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              new Text(
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
              new Divider(height: 5.0, color: Colors.black),
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
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: selectedRadio,
                      activeColor: Colors.blue,
                      onChanged: (val) {
                        diagnoseForm.fever = "yes";
                        setSelectedRadio(val);
                      },
                    ),
                    Text(
                      'Yes',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    Radio(
                      value: 2,
                      groupValue: selectedRadio,
                      activeColor: Colors.blue,
                      onChanged: (val) {
                        diagnoseForm.fever = "no";
                        setSelectedRadio(val);
                      },
                    ),
                    Text(
                      'No',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              new Divider(height: 5.0, color: Colors.black),

              /**
               * Label ng COUGH
               */
              Container(
                color: Colors.white,
                child: Form(
                  key: formkey,
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
                  children: <Widget>[
                    Radio(
                      value: 3,
                      groupValue: selectedRadio2,
                      activeColor: Colors.blue,
                      onChanged: (val) {
                        diagnoseForm.cough = "yes";
                        setSelectedRadio2(val);
                      },
                    ),
                    Text(
                      'Yes',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    Radio(
                      value: 4,
                      groupValue: selectedRadio2,
                      activeColor: Colors.blue,
                      onChanged: (val) {
                        diagnoseForm.cough = "no";
                        setSelectedRadio2(val);
                      },
                    ),
                    Text(
                      'No',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              new Divider(height: 5.0, color: Colors.black),

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
                  children: <Widget>[
                    Radio(
                      value: 5,
                      groupValue: selectedRadio3,
                      activeColor: Colors.blue,
                      onChanged: (val) {
                        diagnoseForm.diff_breathing = "yes";
                        setSelectedRadio3(val);
                      },
                    ),
                    Text(
                      'Yes',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    Radio(
                      value: 6,
                      groupValue: selectedRadio3,
                      activeColor: Colors.blue,
                      onChanged: (val) {
                        diagnoseForm.diff_breathing = "no";
                        setSelectedRadio3(val);
                      },
                    ),
                    Text(
                      'No',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              new Divider(height: 5.0, color: Colors.black),

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
                  children: <Widget>[
                    Radio(
                      value: 7,
                      groupValue: selectedRadio4,
                      activeColor: Colors.blue,
                      onChanged: (val) {
                        diagnoseForm.sore_throat = "yes";
                        setSelectedRadio4(val);
                      },
                    ),
                    Text(
                      'Yes',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    Radio(
                      value: 8,
                      groupValue: selectedRadio4,
                      activeColor: Colors.blue,
                      onChanged: (val) {
                        diagnoseForm.sore_throat = "no";
                        setSelectedRadio4(val);
                      },
                    ),
                    Text(
                      'No',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              new Divider(height: 5.0, color: Colors.black),

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
                  children: <Widget>[
                    Radio(
                      value: 8,
                      groupValue: selectedRadio5,
                      activeColor: Colors.blue,
                      onChanged: (val) {
                        diagnoseForm.heacache = "yes";
                        setSelectedRadio5(val);
                      },
                    ),
                    Text(
                      'Yes',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    Radio(
                      value: 9,
                      groupValue: selectedRadio5,
                      activeColor: Colors.blue,
                      onChanged: (val) {
                        diagnoseForm.heacache = "no";
                        setSelectedRadio5(val);
                      },
                    ),
                    Text(
                      'No',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              new Divider(height: 5.0, color: Colors.black),

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
                  children: <Widget>[
                    Radio(
                      value: 10,
                      groupValue: selectedRadio6,
                      activeColor: Colors.blue,
                      onChanged: (val) {
                        diagnoseForm.body_weaknesses = "yes";
                        setSelectedRadio6(val);
                      },
                    ),
                    Text(
                      'Yes',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    Radio(
                      value: 11,
                      groupValue: selectedRadio6,
                      activeColor: Colors.blue,
                      onChanged: (val) {
                        diagnoseForm.body_weaknesses = "no";
                        setSelectedRadio6(val);
                      },
                    ),
                    Text(
                      'No',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              new Divider(height: 5.0, color: Colors.black),

              /*
              *  DITO YUNG SA BUTTON
              *  raised button ginamit ko kasi ayaw ng material btn ewan ko bakit
              */
              ArgonTimerButton(
                height: 69,
                width: MediaQuery.of(context).size.width,
                minWidth: MediaQuery.of(context).size.width * 0.30,
                highlightColor: Colors.transparent,
                highlightElevation: 0,
                roundLoadingShape: false,
                onTap: (startTimer, btnState) {
                  if(btnState == ButtonState.Idle) {
//                    startTimer(60);
//                    _dayIncreement();
                    _showNotificationsAfterSecond();
                    print("hey");
//                    createConfirmation(context);
                  }
                  setState(() {
                    singleTap = false; // update bool
                  });
                },
                // initialTimer: 10,
                child: Text(
                  "Submit Form",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                loader: (timeLeft) {
                  return Text(
                    "Wait | $timeLeft",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  );
                },
                borderRadius: 10.0,
                color: Color(0xFFFF5555),
                elevation: 0,
                borderSide: BorderSide(color: Colors.black, width: 1.5),
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