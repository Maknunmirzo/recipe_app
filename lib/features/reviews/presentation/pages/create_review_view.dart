import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_bottom_bar.dart';
import 'package:recipe_app/features/reviews/presentation/manager/create_review_bloc.dart';
import 'package:recipe_app/features/reviews/presentation/manager/create_review_state.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/create_review_recommend.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/create_review_buttons.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/create_review_comment.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/create_review_main_image.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/create_review_view_set_rating.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews_app_bar.dart';

import '../../../../core/utils/colors.dart';

class CreateReviewView extends StatelessWidget {
   CreateReviewView({super.key});

  final _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateReviewBloc, CreateReviewState>(
      builder: (context, state) {
        return Scaffold(
          appBar: ReviewsAppBar(
            backTap: () {},
            title: "Leave a Review",
          ),
          bottomNavigationBar: RecipeBottomNavigationBar(),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 7.h),
            children: [
              CreateReviewMainImage(
                image: "https://s3-alpha-sig.figma.com/img/3c37/d039/ca4530"
                    "995428edbfc2eb6145ff1580a6?Expires=1742774400&Key-Pair-I"
                    "d=APKAQ4GOSFWCW27IBOMQ&Signature=YYXM04b1V1rQCAeo9lg5iIXfy"
                    "yw9NX6NUeHgnqEMtB7iK~3HSofB0xb6Py1macRsHlS-Zb5A3YqpL6W27KW"
                    "oB-~5wtoY5XDcDBSV6hcN1FWlhOaXWimJqxdHiDvrgCtC5ItjVy2CTzIxgJ"
                    "eEXdds45qEHZ8JJHmgexC5OXb5xcxblcvfB23FnQGxzgocNj9cAqZRVwWCt2a"
                    "iok56-Bf9IQuYqrzPVsmtFYieEAeA~d9gO~GwqjWagf4-lxvsA~sT2qqkGl1Z"
                    "paSep3Oo4iQFJwqAygWc2-UpPamYPdmHGnvQmxYfMDAlXERXPxj~XJ2s3jsX5W"
                    "yA5NXtfyhJumX9GQ__",
                title: "Chicken Burger",
              ),
              SizedBox(height: 20),
              CreateReviewViewSetRating(),
              SizedBox(height: 50),
              CreateReviewComment(controller: _controller,),
              SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    color: Colors.pink,
                    iconSize: 28,
                    style: ButtonStyle(),
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: AppColors.redPinkMain,
                      size: 21,
                    ),
                  ),
                  Text(
                    "Add Photo",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              CreateReviewRecommend(),
              SizedBox(height: 100),
              CreateReviewButtons(controller: _controller,)
            ],
          ),
        );
      },
    );
  }
}
