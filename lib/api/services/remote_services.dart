import 'dart:convert';

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
}

class RecipeApi {
  /*
  
const req = unirest('GET', 'https://yummly2.p.rapidapi.com/feeds/list');

req.query({
	limit: '24',
	start: '0'
});

req.headers({
	'X-RapidAPI-Key': 'c9691ec2f3msh4cbc08d85a8139ep1ff38cjsnb4bb104621e3',
	'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
});
  */
  // ignore: body_might_complete_normally_nullable
  Future<List<Recipe>?> getRecipe() async {
    var client = http.Client();
    var uri = Uri.parse("https://yummly2.p.rapidapi.com/feeds/list");
    final response = await client.get(uri);
     if (response.statusCode == 200) {
      var json = response.body;
     
    }
  }
}
