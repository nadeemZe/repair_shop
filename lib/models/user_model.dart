import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {

  static  String? firstName;
  static  String? lastName;
  static  String? email;

  //getters
  get name =>firstName;
  get lname =>lastName;
  get uEmail =>email;


  getUser(uid) async {

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        var data = documentSnapshot.data() as Map<String, dynamic>;
        firstName = data['first_name'];
        lastName = data['last_name'];
        email = data['email'];
      }
    });
    return name;
  }
}
