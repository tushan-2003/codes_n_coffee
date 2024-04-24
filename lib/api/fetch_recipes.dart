import 'dart:convert';

import 'package:codes_n_coffee_assignment/model/recipe_model.dart';
import 'package:http/http.dart' as http;
import 'connect_api.dart';

class FetchRecipes {
  Future<List<RecipeModel>> fetchRecipe(String query) async {
    String url = "${API.url}/complexSearch?apiKey=${API.apiKey}&query=$query";
    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      final List<dynamic> data = json.decode(res.body)['results'];
      List<RecipeModel> recipes =
          data.map((recipe) => RecipeModel.fromJson(recipe)).toList();
      return recipes;
    } else {
      throw Exception(res.statusCode);
    }
  }
}
