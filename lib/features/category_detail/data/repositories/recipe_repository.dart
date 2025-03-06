import '../../../../core/client.dart';
import '../../../recipe_detail/data/models/recipe_model.dart';
import '../models/recipe_small_model.dart';

class RecipeRepository {
  final ApiClient client;

  RecipeModel? recipe;

  RecipeRepository({
    required this.client,
  });

  List<RecipeSmallModel> recipesByCategory = [];
  List<RecipeSmallModel> recipesByUser = [];
  List<RecipeSmallModel> myRecipes = [];

  Future<List<RecipeSmallModel>> fetchRecipesByCategoryId(
      {required int categoryId}) async {
    var recipeData = await client.fetchRecipesByCategoryId(categoryId);
    recipesByCategory =
        recipeData.map((e) => RecipeSmallModel.fromJson(e)).toList();
    return recipesByCategory;
  }

  Future<RecipeSmallModel> fetchTrendingRecipe() async {
    var trendingRecipeData = await client.fetchTrendingRecipe();
    var trendingRecipe = RecipeSmallModel.fromJson(trendingRecipeData);
    return trendingRecipe;
  }

  Future<RecipeModel> fetchRecipeById(int recipeId) async {
    var rawRecipe = await client.fetchRecipeById(recipeId);
    recipe = RecipeModel.fromJson(rawRecipe);
    return recipe!;
  }

  Future<List<RecipeSmallModel>> fetchRecipesByUserId(
      {required int userId}) async {
    var recipeData = await client.fetchRecipesByUserId(userId);
    recipesByUser =
        recipeData.map((e) => RecipeSmallModel.fromJson(e)).toList();
    return recipesByUser;
  }

  Future<List<RecipeSmallModel>> fetchMyRecipes([int? limit]) async {
    var     recipeData = await client.fetchMyRecipes(limit);
    myRecipes = recipeData.map((e) => RecipeSmallModel.fromJson(e)).toList();
    return myRecipes;
  }

}
