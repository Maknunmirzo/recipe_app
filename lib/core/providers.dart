import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../features/auth/data/repositories/user_repository.dart';
import '../features/categories/data/repositories/categories_repository.dart';
import '../features/category_detail/data/repositories/recipe_repository.dart';
import '../features/onboarding/data/repositories/onboarding_repository.dart';
import 'client.dart';
import 'localization_view_model.dart';

List<SingleChildWidget> providers=[
  Provider(create: (context) => ApiClient()),
  Provider(
      create: (context) => OnboardingRepository(client: context.read())),
  Provider(create: (context) => UserRepository(client: context.read())),
  Provider(
      create: (context) =>
          RecipeRepository(client: context.read())),
  Provider(
      create: (context) => CategoriesRepository(client: context.read())),
  ChangeNotifierProvider(create: (context) => LocalizationViewModel(),)
];

