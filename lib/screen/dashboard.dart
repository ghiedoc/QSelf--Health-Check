import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trial_three/database/dbFirebase.dart';
import 'package:provider/provider.dart';
import 'data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'loading.dart';
import 'package:fluttertoast/fluttertoast.dart';


class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  static const routeName = '/dash';

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  //pambilang ng history (day)
  QuerySnapshot querySnapshots;

  void initState() {
    super.initState();
    getDiagnoseForm().then((results) {
      setState(() {
        querySnapshots = results;
      });
    });
  }

  //pang kuha ng Diagnosis
  getDiagnoseForm() async {
    return await Firestore.instance.collection('diagnose_form').getDocuments();
  }

  opencovidupdateURL() async {
    if (await canLaunch(
        'https://www.cnnphilippines.com/news/2021/1/24/Live-updates-COVID-19-pandemic.html')) {
      await launch(
          'https://www.cnnphilippines.com/news/2021/1/24/Live-updates-COVID-19-pandemic.html');
    } else {
      throw 'Could not launch COVID19 Updates';
    }
  }

  openGuidelinesURL() async {
    if (await canLaunch(
        'https://www.redcross.org/get-help/how-to-prepare-for-emergencies/types-of-emergencies/coronavirus-safety.html')) {
      await launch(
          'https://www.redcross.org/get-help/how-to-prepare-for-emergencies/types-of-emergencies/coronavirus-safety.html');
    } else {
      throw 'Could not launch COVID19 Guidelines';
    }
  }

  DateTime backButtonPressTime;

  @override
  Widget build(BuildContext context) {
    Future<bool> btnbackdd() async {
      DateTime currentTime = DateTime.now();
      bool backbtn = backButtonPressTime == null ||
          currentTime.difference(backButtonPressTime) > Duration(seconds: 3);
      if (backbtn) {
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
    bool loading = true;
    int day = 1;
    final user = Provider.of<User>(context);
    final border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    );
    final padding = const EdgeInsets.all(4.0);

    try {
      for (int x = 0; x < querySnapshots.documents.length; x++) {
        if (querySnapshots.documents[x].data['userID'] == user.uid) {
          day++;
        }
      }
    } catch (e) {
      return loading ? Loading() : Container(child: Text('Loading'));
    }

    try {
      if(day >= 15){
        return Scaffold(
          body: WillPopScope(
            onWillPop: btnbackdd,
            child: StreamBuilder<userList>(
                stream: dbService(uid: user.uid).userData,
                builder: (context, snapshot) {
                  try {
                    userList user_list = snapshot.data;
                    return Container(
                      padding: EdgeInsets.all(20.0),
                      child: ListView(
                        children: <Widget>[
                          Text(
                            'Hello, ${user_list.fname}',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, bottom: 10),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return;
                                  },
                                ),
                              );
                            },
                            child: Container(
                              height: 120,
                              child: Padding(
                                padding: padding,
                                child: Card(
                                  shape: border,
                                  elevation: 3.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.today,
                                                size: 50, color: Color(0xFFffc75f)),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Completed!',
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green,
                                              ),
                                            ),
                                            Icon(Icons.check_circle,
                                                size: 50, color: Colors.green),
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            '',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          /**
                           * CONTAINER 2
                           */
                          GestureDetector(
                            onTap: () {
                              opencovidupdateURL();
                            },
                            child: Container(
                              height: 90,
                              child: Padding(
                                padding: padding,
                                child: Card(
                                  color: Color(0xFFF78977),
                                  shape: border,
                                  elevation: 3.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.import_contacts,
                                                size: 50, color: Colors.white),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'COVID-19 News',
                                              style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          /**
                           * CONTAINER 3
                           */
                          GestureDetector(
                            onTap: () {
                              openGuidelinesURL();
                            },
                            child: Container(
                              height: 90,
                              child: Padding(
                                padding: padding,
                                child: Card(
                                  color: Color(0xFFFF8A94D),
                                  shape: border,
                                  elevation: 3.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.medical_services,
                                                size: 50, color: Colors.white),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Guidelines',
                                              style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } catch (e) {
                    return Container();
                  }
                }),
          ),
        );
      }
    }catch(e){

    }


    return Scaffold(
      body: WillPopScope(
        child: StreamBuilder<userList>(
            stream: dbService(uid: user.uid).userData,
            builder: (context, snapshot) {
              try {
                userList user_list = snapshot.data;
                return Container(
                  padding: EdgeInsets.all(20.0),
                  child: ListView(
                    children: <Widget>[
                      Text(
                        'Hello, ${user_list.fname}',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, bottom: 10),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return;
                              },
                            ),
                          );
                        },
                        child: Container(
                          height: 120,
                          child: Padding(
                            padding: padding,
                            child: Card(
                              shape: border,
                              elevation: 3.0,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.today,
                                            size: 50, color: Color(0xFFffc75f)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Day ${day}',
                                          style: TextStyle(
                                            fontSize: 38,
                                            //fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        '',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      /**
                                 * CONTAINER 2
                                 */
                      GestureDetector(
                        onTap: () {
                          opencovidupdateURL();
                        },
                        child: Container(
                          height: 90,
                          child: Padding(
                            padding: padding,
                            child: Card(
                              color: Color(0xFFF78977),
                              shape: border,
                              elevation: 3.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Icon(Icons.import_contacts,
                                            size: 50, color: Colors.white),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'COVID-19 News',
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      /**
                                 * CONTAINER 3
                                 */
                      GestureDetector(
                        onTap: () {
                          openGuidelinesURL();
                        },
                        child: Container(
                          height: 90,
                          child: Padding(
                            padding: padding,
                            child: Card(
                              color: Color(0xFFFF8A94D),
                              shape: border,
                              elevation: 3.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Icon(Icons.medical_services,
                                            size: 50, color: Colors.white),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Guidelines',
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } catch (e) {
                return Container();
              }
            }),
      ),
    );
  }
}
