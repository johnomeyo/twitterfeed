import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitter_api/resources/storage_methods.dart';

// import 'package:firebase_core/firebase_core.dart';
var firebase = FirebaseAuth.instance;
var firestore = FirebaseFirestore.instance;

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
      //create user
      if (name.isNotEmpty &&
          bio.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty) {
        UserCredential cred = await firebase.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadFileToStorage("profilePics", file, false);
        //store user
        firestore.collection("usersT").doc(cred.user!.uid).set({
          "name": name,
          "bio": bio,
          "email": email,
          "uid": cred.user!.uid,
          "photoUrl": photoUrl
        });
        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
