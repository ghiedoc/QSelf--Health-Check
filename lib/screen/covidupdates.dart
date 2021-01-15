import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CovidUpdatePage extends StatefulWidget {
  static const routeName = '/covidUpdate';

  CovidUpdatePage({Key key}) : super(key: key);

  @override
  _CovidUpdatePageState createState() => _CovidUpdatePageState();
}

class _CovidUpdatePageState extends State<CovidUpdatePage> {
  final appTitle = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFA8072),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    child: Text(
                      "COVID-19 Statistics",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
