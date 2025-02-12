import 'dart:math';

import 'package:recipe_app/category_detail/data/models/category_detail_model.dart';
import 'package:recipe_app/core/client.dart';


class RecipesByUserRepository {
  final ApiClient apiClient;

  RecipesByUserRepository({
    required this.apiClient,
  });

  List<CategoryDetailModel> recipes = [];

  Future<List<CategoryDetailModel>> fetchRecipesByUserId({required int userId}) async {
    var recipeData = await apiClient.fetchRecipesByUserId(userId);
    recipes = recipeData.map((e) => CategoryDetailModel.fromJson(e)).toList();
    return recipes;
  }
}
