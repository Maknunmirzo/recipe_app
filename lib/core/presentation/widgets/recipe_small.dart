import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/presentation/widgets/heart_item.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/category_detail/data/models/recipe_small_model.dart';

class RecipeSmall extends StatelessWidget {
  const RecipeSmall({super.key, required this.recipeSmallModel});

  final RecipeSmallModel recipeSmallModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(Routes.recipeBuilder(recipeSmallModel.id,
        ));
      },
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: -70,
              right: 5,
              left: 5,
              child: Container(
                height: 76,
                width: 159,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(14)),
                    border: Border(
                      bottom: BorderSide(color: AppColors.pinkSub, width: 1),
                      right: BorderSide(color: AppColors.pinkSub, width: 1),
                      left: BorderSide(color: AppColors.pinkSub, width: 1),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipeSmallModel.title,
                      style: TextStyle(
                        color: Color(0xff3E2823),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                      softWrap: true,
                      maxLines: 1,
                    ),
                    Text(
                      recipeSmallModel.description,
                      style: TextStyle(
                          color: Color(0xff3E2823),
                          fontFamily: "League Spartan",
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          height: 1),
                      softWrap: true,
                      maxLines: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${recipeSmallModel.rating}",
                              style: TextStyle(
                                color: AppColors.pinkSub,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            SvgPicture.asset(
                              "assets/svg/star.svg",
                              width: 10,
                              height: 10,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/svg/clock.svg",
                              width: 10,
                              height: 10,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "${recipeSmallModel.timeRequired}min",
                              style: TextStyle(
                                color: AppColors.pinkSub,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  recipeSmallModel.photo,
                  width: 170,
                  height: 153,
                  fit: BoxFit.cover,
                )),
            Positioned(
              top: 8,
              right: 8,
              child: HeartItem(isLike: false),
            ),
          ],
        ),
      ),
    );
  }
}
