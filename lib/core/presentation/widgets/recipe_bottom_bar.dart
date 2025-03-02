import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_bottom_icon.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/core/utils/colors.dart';

class RecipeBottomNavigationBar extends StatelessWidget {
  const RecipeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          child: Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 60,
          // right: 0,
          // left: 0,
          child: BottomNavigationBarVanilla(),
        ),
      ],
    );
  }
}

class BottomNavigationBarVanilla extends StatelessWidget {
  const BottomNavigationBarVanilla({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.redPinkMain,
        borderRadius: BorderRadius.circular(33),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RecipeBottomIcon(onTap: () {}, icon: "assets/svg/bottom/home.svg"),
          RecipeBottomIcon(onTap: () {}, icon: "assets/svg/bottom/community.svg"),
          RecipeBottomIcon(onTap: () {
            context.go(Routes.categories);
          }, icon: "assets/svg/bottom/categories.svg"),
          RecipeBottomIcon(onTap: () {
            context.go(Routes.chefProfile);
          }, icon: "assets/svg/bottom/profile.svg")
        ],
      ),
    );
  }
}
