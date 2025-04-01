class Recipe {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> ingredients;
  final String instructions;

  Recipe({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.ingredients,
    required this.instructions,
  });

  // Convert JSON data to Recipe object
  factory Recipe.fromJson(Map<String, dynamic> json) {
    // Handle optional fields like description, ingredients, and instructions
    return Recipe(
      title: json['title'] ?? 'No title',
      description: json['description'] ?? 'No description available',
      imageUrl: json['image'] ?? '',
      ingredients: List<String>.from(json['ingredients'] ?? []),
      instructions: json['instructions'] ?? 'No instructions available',
    );
  }
}
