import 'package:flutter/material.dart';
import 'package:twitter_api/api/recipe_card.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.white,
        title: const Text("Food menu",style: TextStyle(color: Colors.black),) ,
        centerTitle: true,
        elevation: 0,
      ),
      body: RecipeCard(title: "title", cookTime: "cookTime", rating: "4.5", thumbnailUrl: "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80"),
    );
  }
}
