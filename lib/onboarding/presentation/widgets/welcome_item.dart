import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_elevated_button.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/onboarding/presentation/pages/onboarding_view_model.dart';

class welcomeItem extends StatelessWidget {
  const welcomeItem({
    super.key,
    required this.image,
  });

  final String image;


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Image.network(
       image ,
        width: 168,
        height: 168,
        fit: BoxFit.cover,
      ),
    );
  }
}
