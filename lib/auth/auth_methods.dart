import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import 'package:firebase_core/firebase_core.dart';
var firebase = FirebaseAuth.instance;
var firestore = FirebaseFirestore.instance;

class AuthMethods {
  Future<String> signUpUser({
    required String name,
    required String bio,
    required String password,
    required String email,
    // required Uint8List file,
  }) async {
    String res = ' Some error occured';
    try {
      //create user
      if (name.isNotEmpty &&
          bio.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty) {
        UserCredential cred = await firebase.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);
        //store user
        firestore.collection("usersT").doc(cred.user!.uid).set(
            {"name": name, "bio": bio, "email": email, "uid": cred.user!.uid});
        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
