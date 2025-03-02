import 'package:flutter/material.dart';

import '../../../auth/data/repositories/user_repository.dart';
import '../../../category_detail/data/models/recipe_small_model.dart';
import '../../../category_detail/data/repositories/recipe_repository.dart';
import '../../data/models/user_model.dart';


class UserViewModel extends ChangeNotifier {
  final UserRepository _repo;
  final RecipeRepository _recipeRepo;
  final int userId;
  late UserModel user;
  late List<RecipeSmallModel> recipeModels;
  bool loading = true;

  UserViewModel(
      {required UserRepository repo,
      required this.userId,
      required RecipeRepository recipeRepo})
      : _repo = repo,
        _recipeRepo = recipeRepo {
    load();
  }

  Future<void> load() async {
    loading = true;
    notifyListeners();
    user = await _repo.fetchUser(userId);
    recipeModels = await _recipeRepo.fetchRecipesByUserId(userId: userId);
    loading = false;
    notifyListeners();
  }
}
