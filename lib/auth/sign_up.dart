import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:twitter_api/auth/auth_methods.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final passwordController = TextEditingController();

  final nameCtrl = TextEditingController();

  final bioCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  @override
  void dispose() {
    passwordController.dispose();
    nameCtrl.dispose();
    bioCtrl.dispose();
    emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(
                    hintText: "Enter name",
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: "Enter your password",
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: emailCtrl,
                decoration: const InputDecoration(
                    hintText: "Enter your email",
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: bioCtrl,
                decoration: const InputDecoration(
                    hintText: "Enter your bio",
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () async {
                  // String res = await AuthMethods().signUpUser(
                  //   name: nameCtrl.text,
                  //   bio: bioCtrl.text,
                  //   password: passwordController.text,
                  //   email: emailCtrl.text,
                  // );
                  // print(res);
                  await FirebaseFirestore.instance.collection("disks").add({
                    "name": "hard disk",
                    "discovery": "1924",
                  });
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
