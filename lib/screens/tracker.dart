import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../screens/navigation_option.dart';
import '../screens/global.dart';
import '../screens/country.dart';

enum NavigationStatus {
  GLOBAL,
  COUNTRY,
}

class Tracker extends StatefulWidget {
  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  NavigationStatus navigationStatus = NavigationStatus.GLOBAL;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFFA8072),
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: body,
        elevation: 0,
        title: Text(
          "COVID-19 Live Updates",
        ),
        centerTitle: true,
      ),
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NavigationOption(
                title: "Global",
                selected: navigationStatus == NavigationStatus.GLOBAL,
                onSelected: () {
                  setState(() {
                    navigationStatus = NavigationStatus.GLOBAL;
                  });
                },
              ),
              NavigationOption(
                title: "Country",
                selected: navigationStatus == NavigationStatus.COUNTRY,
                onSelected: () {
                  setState(() {
                    navigationStatus = NavigationStatus.COUNTRY;
                  });
                },
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Color(0xFFFA8072), borderRadius: BorderRadius.only()),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 150),
                child: navigationStatus == NavigationStatus.GLOBAL
                    ? Global()
                    : Country(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
