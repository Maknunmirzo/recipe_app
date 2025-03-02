import 'package:flutter/material.dart';

import '../../../categories/data/models/category_model.dart';
import '../../../categories/data/repositories/categories_repository.dart';
import '../../data/models/recipe_small_model.dart';
import '../../data/repositories/recipe_repository.dart';


class CategoryDetailViewModel extends ChangeNotifier {
  final RecipeRepository _repo;
  final CategoriesRepository _cateRepo;
  final int categoryId;

  List<RecipeSmallModel> recipes = [];
  List<CategoryModel> categories = [];
  CategoryModel? selected;

  CategoryDetailViewModel(
      {required RecipeRepository repo,
      required this.categoryId,
      required CategoriesRepository cateRepo})
      : _repo = repo,
        _cateRepo = cateRepo {
    load();
  }

  Future load() async {
    recipes = await _repo.fetchRecipesByCategoryId(categoryId: categoryId);
    categories = await _cateRepo.fetchCategories();
    if (categories.isNotEmpty) {
      selected = categories.firstWhere(
        (category) => category.id == categoryId,
        orElse: () => categories.first,
      );
    }

    notifyListeners();
  }
}
