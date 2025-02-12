import 'package:flutter/material.dart';
import 'package:recipe_app/categories/data/models/category_model.dart';
import 'package:recipe_app/categories/data/repositories/categories_repository.dart';

import '../../data/models/category_detail_model.dart';
import '../../data/repositories/category_detail_repository.dart';

class CategoryDetailViewModel extends ChangeNotifier {
  final CategoryDetailRepository _repo;
  final CategoriesRepository _cateRepo;
  final int categoryId;

  List<CategoryDetailModel> recipes = [];
  List<CategoryModel> categories = [];
  CategoryModel? selected;

  CategoryDetailViewModel(
      {required CategoryDetailRepository repo,
      required this.categoryId,
      required CategoriesRepository cateRepo})
      : _repo = repo,
        _cateRepo = cateRepo {
    load();
  }

  Future load() async {
    recipes = await _repo.fetchRecipes(categoryId: categoryId);
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
