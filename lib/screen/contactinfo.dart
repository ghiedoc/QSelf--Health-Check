import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'login.dart';
import 'start.dart';
import 'data.dart';
import 'travelhistory.dart';
import 'package:flutter_trial_three/authenticate/auth.dart';

class ContactInfoPage extends StatefulWidget {
  static const routeName = '/contactinfo';
  @override
  _ContactInfoPageState createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {
  FocusNode myFocusNode = new FocusNode();
  String valueChoose;
  var currentItemSelected = "Century Park Hotel";

  List hotel = [
    "Century Park Hotel",
    "The Mini Suites-Eton Tower Makati",
    "The Charter House",
    "Belmont Hotel Manila",
    "Citadines Bay City Manila",
    "Conrad Manila",
    "Golden Phoenix Hotel Manila",
    "Hilton Manila",
    "Holiday Inn Express Manila Newport City",
    "Hotel 101",
    "Jen Manila By Shangri-La",
    "Manila Marriott Hotel",
    "Microtel By Wyndham Mall of Asia",
    "Midas Hotel And Casino",
    "Savoy Hotel Manila",
    "Sheraton Manila Hotel",
    "The Heritage Hotel",
    "Tryp By Wyndham Mall of Asia",
    "Amelie Hotel Manila",
    "Bayview Park Hotel Manila",
    "Diamond Hotel Manila",
    "Orchid Garden Suites Manila",
    "Sheraton Manila Bay",
    "The Bayleaf Intramuros",
    "Ascott Makati",
    "Astoria Greenbelt",
    "Berjaya Hotel Makati",
    "Citadines Salcedo Makati",
    "Discovery Primea",
    "Holiday Inn And Suites Makati",
    "Hotel Celeste",
    "Jinjiang Inn- Makati",
    "Makati Shangri-La, Manila",
    "New World Makati Hotel",
    "Oxford Suites Makati",
    "Seda Residences Makati",
    "Somerset Millenium Makati",
    "Somerset Olympia Makati",
    "Valero Grand Suites By Swiss-Belhotel",
    "Ascott Bonifacio Global City",
    "Seda BGC",
    "Acacia Hotel Manila",
    "B Hotel Alabang",
    "Crimson Hotel Filinvest City",
    "Discovery Suites",
    "Jinjiang Inn- Ortigas",
    "Richmonde Hotel Ortigas",
    "The Linden Suite",
    "B Hotel Quezon City",
    "Eastwood Richmonde Hotel",
    "Hotel Rembrandt",
    "Luxent Hotel",
    "Microtel by Wyndham Acropolis",
    "Microtel by Wyndham UP Technohub",
    "Novotel Manila Araneta City",
    "Seda Vertis North",
  ];

  final AuthService auth = AuthService();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();


//  validation
  void validate() async {
      if(formkey.currentState.validate())  {
        dynamic result = await auth.contact_info(data.email,data.password);
        print("pasok na: $result");
        Navigator.of(context)
            .pushReplacementNamed(TravelHistoryPage.routeName);
    } else {
      print("not validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            margin: EdgeInsets.only(left: 10, right: 10),
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Contact Information",
                            style: TextStyle(
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                labelText: 'Contact Number',
                                filled: true,
                                labelStyle: TextStyle(
                                    color: myFocusNode.hasFocus
                                        ? Colors.blue
                                        : Colors.black),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.grey[400])),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.grey[400])),
                              ),
                              validator: (value) {
                                if (value.toString().isEmpty ||
                                    value.length < 11) {
                                  return 'Invalid mobile number';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                contactData.contact_number = value;
                              },
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                labelText: 'In case of emergency',
                                filled: true,
                                labelStyle: TextStyle(
                                    color: myFocusNode.hasFocus
                                        ? Colors.blue
                                        : Colors.black),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.grey[400])),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.grey[400])),
                              ),
                              validator: (value) {
                                if (value.toString().isEmpty ||
                                    value.length < 11) {
                                  return 'Invalid emergency number';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                contactData.contact_emergency = value;
                              },
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Text(
                              "Quarantine Hotel",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Divider(
                              color: Colors.black54,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            //dropdown
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Quarantine Hotel Checked in",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF8A8A8A),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 100.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black12, width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButtonFormField(
                                validator: (newValue) {
                                  if (newValue.toString().isEmpty) {
                                    return 'INVALID QUARANTINE HOTEL';
                                  }
                                  return null;
                                },
                                value: currentItemSelected,
                                onChanged: (newValue) {
                                  setState(() {
                                    valueChoose = newValue;
                                    contactData.quar_hotel = newValue;
                                  });
                                },
                                items: hotel.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 50,
                          onPressed: () {
                            validate();
                          },
                          color: Color(0xFFFF5555),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Next",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
