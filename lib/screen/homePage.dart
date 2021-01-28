import 'package:flutter/material.dart';
import 'package:flutter_trial_three/authenticate/auth.dart';
import 'package:flutter_trial_three/screen/covidupdates.dart';
import 'package:flutter_trial_three/screen/dashboard.dart';
import 'package:flutter_trial_three/screen/selfdiagnosisform.dart';
import 'package:flutter_trial_three/screen/changepassword.dart';
import 'package:flutter_trial_three/screen/diagnosisform.dart';
import 'package:flutter_trial_three/screen/login.dart';
import 'package:provider/provider.dart';
import 'package:flutter_trial_three/database/dbFirebase.dart';
import 'data.dart';
import 'loading.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();

  List<Widget> _screens = [
    DashboardPage(),
    DiagnosisForm(),
    CovidUpdatePage()
  ];

  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  final AuthService _auth = AuthService();
  bool loading = false;

  createConfirmation(BuildContext context){
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.of(context).pop(false);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed:  () async {
        try {
          //await _auth.signOut();
          setState() {
            loading = true;
          };
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new LoginPage()));
        }catch(e){
          return Container();
        }
      },

    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Are you sure you want to log out?"),
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


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<userList>(
        stream: dbService(uid: user.uid).userData,
        builder: (context, snapshot) {
          try {
            userList user_List = snapshot.data;
            print('HEY ${user_List.fname}');
            return  loading ? Loading() : MaterialApp(
              color: Color(0xFFFA8072),
              home: Scaffold(
//        body: Drawable(),
                body: PageView(
                  controller: _pageController,
                  children: _screens,
                  onPageChanged: _onPageChanged,
                  physics: NeverScrollableScrollPhysics(),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  onTap: _onItemTapped,
                  items: [
                    BottomNavigationBarItem(
                      icon: new Icon(
                        Icons.home,
                        color: _selectedIndex == 0
                            ? Color(0xFFFA8072)
                            : Colors.grey,
                      ),
                      title: new Text('Home',
                          style: TextStyle(
                            color: _selectedIndex == 0
                                ? Color(0xFFFA8072)
                                : Colors.grey,
                          )),
                    ),
                    BottomNavigationBarItem(
                      icon: new Icon(
                        Icons.fact_check,
                        color: _selectedIndex == 1
                            ? Color(0xFFFA8072)
                            : Colors.grey,
                      ),
                      title: new Text('Self-Diagnose Form',
                          style: TextStyle(
                            color: _selectedIndex == 1
                                ? Color(0xFFFA8072)
                                : Colors.grey,
                          )),
                    ),
                    BottomNavigationBarItem(
                      icon: new Icon(
                        Icons.coronavirus,
                        color: _selectedIndex == 2
                            ? Color(0xFFFA8072)
                            : Colors.grey,
                      ),
                      title: new Text('COVID19',
                          style: TextStyle(
                            color: _selectedIndex == 2
                                ? Color(0xFFFA8072)
                                : Colors.grey,
                          )),
                    ),
                  ],
                ),
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Color(0xFFFA8072),
                  iconTheme: IconThemeData(color: Colors.black),
                  title: Text(""),
                ),
                drawer: Drawer(
                  child: ListView(
                    children: <Widget>[
                      new DrawerHeader(
                        child: Text('${user_List.fname} ${user_List.lname}'),
                      ),
                      new ListTile(
                        leading: new Icon(Icons.settings),
                        title: new Text('Setting'),
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                  new ChangePasswordPage()));
                        },
                      ),
                      new ListTile(
                        leading: new Icon(Icons.exit_to_app),
                        title: new Text('Log out'),
                        onTap: () async {
                          createConfirmation(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }catch(e) {
            return Container();
          }
        }
    );
  }
}
