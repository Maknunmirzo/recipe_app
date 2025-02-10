import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:recipe_app/profile/presentation/pages/user_view_model.dart';

import '../../../core/utils/colors.dart';

class UserView extends StatelessWidget {
  const UserView({super.key, required this.viewModel, required this.userId});

  final UserViewModel viewModel;
=======
import 'package:provider/provider.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/profile/presentation/widgets/user_view_app_bar.dart';
import 'package:recipe_app/profile/presentation/pages/user_view_model.dart';
import 'package:recipe_app/recipe_detail/presentation/widgets/category_detail_item.dart';

class UserView extends StatelessWidget {
  const UserView({super.key, required this.userId});

>>>>>>> 41bb9d6 (I added profile)
  final int userId;

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.user != null
            ? viewModel.user!.fullName
            : "Ism mavjud emas"),
      ),
      body: Placeholder(),
    );
  }
}
=======
    return ChangeNotifierProvider<UserViewModel>(
      create: (context) => UserViewModel(
        repo: context.read(),
        userId: userId,
        recipeRepo: context.read(),
      ),
      child: UserViewContent(),
    );
  }
}

class UserViewContent extends StatelessWidget {
  const UserViewContent({
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
>>>>>>> 41bb9d6 (I added profile)
