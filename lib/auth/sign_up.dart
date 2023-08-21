import 'package:flutter/material.dart';

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
      body: Column(
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
              controller: bioCtrl,
              decoration: const InputDecoration(
                  hintText: "Enter your bio",
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
        ],
      ),
    );
  }
}
