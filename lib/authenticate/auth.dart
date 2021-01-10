import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_trial_three/screen/data.dart';
import 'package:flutter_trial_three/database/dbFirebase.dart';
import 'package:flutter_trial_three/screen/data.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromdb(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        .
//     map((FirebaseUser user) => _userFromdb(user));
        map(_userFromdb);
  }

  Future auth() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//  sign in user
  Future signIn(String email, String password) async {
    try {
      AuthResult res = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = res.user;
      return _userFromdb(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//  register user
  Future signUp(String email, String password) async{
     try{
       AuthResult res = await _auth.createUserWithEmailAndPassword(email: email, password: password);
       FirebaseUser user = res.user;

       await dbService(uid: user.uid).updateUserData
         (data.id,data.fname,data.lname,data.nationality, data.passport_no,);
//
//       await  dbService(uid: user.uid).updateTravel( travelData.travel_arrival_date,travelData.travel_country);

      return _userFromdb(user);
       
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Future contact_info(String email, String password) async{
    try{
      AuthResult res = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = res.user;

       await dbService(uid: user.uid).updateContact(contactData.contact_number,contactData.contact_emergency,
           contactData.quar_hotel);



//       await dbService(uid: user.uid).submitForm("1", "no", "no", "no", "no", "no", "no");

      return _userFromdb(user);
    }catch(e){
      print(e.toString());
      return null;

    }
  }
  Future tralvel_histo(String email, String password) async{
    try{
      AuthResult res = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = res.user;

       await  dbService(uid: user.uid).updateTravel( travelData.travel_arrival_date,travelData.travel_country);


      return _userFromdb(user);
    }catch(e){
      print(e.toString());
      return null;

    }
  }

//  signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
