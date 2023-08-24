import 'package:twitter_api/api/models/post.dart';
import 'package:http/http.dart' as http;
import 'package:twitter_api/api/models/recipe_model.dart';

class RemoteService {
  // ignore: body_might_complete_normally_nullable
  Future<List<Post>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }

  Future<List<Recipe>?> getRecipes() async {
    var client = http.Client();
    var uri =
        Uri.parse("https://api.spoonacular.com/recipes/findByIngredients");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return recipeFromJson(json);
    }
    return null;
  }
}
