
class data{
static String fname,lname, nationality, passport_no, email, password;
}

class contactData{
  static String contact_number, contact_emergency, quar_hotel;
}

class travelData{
  static String travel_arrival_date,travel_country;
}

class userList{
  String fname,lname,nationality,passport_no;
  int id;
  userList(this.fname, this.lname, this.nationality, this.passport_no);
  userList.withID(this.fname, this.lname, this.nationality, this.passport_no);

  Map<String,dynamic> topMap(){
    Map<String,dynamic> map = new Map();

    if(id!=null){
      map["id"] = id;

      map["fname"] = fname;
      map["lname"] = lname;
      map["nationality"] = nationality;
      map["passport_no"] = passport_no;
    }
    return map;
  }

  userList.fromMap(Map<String,dynamic>map){
    id = map["id"];
    fname = map["fname"];
    lname = map["lname"];
    nationality =map["nationality"];
    passport_no = map["passport_no"];
  }

//  userList.withID(this.fname, this.lname, this.nationality, this.passport_no);
}


//



//import 'package:sticky_headers/sticky_headers/widget.dart';
//import 'package:flutter_trial_three/database/DatabaseHelper.dart';
//import 'data.dart';