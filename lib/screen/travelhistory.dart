import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'data.dart';
import 'package:flutter_trial_three/authenticate/auth.dart';
import 'loading.dart';
import 'welcome.dart';

class TravelHistoryPage extends StatefulWidget {
  static const routeName = '/travelhistory';
  @override
  _TravelHistoryPageState createState() => _TravelHistoryPageState();
}

class _TravelHistoryPageState extends State<TravelHistoryPage> {
  FocusNode myFocusNode = new FocusNode();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final AuthService auth = AuthService();
  TextEditingController _dateController = TextEditingController();

  DateTime pickedDate = DateTime.now();
  int selectitem = 1;
  String valueChoose;
  var currentItemSelected = "Philippines";
  bool loading = false;

  @override
  void initState() {
    travelData.travel_arrival_date =pickedDate.toString();
    // TODO: implement initState
    super.initState();
  }

  List country = [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Antigua & Deps',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bhutan',
    'Bolivia',
    'Bosnia Herzegovina',
    'Botswana',
    'Brazil',
    'Brunei',
    'Bulgaria',
    'Burkina',
    'Burundi',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Cape Verde',
    'Central African Rep',
    'Chad',
    'Chile',
    'China',
    'Colombia',
    'Comoros',
    'Congo',
    'Costa Rica',
    'Croatia',
    'Cuba',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'East Timor',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Ethiopia',
    'Fiji',
    'Finland',
    'France',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Greece',
    'Grenada',
    'Guatemala',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
    'Haiti',
    'Honduras',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Israel',
    'Italy',
    'Ivory Coast',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kiribati',
    'Korea North',
    'Korea South',
    'Kosovo',
    'Kuwait',
    'Kyrgyzstan',
    'Laos',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Macedonia',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Marshall Islands',
    'Mauritania',
    'Mauritius',
    'Mexico',
    'Micronesia',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Morocco',
    'Mozambique',
    'Myanmar',
    'Namibia',
    'Nauru',
    'Nepal',
    'Netherlands',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'Norway',
    'Oman',
    'Pakistan',
    'Palau',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Poland',
    'Portugal',
    'Qatar',
    'Romania',
    'Russian Federation',
    'Rwanda',
    'St Kitts & Nevis',
    'St Lucia',
    'Saint Vincent & the Grenadines',
    'Samoa',
    'San Marino',
    'Sao Tome & Principe',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Slovakia',
    'Solomon Islands',
    'Somalia',
    'South Africa',
    'South Sudan',
    'Spain',
    'Sri Lanka',
    'Sudan',
    'Suriname',
    'Swaziland',
    'Sweden',
    'Switzerland',
    'Syria',
    'Taiwan',
    'Tajikistan',
    'Tanzania',
    'Thailand',
    'Togo',
    'Tonga',
    'Trinidad & Tobago',
    'Tunisia',
    'Turkey',
    'Turkmenistan',
    'Tuvalu',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'United States',
    'Uruguay',
    'Uzbekistan',
    'Vanuatu',
    'Vatican City',
    'Venezuela',
    'Vietnam',
    'Yemen',
    'Zambia',
    'Zimbabwe',
  ];

  //    function signUp btn
  //  validation function
  void validation() async {
    if (formkey.currentState.validate()) {
      await auth.tralvel_histo(data.email, data.password);
      successfulToast();
      print(travelData.travel_arrival_date);
      setState(() => loading = true);
      Navigator.of(context).pushReplacementNamed(WelcomePage.routeName);
    } else {
      unsuccessfulToast();
      loading = false;
      print("not validated");
    }
  }

  void successfulToast() {
    Fluttertoast.showToast(
        msg: "Added Successfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void unsuccessfulToast() {
    Fluttertoast.showToast(
        msg: "Error Adding Input!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
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
                              "Travel History",
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
                                height: 30.0,
                              ),
                          GestureDetector(
                            onTap:  () => _pickDate(context),
                               child: AbsorbPointer(
                                 child: TextFormField(
                                    onSaved: (val){
                                      travelData.travel_arrival_date = pickedDate.toString();
                                        },
                                    controller: _dateController,
                                    decoration: InputDecoration(
                                      labelText: 'Arrival Date',
                                      icon: Icon(Icons.calendar_today),
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
                                      if (value.toString().isEmpty) {
                                        return 'Invalid date';
                                      }
                                      return null;
                                    },
                                  ),
                               ),
                             ),
                              SizedBox(
                                height: 30.0,
                              ),
                              //dropdown
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Port of departure(Country)",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF8A8A8A),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 200.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black12, width: 2.0),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButtonFormField(
                                  value: currentItemSelected,
                                  onChanged: (newValue) {
                                    setState(() {
                                      valueChoose = newValue;
                                      travelData.travel_country = newValue;
                                    });
                                  },
                                  items: country.map((valueItem) {
                                    return DropdownMenuItem(
                                      value: valueItem,
                                      child: Text(valueItem),
                                    );
                                  }).toList(),
                                  validator: (newValue) {
                                    if (newValue.toString().isEmpty) {
                                      return 'Invalid Country';
                                    }
                                    return null;
                                  },
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
                              validation();
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

  _pickDate(BuildContext context) async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      initialDate: pickedDate,
    );
    if (date != null && date !=pickedDate )
      setState(() {
        pickedDate = date;
        var dateText =
            "${pickedDate.year}/${pickedDate.month}/${pickedDate.day}";
        _dateController.text = dateText;
      });
  }
}
