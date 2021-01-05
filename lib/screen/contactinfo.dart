import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'login.dart';
import 'start.dart';

class ContactInfoPage extends StatefulWidget {
  @override
  _ContactInfoPageState createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {

  String valueChoose;
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Color(0xFFFA8072),
            ),
          ),
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 40),
                            child: Text(
                              "Contact \nInformation",
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
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          makeInput(label: "Contact Number"),
                          makeInput(label: "In case of emergency"),
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
                            margin: const EdgeInsets.only(bottom: 200.0),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black12, width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButtonFormField(
                              value: valueChoose,
                              onChanged: (newValue) {
                                setState(() {
                                  valueChoose = newValue;
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
                          onPressed: () {},
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

  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF8A8A8A),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
