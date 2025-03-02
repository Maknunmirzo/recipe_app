import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/presentation/widgets/recipe_small.dart';
import '../../../../core/utils/colors.dart';
import '../manager/chef_profile_view_model.dart';
import '../widgets/user_view_app_bar.dart';

class ChefProfileView extends StatelessWidget {
  const ChefProfileView({super.key, required this.userId});

  final int userId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserViewModel>(
      create: (context) =>
          UserViewModel(
            repo: context.read(),
            userId: userId,
            recipeRepo: context.read(),
          ),
      child: ChefProfileViewContent(),
    );
  }
}

class ChefProfileViewContent extends StatelessWidget {
  const ChefProfileViewContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<UserViewModel>();
    if (viewModel.loading == true) {
      return CircularProgressIndicator();
    } else {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          extendBody: true,
          backgroundColor: AppColors.beigeColor,
          appBar: UserViewAppBar(),
          body: TabBarView(children: [
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: viewModel.recipeModels.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 170 / 226,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return CategoryDetailItem(
                  categoryDetailModel: viewModel.recipeModels[index],
                );
              },
            ),
            SizedBox(
              width: 350,
              height: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                     height: 250,
                      child: CircularProgressIndicator(
                        backgroundColor: AppColors.pink,
                        color: AppColors.redPinkMain,
                      ),
                    ),
                    Text(
                      "maknun is powerful",
                      style: TextStyle(
                        color: AppColors.redPinkMain,
                        fontFamily: "League Spartan",
                        fontSize: 94,
                        height: 0.9
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      );
    }
  }
}

