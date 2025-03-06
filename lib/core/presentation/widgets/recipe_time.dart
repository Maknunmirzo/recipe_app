import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/category_detail/data/models/recipe_small_model.dart';

class RecipeTime extends StatelessWidget {
  const RecipeTime({
    super.key,
    required this.time,
  });

  final num time;

  @override
  Widget build(BuildContext context) {
    return Row(
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
          "$time min",
          style: TextStyle(
            color: AppColors.pinkSub,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
