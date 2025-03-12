import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_bottom_bar.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/reviews/presentation/pages/reviews_page_recipe.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews_app_bar.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews_page_comment.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReviewsAppBar(backTap: () {}, title: "Reviews"),
      bottomNavigationBar: RecipeBottomNavigationBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewsPageRecipe(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 20.h),
            child: Text(
              "Comments",
              style: TextStyle(
                color: AppColors.redPinkMain,
                fontFamily: "Poppins",
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              softWrap: true,
              maxLines: 1,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 37.w),
              itemCount: 11,
              separatorBuilder: (context, index) => SizedBox(height: 11,),
              itemBuilder: (context, index) => ReviewsPageComment() ,


            ),
          )
        ],
      ),
    );
  }
}
