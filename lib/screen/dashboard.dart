import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trial_three/database/dbFirebase.dart';
import 'package:flutter_trial_three/screen/selfdiagnosisform.dart';
import 'package:flutter_trial_three/screen/covidupdates.dart';
import 'package:provider/provider.dart';
import 'data.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  static const routeName = '/dash';

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
  }

  opencovidupdateURL() async {
    if(await canLaunch('https://www.cnnphilippines.com/news/2021/1/24/Live-updates-COVID-19-pandemic.html')){
      await launch('https://www.cnnphilippines.com/news/2021/1/24/Live-updates-COVID-19-pandemic.html');
    }else{
      throw 'Could not launch COVID19 Updates';
    }
  }

  openGuidelinesURL() async {
    if(await canLaunch('https://www.redcross.org/get-help/how-to-prepare-for-emergencies/types-of-emergencies/coronavirus-safety.html')){
      await launch('https://www.redcross.org/get-help/how-to-prepare-for-emergencies/types-of-emergencies/coronavirus-safety.html');
    }else{
      throw 'Could not launch COVID19 Guidelines';
    }
  }

  @override
  Widget build(BuildContext context) {
    final user= Provider.of<User>(context);
    final form = Provider.of<User>(context);
    final border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    );
    final padding = const EdgeInsets.all(4.0);

    return StreamBuilder<userform>(
        stream: dbService(uid: form.uid).userRes,
      builder: (context, snapshot) {
          try{
            userform user_form  = snapshot.data;
            return Scaffold(
              body: StreamBuilder<userList>(
                  stream: dbService(uid: form.uid).userData,
                  builder: (context, snapshot) {
                    try{
                      userList user_list = snapshot.data;
                      return Container(
                        padding: EdgeInsets.all(20.0),
                        child: ListView(
                          children: <Widget>[
                            Text('Hello, ${user_list.fname} ${user_list.lname}',
                              style: TextStyle(
                                fontSize: 32,
                                //fontWeight: FontWeight.bold,
                              ),),
                            Container(
                              margin: EdgeInsets.only(left: 10, bottom: 10),
//                      child: Text(
//                        "Dashboard",
//                        style: TextStyle(
//                          fontSize: 36,
//                          fontWeight: FontWeight.bold,
//                        ),
//                      ),
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
                                height: 130,
                                child: Padding(
                                  padding: padding,
                                  /**
                                   * CONTAINER NG DAY 1 (1ST CARD)
                                   */
                                  child: Card(
                                    shape: border,
                                    elevation: 3.0,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Day ${user_form.day}',
                                                style: TextStyle(
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.bold,
                                                ),
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
                                ),
                              ),
                            ),
                          ],
                        ),
                      );

                    }catch(e){
                      return Scaffold(
                        body: StreamBuilder<userList>(
                            stream: dbService(uid: form.uid).userData,
                            builder: (context, snapshot) {
                              try{
                                userList user_list = snapshot.data;
                                return Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: ListView(
                                    children: <Widget>[
                                      Text('Hello, ${user_list.fname} ${user_list.lname}',
                                        style: TextStyle(
                                          fontSize: 32,
                                          //fontWeight: FontWeight.bold,
                                        ),),
                                      Container(
                                        margin: EdgeInsets.only(left: 10, bottom: 10),
//                      child: Text(
//                        "Dashboard",
//                        style: TextStyle(
//                          fontSize: 36,
//                          fontWeight: FontWeight.bold,
//                        ),
//                      ),
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
                                          height: 130,
                                          child: Padding(
                                            padding: padding,
                                            /**
                                             * CONTAINER NG DAY 1 (1ST CARD)
                                             */
                                            child: Card(
                                              shape: border,
                                              elevation: 3.0,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text(
                                                          'Day 1',
                                                          style: TextStyle(
                                                            fontSize: 32,
                                                            fontWeight: FontWeight.bold,
                                                          ),
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
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );

                              }catch(e){
                                return Container(child: Text("ERROR"),);
                              }

//
                            }
                        ),

                      );
                    }

//
                  }
              ),
//        height: MediaQuery.of(context).size.height,
//        width: double.infinity,
//        margin: EdgeInsets.only(left: 10, right: 10),
            );

          }catch(e){
              return Scaffold(
                body: StreamBuilder<userList>(
                    stream: dbService(uid: form.uid).userData,
                    builder: (context, snapshot) {
                      try{
                        userList user_list = snapshot.data;
                        return Container(
                          padding: EdgeInsets.all(20.0),
                          child: ListView(
                            children: <Widget>[
                              Text('Hello, ${user_list.fname} ${user_list.lname}',
                                style: TextStyle(
                                  fontSize: 32,
                                  //fontWeight: FontWeight.bold,
                                ),),
                              Container(
                                margin: EdgeInsets.only(left: 10, bottom: 10),
//                      child: Text(
//                        "Dashboard",
//                        style: TextStyle(
//                          fontSize: 36,
//                          fontWeight: FontWeight.bold,
//                        ),
//                      ),
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
                                  height: 130,
                                  child: Padding(
                                    padding: padding,
                                    /**
                                     * CONTAINER NG DAY 1 (1ST CARD)
                                     */
                                    child: Card(
                                      shape: border,
                                      elevation: 3.0,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Day 1',
                                                  style: TextStyle(
                                                    fontSize: 32,
                                                    fontWeight: FontWeight.bold,
                                                  ),
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
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );

                      }catch(e){
                        return Container();
                      }

//
                    }
                ),

              );
          }

      }
    );
  }

}
