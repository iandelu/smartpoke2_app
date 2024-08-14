import 'package:flutter/material.dart';
import 'package:meal_ai/config/theme/brut_shadows.dart';
import 'package:meal_ai/features/recipes/models/recipe_model/recipe_model.dart';

class RecipeCard extends StatelessWidget {
  final RecipeModel recipe;
  final Function onTap;

  const RecipeCard({Key? key, required this.recipe, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Image section
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: recipe.pictureUrl.isNotEmpty
                    ? NetworkImage(recipe.pictureUrl)
                    : const AssetImage('assets/images/placeholder.png')
                as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Text section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Recipe title
                Text(
                  recipe.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                // Rating and time
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow[700], size: 16),
                    const SizedBox(width: 4),
                    Text(
                      recipe.ratings.toString(),
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(width: 16),
                    Icon(Icons.access_time, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '${recipe.totalTime} min',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Difficulty
                Text(
                  'Difficulty: ${recipe.difficulty}',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
