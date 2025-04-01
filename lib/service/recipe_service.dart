import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_meal_planner/models/recipe.dart';

class RecipeService {
  final String _baseUrl = 'https://api.spoonacular.com/recipes/complexSearch';
  final String _apiKey = 'f1d582e6391a4189b3317cbf8babc6d7';

  Future<List<Recipe>> fetchRecipes() async {
    final response = await http.get(Uri.parse('$_baseUrl?cuisine=ethiopian&apiKey=$_apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final recipes = (data['results'] as List)
          .map((recipeJson) => Recipe.fromJson(recipeJson))
          .toList();
      return recipes;
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}


