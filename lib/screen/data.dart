class User{
   final String uid;
   User({this.uid});
}

class data{
static String fname,lname, nationality, passport_no, email, password;
static String id;
}
class diagnoseForm {
  static String fever, cough, diff_breathing, sore_throat, heacache,
      body_weaknesses,userID;
    static int day = 1;

}

class contactData{
  static String contact_number, contact_emergency, quar_hotel;
}

class travelData{
  static String travel_arrival_date,travel_country;
}


class userList {
 final String fname, lname, nationality, passport_no;
 final String uid;
  userList({this.uid,this.fname, this.lname, this.nationality, this.passport_no});
}


class userform{
  final String userID,fever, cough, diff_breathing, sore_throat, headache,
      body_weaknesses;
  final int day;
 userform({this.userID,this.day, this.fever, this.cough, this.diff_breathing, this.sore_throat, this.headache, this.body_weaknesses});
}


