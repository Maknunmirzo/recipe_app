import 'dart:math';

import 'package:recipe_app/category_detail/data/models/category_detail_model.dart';
import 'package:recipe_app/core/client.dart';


class CategoryDetailRepository {
  final ApiClient apiClient;

  CategoryDetailRepository({
    required this.apiClient,
  });


  List<CategoryDetailModel> recipes = [];

  Future<List<CategoryDetailModel>> fetchRecipes({required int categoryId}) async {
    var recipeData = await apiClient.fetchRecipesByCategoryId(categoryId);
    recipes = recipeData.map((e) => CategoryDetailModel.fromJson(e)).toList();
    return recipes;
  }
}
