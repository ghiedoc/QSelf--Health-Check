import 'package:cloud_firestore/cloud_firestore.dart';

class dbService {

  final String uid;

  dbService({this.uid});

  final CollectionReference userCollect = Firestore.instance.collection("user");



//user info
  Future updateUserData(String fname, String lname, String nationality,
      String passport_no,String contact_no, String contact_emergency_no, String quar_hotel,String travel_arrival_date,
  String travel_country) async {
    return await userCollect.document(uid).setData({
      'fname': fname,
      'lname': lname,
      'nationality': nationality,
      'passport_no': passport_no,
      'contact_no': contact_no,
      'contact_emergency_no': contact_emergency_no,
      'quar_hotel': quar_hotel,
      'travel_arrival_date': travel_arrival_date,
      'travel_country': travel_country,


    });
  }
// user contact

}