import 'package:flutter/material.dart';
import 'package:twitter_api/api/models/recipe_model.dart';
import 'package:twitter_api/api/recipe_card.dart';
import 'package:twitter_api/api/services/remote_services.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  List<Recipe>? recipes;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    var recipes = await RecipeApi().getRecipe();
    setState(() {
      _isLoading = false;
    });
    print("the recipes are $recipes");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Food menu",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
    );
    // body: _isLoading
    //     ? const CircularProgressIndicator()
    //     : ListView.builder(
    //       itemCount: recipes?.length,
    //         itemBuilder: (context, index) => RecipeCard(
    //             title: recipes![index].name,
    //             thumbnailUrl: recipes![index].images,
    //             rating: recipes![index].rating.toString(),
    //             cookTime: recipes![index].totalTime)));
  }
}
