import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/screens/home_screen.dart';

void main() {
  runApp(RecipeMealPlannerApp());
}

class RecipeMealPlannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe and Meal Planner',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
