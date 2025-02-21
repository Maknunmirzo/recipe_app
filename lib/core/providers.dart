import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:recipe_app/auth/data/repositories/sign_up_repository.dart';
import '../auth/data/repositories/auth_repository.dart';
import '../categories/data/repositories/categories_repository.dart';
import '../category_detail/data/repositories/category_detail_repository.dart';
import '../onboarding/data/repositories/onboarding_repository.dart';
import '../profile/data/repositories/recipes_by_user_repository.dart';
import '../profile/data/repositories/user_repository.dart';
import 'client.dart';
import 'localization_view_model.dart';

List<SingleChildWidget> providers=[
  Provider(create: (context) => ApiClient()),
  Provider(
      create: (context) => OnboardingRepository(client: context.read())),
  Provider(create: (context) => UserRepository(client: context.read())),
  Provider(
      create: (context) =>
          CategoryDetailRepository(apiClient: context.read())),
  Provider(
      create: (context) => CategoriesRepository(client: context.read())),
  Provider(
      create: (context) =>
          RecipesByUserRepository(apiClient: context.read())),
  Provider(create: (context) => AuthRepository(client: context.read())),
  Provider(create: (context) => SignUpRepository(client: context.read()),),
  ChangeNotifierProvider(create: (context) => LocalizationViewModel(),)
];

