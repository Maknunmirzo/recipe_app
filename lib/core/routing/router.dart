import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/features/home_page/presentation/manager/home_page_view_model.dart';
import 'package:recipe_app/features/home_page/presentation/pages/home_page.dart';
import 'package:recipe_app/features/recipe_detail/presentation/manager/recipe_view_model.dart';
import 'package:recipe_app/features/recipe_detail/presentation/manager/recipe_view_video_view_model.dart';
import 'package:recipe_app/features/recipe_detail/presentation/pages/recipe_view.dart';
import 'package:recipe_app/features/recipe_detail/presentation/pages/recipe_view_video.dart';

import '../../features/auth/presentation/manager/auth_view_model.dart';
import '../../features/auth/presentation/pages/auth_page.dart';
import '../../features/auth/presentation/pages/signUpView.dart';
import '../../features/auth/presentation/widgets/for_learn_date.dart';
import '../../features/categories/presentation/manager/categories_view_model.dart';
import '../../features/categories/presentation/pages/categories_view.dart';
import '../../features/category_detail/presentation/manager/category_detail_view_model.dart';
import '../../features/category_detail/presentation/pages/category_detail_view.dart';
import '../../features/onboarding/presentation/manager/onboarding_view_model.dart';
import '../../features/onboarding/presentation/pages/onboarding_view.dart';
import '../../features/onboarding/presentation/pages/onboarding_welcome.dart';
import '../../features/profile/presentation/pages/chef_profile_view.dart';
import 'routes.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.homePage,
  routes: [
    GoRoute(
      path: "/date",
      builder: (context, state) => ForLearnDate(),
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) {
        bool back = bool.parse(state.uri.queryParameters["back"] ?? "false");
        return OnboardingView(
          viewModel: OnboardingViewModel(
              repo: context.read(), cateRepo: context.read(), back: back),
        );
      },
    ),
    GoRoute(
      path: Routes.chefProfile,
      builder: (context, state) {
        final userId = int.tryParse(
              state.pathParameters["userId"] ?? "2",
            ) ??
            2;
        return ChefProfileView(userId: userId);
      },
    ),
    GoRoute(
        path: Routes.welcome,
        builder: (context, state) => OnboardingWelcome(
              viewModel: OnboardingViewModel(
                  repo: context.read(), cateRepo: context.read()),
            )),
    GoRoute(
      path: Routes.categories,
      builder: (context, state) => CategoriesView(
          viewModel: CategoriesViewModel(
        repo: context.read(),
      )),
    ),
    GoRoute(
        path: Routes.categoryDetail,
        builder: (context, state) {
          final int categoryId =
              int.tryParse(state.pathParameters["categoryId"] ?? "1") ?? 1;
          return CategoryDetailView(
            categoryId: categoryId,
            viewModel: CategoryDetailViewModel(
                repo: context.read(),
                categoryId: categoryId,
                cateRepo: context.read()),
          );
        }),
    GoRoute(
      path: Routes.login,
      name: Routes.login,
      builder: (context, state) => AuthView(
        vm: AuthViewModel(authRepo: context.read()),
      ),
    ),
    GoRoute(
      path: "/signUp",
      builder: (
        context,
        state,
      ) =>
          SignUpView(),
    ),
    GoRoute(
      path: Routes.recipe,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => RecipeViewModel(
          repo: context.read(),
          recipeId: 1,
        ),
        child: RecipeView(),
      ),
    ),
    GoRoute(
      path: Routes.homePage,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => HomePageViewModel(
          recipeRepo: context.read(),
          categoryRepo: context.read(),
        ),
        child: HomePage(),
      ),
    )
  ],
);
