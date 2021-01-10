import 'package:cloud_firestore/cloud_firestore.dart';

class dbService {

  final String uid;

  dbService({this.uid});

  final CollectionReference userCollect = Firestore.instance.collection("user");

  final CollectionReference diagnoseForm = Firestore.instance.collection('diagnose_form');



//user info
  Future updateUserData(String id, String fname, String lname, String nationality,
      String passport_no,String contact_no, String contact_emergency_no, String quar_hotel,String travel_arrival_date,
  String travel_country) async {
    return await userCollect.document(uid).setData({
      'id':  id,
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
// user diagnose_form
Future submitForm(String day, String fever, String cough, String diff_breathing, String sore_throat,
    String heacache, String body_weaknesses) async{
    return await diagnoseForm.document(uid).setData({
      'day' : day,
      'fever' : fever,
      'cough' : cough,
      'diff_breathing' : diff_breathing,
      'sore_throat' : sore_throat,
      'headache' : heacache,
      'body_weaknesses' : body_weaknesses,
    });
}
}