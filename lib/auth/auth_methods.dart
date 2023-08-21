import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';

// import 'package:firebase_core/firebase_core.dart';
var firebase = FirebaseAuth.instance;

class AuthMethods {
  Future<String> signUpUser({
    required String name,
    required String bio,
    required String password,
    required String email,
    required Uint8List file,
  }) async {
    String res = ' Some error occured';
    try {
      if (name.isNotEmpty &&
          bio.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty) {
        UserCredential cred = await firebase.createUserWithEmailAndPassword(
            email: email, password: password);
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
