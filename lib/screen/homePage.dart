import 'package:flutter/material.dart';
import 'package:flutter_trial_three/screen/covidupdates.dart';
import 'package:flutter_trial_three/screen/dashboard.dart';
import 'package:flutter_trial_three/screen/selfdiagnosisform.dart';
import 'package:flutter_trial_three/screen/changepassword.dart';
import 'package:flutter_trial_three/screen/login.dart';

class HomePage extends StatefulWidget {

  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  PageController _pageController = PageController();

  List<Widget> _screens = [CovidUpdatePage(), DashboardPage(), SelfDiagnosisFormPage()];

  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color(0xFFFA8072),
      home: Scaffold(
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
                Icons.coronavirus,
                color: _selectedIndex == 0 ? Color(0xFFFA8072) : Colors.grey,
              ),
              title: new Text('COVID19',
                  style: TextStyle(
                    color: _selectedIndex == 0 ? Color(0xFFFA8072) : Colors.grey,
                  )),
            ),
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.home,
                color: _selectedIndex == 1 ? Color(0xFFFA8072) : Colors.grey,
              ),
              title: new Text('Home',
                  style: TextStyle(
                    color: _selectedIndex == 1 ? Color(0xFFFA8072) : Colors.grey,
                  )),
            ),
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.fact_check,
                color: _selectedIndex == 2 ? Color(0xFFFA8072) : Colors.grey,
              ),
              title: new Text('Self-Diagnose Form',
                  style: TextStyle(
                    color: _selectedIndex == 2 ? Color(0xFFFA8072) : Colors.grey,
                  )),
            ),
          ],
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFFA8072),
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("AppBar"),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget> [
              new DrawerHeader(
                child: Text("Header"),
              ),
              new ListTile(
                title: new Text('Change Password'),
                onTap: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new ChangePasswordPage()));
                },
              ),
              new ListTile(
                title: new Text('Log out'),
                onTap: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new LoginPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}