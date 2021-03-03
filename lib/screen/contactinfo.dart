import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'data.dart';
import 'travelhistory.dart';
import 'package:flutter_trial_three/authenticate/auth.dart';
import 'loading.dart';

class ContactInfoPage extends StatefulWidget {
  static const routeName = '/contactinfo';
  @override
  _ContactInfoPageState createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {
  FocusNode myFocusNode = new FocusNode();
  String valueChoose;
  var currentItemSelected = "1109 Red Manor";

  List hotel = [
    "1109 Red Manor",
    "1246 Alfredo",
    "832 Centro St. Dormitory",
    "Acacia Hotel Manila",
    "Acacia Hotel, Alabang",
    "Aloha Hotel",
    "Amelie Hotel Manila",
    "Armada Hotel, Maniĺa",
    "Ascott Bonifacio Global City",
    "Ascott Makati",
    "Astoria Greenbelt",
    "Astrotel Avenida",
    "B Hotel Alabang",
    "B Hotel Quezon City",
    "Bayview Park Hotel Manila",
    "Bayview Park Hotel",
    "Bellevue, Alabang",
    "Belmont Hotel Manila",
    "Berjaya Hotel Makati",
    "Best Fortune Hotel",
    "Best Western Hotel La Corona",
    "B-Hotel, Quezon City",
    "Blulane Hotel",
    "Casa Pura, Quezon City",
    "Century Park Hotel",
    "Century Park Hotel, Manila",
    "Citadines Bay City Manila",
    "Citadines Millenium, Ortigas",
    "Citadines Salcedo Makati",
    "City Garden Suites – Manila",
    "Citystate Tower Hotel Manila",
    "Cocoon Hotel",
    "Conrad Manila",
    "Crimson Hotel Filinvest City",
    "Crimson Hotel, Aĺabang",
    "Crosswind Ocean Hotel",
    "Crowne Plaza Hotel Ortigas",
    "D Circle Hotel",
    "Diamond Hotel Manila",
    "Discovery Primea",
    "Discovery Suites, Ortigas",
    "Earnshaw Residences",
    "Eastwood Richmonde Hotel",
    "Elan Hotel Annapolis",
    "Eurotel, Pedro Gil",
    "Exchange Regency, Ortigas",
    "Executive Hotel",
    "Fersal Inn Manila",
    "G Residences",
    "Garden Plaza Suite",
    "Gardenia Terrace Motel",
    "Go Hotels North EDSA",
    "Go Hotels Timog",
    "Golden Phoenix Hotel Manila",
    "Great Eastern Hotel",
    "H2O Hotel",
    "Halina Hotel- Avenida",
    "Heroes Hotel",
    "Hilton Manila",
    "Hive Hotel",
    "Holiday Inn And Suites Makati",
    "Holiday Inn, Newport City",
    "Holiday Inn, Ortigas",
    "Hotel 101",
    "Hotel 2016 Manila",
    "Hotel 99- Quiapo",
    "Hotel Celeste",
    "Hotel Fox",
    "Hotel Juliano",
    "Hotel Rembrandt",
    "Hotel Sogo Quirino",
    "Hotel Sogo Recto",
    "Hotel Victoria de Malate",
    "Jen Manila By Shangri-La",
    "Jinjiang Inn- Makati",
    "Jinjiang Inn- Ortigas",
    "Kaimito Residences",
    "Kamarote Dormitory, Malate",
    "Lucky Chinatown",
    "Luxent Hotel, Timog QC",
    "Makati Shangri-La, Manila",
    "Manila Hotel",
    "Manila Lotus Hotel",
    "Manila Marriott Hotel",
    "Manila Venetian Reddoorz",
    "Marco Polo Hotel, Ortigas",
    "MAXX Hotel Ortigas",
    "MC Hotel, Fairview",
    "Microtel – Libis, Quezon City",
    "Microtel – UP Technohub, QC",
    "Microtel by Wyndham Acropolis",
    "Microtel By Wyndham Mall of Asia",
    "Microtel by Wyndham UP Technohub",
    "Microtel, Batangas",
    "Midas Hotel And Casino",
    "New World Makati Hotel",
    "Miramar Hotel",
    "Myplace",
    "New Orleans Hotel",
    "Novotel Manila Araneta City",
    "Novotel",
    "Octagon Mansion Hotel, Manila",
    "Ola Hostel",
    "Orchid Garden Suites Manila",
    "Oxford Suites Makati",
    "Oyo La Scala Residences",
    "Paragon Tower Ermita Hotel, Inc.",
    "Park Inn by Radisson North EDSA",
    "Pearl Blossom, Manila",
    "Pearl Garden Hotel",
    "Pearl Lane Hotel",
    "Privato Hotel, Ortigas",
    "Privato Hotel, Quezon City",
    "Queensland Lodge – Sta. Mesa",
    "Quirino Hostela Manila",
    "Ralph Anthony Suites, Ermita",
    "Ramada Manila Central",
    "Red Planet Hotel Manila Bay",
    "Red Planet, Aurora Boulevard",
    "Richmonde Hotel Ortigas",
    "Riviera Mansion",
    "Rose Garden Inn – Sta.Mesa",
    "Rothman Hotel",
    "Savoy Hotel Manila",
    "Seda BGC",
    "Seda Residences Makati",
    "Seda Vertis North",
    "Sequoia Hotel Quezon City",
    "Sheraton Manila Bay",
    "Sheraton Manila Hotel",
    "Silver Oaks Suites and Hotel",
    "Sogo – Sta. Mesa",
    "Sogo Avenida",
    "Somerset Alabang Manila",
    "Somerset Millenium Makati",
    "Somerset Olympia Makati",
    "Spring Hotel Avenida",
    "Stonehouse Hotel – Ermita",
    "Summit Hotel, Quezon City",
    "Tesoro Apartments, Ermita",
    "The Bayleaf, Intramuros",
    "The Charter House",
    "The Heritage Hotel",
    "The Linden Suite",
    "The Pearl Manila Hotel",
    "The TNKC Hotel",
    "Time Travellers Hotel Manila",
    "Town and Country Reposo",
    "Tropicana Suites",
    "Tryp By Wyndham Mall of Asia",
    "University Pad Residences Taft",
    "Vieve Hotel, Malate",
    "Windy Ridge, Malate, Manila",
    "Winford Hotel",
    "Winter Hotel Benitez Cubao",
    "Winter Hotel Imperial",
    "Wow Hotel Aurora Cubao",
    "Wynwood Hotel",
    "Others"
  ];

  final AuthService auth = AuthService();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool loading = false;

//  validation
  void validate() async {
      if(formkey.currentState.validate())  {
        await auth.contact_info(data.email,data.password);
        successfulToast();
        setState(() => loading = true);
        Navigator.of(context)
            .pushReplacementNamed(TravelHistoryPage.routeName);
    } else {
        unsuccessfulToast();
        loading = false;
        print("not validated");
    }
  }

  void successfulToast(){
    Fluttertoast.showToast(
        msg: "Added Successfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  void unsuccessfulToast() {
    Fluttertoast.showToast(
        msg: "Error Adding Input!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
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
    return loading ? Loading() : Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
        ),
        body: WillPopScope(
          onWillPop: btnbackdd,
          child: SingleChildScrollView(
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
                                  prefixIcon: new Icon(Icons.contact_phone_rounded,color: Colors.black,),
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
                                      value.length > 11) {
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
                                  prefixIcon: new Icon(Icons.contact_phone_rounded,color: Colors.black,),
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
                                      value.length > 11) {
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
                                child: Expanded(
                                  child: DropdownButtonFormField(
                                    validator: (newValue) {
                                      if (newValue.toString().isEmpty) {
                                        return 'Invalid Quarantine Hotel';
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
          ),
        ));
  }
}
