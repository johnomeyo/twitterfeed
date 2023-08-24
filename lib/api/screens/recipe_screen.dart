import 'package:flutter/material.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: Text("Food menu",style: TextStyle(color: Colors.black),) ,
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
