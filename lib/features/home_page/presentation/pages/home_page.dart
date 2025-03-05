import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_bottom_bar.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_small.dart';

import 'package:recipe_app/features/home_page/presentation/manager/home_page_view_model.dart';
import 'package:recipe_app/features/home_page/presentation/widgets/home_page_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<HomePageViewModel>();
    return Scaffold(
      extendBody: true,
      appBar: (vm.loading) ? HomePageAppBar() : AppBar(title: Placeholder()),
      body: (vm.loading)
          ? Center(
              child: RecipeSmall(recipeSmallModel: vm.trendingRecipe!),
            )
          : CircularProgressIndicator(),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
