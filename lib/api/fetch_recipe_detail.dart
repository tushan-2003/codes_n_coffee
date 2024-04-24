import 'dart:convert';
import 'package:codes_n_coffee_assignment/api/connect_api.dart';
import 'package:http/http.dart' as http;

class FetchRecipeDetails {
  Future<String> fetchRecipeDetails(String recipeId) async {
    String url = "${API.url}/$recipeId/card?apiKey=${API.apiKey}";

    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      final card = json.decode(res.body)['url'];

      return card;
    } else {
      throw Exception("Error");
    }
  }
}
