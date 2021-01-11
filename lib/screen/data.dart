class User{
   final String uid;

   User({this.uid});
}

class data{
static String fname,lname, nationality, passport_no, email, password;
static String id = "1";
}
class diagnoseForm {
  static String fever, cough, diff_breathing, sore_throat, heacache,
      body_weaknesses;


   static int Day;
   static int count;

   static set Days(int temp){
     count = temp;
   }

  static int get Days {
    return count;
  }

}

class contactData{
  static String contact_number, contact_emergency, quar_hotel;
}

class travelData{
  static String travel_arrival_date,travel_country;
}

class userList {
 final String fname, lname, nationality, passport_no;
  userList({this.fname, this.lname, this.nationality, this.passport_no});
}

class userform{
  final String fever, cough, diff_breathing, sore_throat, heacache,
      body_weaknesses;
  final int day;
 userform({this.day, this.fever, this.cough, this.diff_breathing, this.sore_throat, this.heacache, this.body_weaknesses});

}