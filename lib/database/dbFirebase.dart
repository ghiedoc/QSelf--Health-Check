import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_trial_three/screen/data.dart';
import 'package:flutter_trial_three/screen/userList.dart';

class dbService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final String uid;
  dbService({this.uid});

  final CollectionReference userCollect = Firestore.instance.collection("user");

  final CollectionReference userContact = Firestore.instance.collection(
      "contact_info");

  final CollectionReference travel_histo = Firestore.instance.collection(
      "travel_histo");

  final CollectionReference diagnoseForm = Firestore.instance.collection(
      "diagnose_form");



  Future getUserId() async {
    try {
      return diagnoseForm.document(uid);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


//user info
  Future updateUserData(String id, String fname, String lname,
      String nationality,
      String passport_no) async {
    return await userCollect.document(uid).setData({
      'fname': fname,
      'lname': lname,
      'nationality': nationality,
      'passport_no': passport_no,
    });
  }

  Future updateContact(String contact_no, String contact_emergency_no,
      String quar_hotel) async {
    return await userContact.document(uid).setData({
      'contact_no': contact_no,
      'contact_emergency_no': contact_emergency_no,
      'quar_hotel': quar_hotel,
    });
  }

  Future updateTravel(String travel_arrival_date,
      String travel_country) async {
    return await travel_histo.document(uid).setData({
      'travel_arrival_date': travel_arrival_date,
      'travel_country': travel_country,
    });
  }

// user diagnose_form
  Future submitForm(int day, String fever, String cough,
      String diff_breathing, String sore_throat,
      String heacache, String body_weaknesses) async {
    return await diagnoseForm.document(uid).setData({
      'day': day,
      'fever': fever,
      'cough': cough,
      'diff_breathing': diff_breathing,
      'sore_throat': sore_throat,
      'headache': heacache,
      'body_weaknesses': body_weaknesses,
    });
  }
  
  //update password
//  changePassword(){
//    DocumentReference documentReference =
//    Firestore.instance.collection("user").document(uid);
//
//    Map<String, dynamic> users = {
//      ""
//    };
//  }

  Stream<List<userList>> get user {
    return userCollect.snapshots()
        .map(_userList);
  }

  List<userList> _userList(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return userList(
          uid: doc.documentID,
          fname: doc.data['fname'] ?? '',
          lname: doc.data['lname'] ?? '',
          nationality: doc.data['nationality'] ?? '',
          passport_no: doc.data['passport_no'] ?? ''
      );
    }).toList();
  }


  Stream<List<userform>> get Form{
    return diagnoseForm.snapshots().
    map(dataForm);
  }

  List<userform> dataForm(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return userform(
          uid: doc.documentID,
          day : doc.data['day'] ?? 0,
          fever : doc.data['fever'] ?? '',
          cough :  doc.data['cough'] ?? '',
          diff_breathing : doc.data['diff_breathing'] ?? '',
          sore_throat : doc.data['sore_throat'] ?? '',
          headache : doc.data['headache'],
          body_weaknesses : doc.data['body_weaknesses' ?? '']
      );
    }).toList();
  }

//USER INFO
  Stream<userList> get userData{
    return userCollect.document(uid).snapshots()
    .map(_userData);
  }
  userList _userData(DocumentSnapshot snapshot){
    return userList(
      uid: snapshot.documentID,
      fname: snapshot.data['fname'],
      lname: snapshot.data['lname']
    );
  }
//  USER RESULT
  Stream<userform> get userRes{
    return diagnoseForm.document(uid).snapshots()
        .map(_userRes);
  }
  userform _userRes(DocumentSnapshot snapshot){
    return userform(
      uid: snapshot.documentID,
      day: snapshot.data['day'],
      fever: snapshot.data['fever'],
      cough: snapshot.data['cough'],
      diff_breathing: snapshot.data['diff_breathing'],
      sore_throat: snapshot.data['sore_throat'],
      headache: snapshot.data['headache'],
      body_weaknesses: snapshot.data['body_weaknesses']
    );

  }

  Future<String> getCurrentUID() async{
    return (await _firebaseAuth.currentUser()).uid;
  }
}