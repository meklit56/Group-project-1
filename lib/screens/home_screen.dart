import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/data/mock_recipes.dart';
import 'package:recipe_meal_planner/models/recipe.dart';
import 'package:recipe_meal_planner/service/recipe_service.dart';
import '../models/recipe.dart';
import '../data/mock_recipes.dart'; // Use mock data if no API is available yet
import '../services/recipe_service.dart';
import 'recipe_details_screen.dart'; // Import the recipe service

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RecipeService _recipeService = RecipeService();
  List<Recipe> recipes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  // Fetch recipes from API or use mock data
  void _loadRecipes() async {
    try {
      final fetchedRecipes = await _recipeService.fetchRecipes();
      setState(() {
        recipes = fetchedRecipes;
        isLoading = false;
      });
    } catch (e) {
      print('Error loading recipes: $e');
      setState(() {
        recipes = mockRecipes; // Fallback to mock data
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ethiopian Recipes'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return ListTile(
                  leading: Image.network(recipe.imageUrl, width: 50, height: 50),
                  title: Text(recipe.title),
                  subtitle: Text(recipe.description),
                  onTap: () {
                    // Navigate to Recipe Details screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailsScreen(recipe: recipe),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}