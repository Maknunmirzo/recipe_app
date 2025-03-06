import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/category_detail/data/models/recipe_small_model.dart';

class RecipeRating extends StatelessWidget {
  const RecipeRating({
    super.key, required this.rating,

  });

  final num rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$rating",
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
    );
  }
}
