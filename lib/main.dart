import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/onboarding/data/repositories/onboarding_repository.dart';
import 'package:recipe_app/onboarding/presentation/pages/onboarding_view.dart';
import 'package:recipe_app/onboarding/presentation/pages/onboarding_view_model.dart';
import 'package:recipe_app/profile/data/repositories/user_repository.dart';
import 'package:recipe_app/profile/presentation/pages/user_view.dart';
import 'package:recipe_app/profile/presentation/pages/user_view_model.dart';
import 'package:recipe_app/recipe_detail/data/repositories/category_detail_repository.dart';

void main() {
  runApp(RecipeApp());
}

GoRouter _router = GoRouter(
  initialLocation: "/user/:userId",
  routes: [
    GoRoute(
      path: "/onboarding",
      builder: (context, state) => OnboardingView(
        viewModel: OnboardingViewModel(
          repo: context.read(),
        ),
      ),
    ),
    GoRoute(
      path: "/user/:userId",
      builder: (context, state) {
        final userId = int.tryParse(state.pathParameters["userId"] ?? "7") ?? 7;
        return UserView(userId: userId);
      },
    ),
  ],
);

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => ApiClient()),

        Provider(create: (context) => OnboardingRepository(client: context.read())),

        Provider(create: (context) => UserRepository(client: context.read())),

        Provider(create: (context) => CategoryDetailRepository(apiClient: context.read()))
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
      ),
    );
  }
}
