class Routes {
  static const login = "/login";
  static const onboarding = "/onboarding";
  static const chefProfile = "/user/:userId";
  static const welcome = "/welcome";
  static const categories = "/categories";
  static const categoryDetail = "/category/detail/:categoryId";

  static String categoryDetailBuilder(int id) => "/category/detail/$id";
  static const signUp = "/signUp";

  static const recipe = "/recipe/:recipeId";

  static String recipeBuilder(int id, [String? title]) => "/recipe/$id";
  static const homePage = "/";

  static const meProfile="/me-profile";
}
