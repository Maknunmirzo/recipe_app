import 'package:flutter/material.dart';
import 'package:recipe_app/features/categories/data/models/category_model.dart';
import 'package:recipe_app/features/categories/data/repositories/categories_repository.dart';
import 'package:recipe_app/features/category_detail/data/models/recipe_small_model.dart';
import 'package:recipe_app/features/category_detail/data/repositories/recipe_repository.dart';

class HomePageViewModel extends ChangeNotifier {
  final RecipeRepository _recipeRepo;
  final CategoriesRepository _categoryRepo;

  List<RecipeSmallModel> myRecipes = [];

  RecipeSmallModel? trendingRecipe;
  List<CategoryModel> categories = [];

  bool loading = true;

  HomePageViewModel(
      {required RecipeRepository recipeRepo,
      required CategoriesRepository categoryRepo})
      : _recipeRepo = recipeRepo,
        _categoryRepo = categoryRepo {
    load();
  }

  Future load() async {
    loading = true;
    notifyListeners();
    trendingRecipe = await _recipeRepo.fetchTrendingRecipe();
    myRecipes = await _recipeRepo.fetchMyRecipes(2);
    categories = await _categoryRepo.fetchCategories();
    loading = false;
    notifyListeners();
  }
}
