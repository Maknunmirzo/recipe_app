class Routes{
  static const login="/login";
  static const onboarding = "/onboarding";
  static const  userProfile= "/user/:userId";
  static const welcome = "/welcome";
  static const categories = "/categories";
  static const  categoryDetail= "/category/detail/:categoryId";

  static String categoryDetailBuilder(int id)=>  "/category/detail/$id";
  static const signUp="/signUp";

}