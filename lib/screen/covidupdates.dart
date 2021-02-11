import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trial_three/screens/tracker.dart';

class CovidUpdatePage extends StatefulWidget {
  static const routeName = '/covidUpdate';

  @override
  _CovidUpdatePageState createState() => _CovidUpdatePageState();
}

class _CovidUpdatePageState extends State<CovidUpdatePage> {

  final appTitle = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFA8072),
        body: Tracker(),
    );
  }
}
