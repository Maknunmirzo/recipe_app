import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/categories/data/repositories/categories_repository.dart';
import 'package:recipe_app/categories/presentation/pages/categories_view.dart';
import 'package:recipe_app/categories/presentation/pages/categories_view_model.dart';
import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/onboarding/data/repositories/onboarding_repository.dart';
import 'package:recipe_app/onboarding/presentation/pages/onboarding_view.dart';
import 'package:recipe_app/onboarding/presentation/pages/onboarding_view_model.dart';
import 'package:recipe_app/onboarding/presentation/pages/onboarding_welcome.dart';
import 'package:recipe_app/profile/data/repositories/recipes_by_user_repository.dart';
import 'package:recipe_app/profile/data/repositories/user_repository.dart';
import 'package:recipe_app/profile/presentation/pages/user_view.dart';
import 'package:recipe_app/profile/presentation/pages/user_view_model.dart';

import 'category_detail/data/repositories/category_detail_repository.dart';
import 'category_detail/presentation/manager/category_detail_view_model.dart';
import 'category_detail/presentation/pages/category_detail_view.dart';
import 'core/utils/theme.dart';

void main() {
  runApp(RecipeApp());
}

GoRouter _router = GoRouter(
  initialLocation: "/user/:userId",
  routes: [
    GoRoute(
      path: "/onboarding",
      builder: (context, state) {
        bool back = bool.parse(state.uri.queryParameters["back"] ?? "false");
        return OnboardingView(
          viewModel: OnboardingViewModel(
              repo: context.read(), cateRepo: context.read(), back: back),
        );
      },
    ),
    GoRoute(
      path: "/user/:userId",
      builder: (context, state) {
        final userId = int.tryParse(
              state.pathParameters["userId"] ?? "2",
            ) ??
            2;
        return UserView(userId: userId);
      },
    ),
    GoRoute(
        path: "/welcome",
        builder: (context, state) => OnboardingWelcome(
              viewModel: OnboardingViewModel(
                  repo: context.read(), cateRepo: context.read()),
            )),
    GoRoute(
        path: "/categories",
        builder: (context, state) => CategoriesView(
                viewModel: CategoriesViewModel(
              repo: context.read(),
            ))),
    GoRoute(
        path: "/category/detail/:categoryId",
        builder: (context, state) {
          final int categoryId =
              int.tryParse(state.pathParameters["categoryId"] ?? "1") ?? 1;
          return CategoryDetailView(
            categoryId: categoryId,
            viewModel: CategoryDetailViewModel(
              repo: context.read(),
              categoryId: categoryId,
              cateRepo: context.read(),
            ),
          );
        })
  ],
);

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
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
                RecipesByUserRepository(apiClient: context.read()))
      ],
      child: MaterialApp.router(
        theme: appThemeData,
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
      ),
    );
  }
}
