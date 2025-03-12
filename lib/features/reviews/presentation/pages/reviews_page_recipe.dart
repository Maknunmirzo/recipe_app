import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_elevated_button.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/category_detail/data/models/recipe_small_model.dart';
import 'package:recipe_app/features/recipe_detail/data/models/user_small_model.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews_page_image.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews_recipe_stars.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews_recipe_user.dart';

class ReviewsPageRecipe extends StatelessWidget {
  const ReviewsPageRecipe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 223.h,
      padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 30.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.redPinkMain,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ReviewsPageImage(),
          SizedBox(
            width: 178.w,
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Chicken Burger",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  softWrap: true,
                  maxLines: 1,
                ),
                Row(
                  spacing: 4.w,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ReviewsRecipeStars(rating: 4),
                    Text(
                      "(${496} Reviews)",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                      softWrap: true,
                      maxLines: 1,
                    ),
                  ],
                ),
                ReviewsRecipeUser(
         user:
                UserSmallModel(
                  id: 1,
                  name: "Andrew",
                  surname: "Martinez-Chef",
                  username: "Andrew-Mar",
                  profilePhoto: "https://s3-alpha-sig."
                      "figma.com/img/4ca7/eb9f/51c9f8e99b20b"
                      "d33ea8333bcf70a93a0?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFW"
                      "CW27IBOMQ&Signature=OrE6zbJca1YnCoIrm~wFs"
                      "9wkkclR8BzCxDpab8hhe2SyjuuNSr4995V5UNp5KrhTWsdlJs2sHyHVprBbLEBPyEd~E"
                      "TOMhbj6OT1MVkWObGhAq-sRbExUi0-B4v9lydYJR0-vWx5gvRLCf~"
                      "QBxJN3BoL14j2QGU8fsFyDzwfMh3Vt0TNhZtjTKRCZv"
                      "Fnvkctovhgp5X2FX-plWnMXTl1JwrHRLCLZEhc0A5KNZx2FBxnCprP0CWCxtZ4G0X3ILd~nhmlEXSQMSWGkff66Rw7s"
                      "F-TeHNeiesOJyVS4sYHGQahYMpDfHXEHIQWrTnctDYJlFsp5u14zLpnodbm3pFJcBQ__",)

                ),
                SizedBox(
                  height: 24,
                  width: 126,
                  child: RecipeElevatedButton(
                    text: "Add Review",
                    callback: () {},
                    size: Size(126, 24),
                    foregroundColor: AppColors.redPinkMain,
                    fontSize: 13,
                    backgroundColor: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
