import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdminUserInfoPage extends StatefulWidget {

  static const routeName = '/adminuserinfo';

  @override
  _AdminUserInfoPageState createState() => _AdminUserInfoPageState();
}

class _AdminUserInfoPageState extends State<AdminUserInfoPage> {
  @override
  Widget build(BuildContext context) {

    final border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    );
    final padding = const EdgeInsets.all(4.0);

    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: AppBar(
        backgroundColor: Color(0xFFEFEFEF),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(""),
      ),
      //BODY
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
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
                height: 150,
                child: Padding(
                  padding: padding,
                  child: Card(
                    shape: border,
                    elevation: 3.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.call, size: 70),
                          title: Text('Contact Information', style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold)),
                          subtitle: Text('09354412563 \n09875542185\n Shangri-La Makati', style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //TRAVEL HISTORY
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
                height: 150,
                child: Padding(
                  padding: padding,
                  child: Card(
                    shape: border,
                    elevation: 3.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.flight, size: 70),
                          title: Text('Travel History', style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold)),
                          subtitle: Text('09354412563 \n09875542185\n Shangri-La Makati', style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
                height: 100,
                child: Padding(
                  padding: padding,
                  child: Card(
                    shape: border,
                    elevation: 3.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.coronavirus, size: 50),
                          title: Text('Quarantine Status', style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        //DRAWER
      ),
    );
  }
}