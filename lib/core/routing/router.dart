import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/auth/presentation/widgets/for_learn_date.dart';
import 'package:recipe_app/core/routing/routes.dart';
import '../../auth/presentation/manager/auth_view_model.dart';
import '../../auth/presentation/pages/auth_page.dart';
import '../../auth/presentation/pages/signUpView.dart';
import '../../categories/presentation/pages/categories_view.dart';
import '../../categories/presentation/pages/categories_view_model.dart';
import '../../category_detail/presentation/manager/category_detail_view_model.dart';
import '../../category_detail/presentation/pages/category_detail_view.dart';
import '../../onboarding/presentation/pages/onboarding_view.dart';
import '../../onboarding/presentation/pages/onboarding_view_model.dart';
import '../../onboarding/presentation/pages/onboarding_welcome.dart';
import '../../profile/presentation/pages/user_view.dart';

final GoRouter router = GoRouter(
  initialLocation: "/date",
  routes: [
    GoRoute(path: "/date",builder: (context, state) => ForLearnDate(),),
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
      path: Routes.userProfile,
      builder: (context, state) {
        final userId = int.tryParse(
              state.pathParameters["userId"] ?? "2",
            ) ??
            2;
        return UserView(userId: userId);
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
    )
  ],
);
