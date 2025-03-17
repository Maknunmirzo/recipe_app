import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_elevated_button.dart';
import 'package:recipe_app/features/reviews/presentation/manager/create_review_bloc.dart';
import 'package:recipe_app/features/reviews/presentation/manager/create_review_state.dart';

import '../../../../core/utils/colors.dart';

class CreateReviewButtons extends StatelessWidget {
  const CreateReviewButtons({
    super.key, required this.controller,
  });

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateReviewBloc, CreateReviewState>(
      builder: (context, state) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 17,
        children: [
          RecipeElevatedButton(
            text: "Cancel",
            callback: () {
              context.read<CreateReviewBloc>().add(ResetReviewForm());
              controller.clear();
            },
            size: Size(168.w, 23.h),
            fontSize: 14,
          ),
          RecipeElevatedButton(
            text: "Submit",
            callback: () async {
              context.read<CreateReviewBloc>().add(AddComment(controller.text));
               context.read<CreateReviewBloc>().add(ReviewSubmit());
              if(state.status==CreateReviewStatus.error){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Error 404!",
                      style: TextStyle(color: Colors.white), // Matn rangi
                    ),
                    backgroundColor: Colors.red, // Orqa fon rangi
                    duration: Duration(seconds: 3),
                  ),
                );

              }
               if(state.status==CreateReviewStatus.idle){
                 ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(
                     content: Text(
                       "Ma'lumot saqlandi!",
                       style: TextStyle(color: Colors.white), // Matn rangi
                     ),
                     backgroundColor: Colors.green, // Orqa fon rangi
                     duration: Duration(seconds: 3),
                   ),
                 );

               }
            },
            size: Size(168.w, 23.h),
            fontSize: 15,
            foregroundColor: Colors.white,
            backgroundColor: AppColors.redPinkMain,
          ),
        ],
      ),
    );
  }
}
