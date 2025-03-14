import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_app_bar.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_bottom_bar.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_elevated_button.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/create_review_main_image.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews_app_bar.dart';

import '../../../../core/utils/colors.dart';

class CreateReviewView extends StatelessWidget {
  const CreateReviewView({super.key});

  @override
  Widget build(BuildContext context) {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 4,
            children: [
              Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) {
                    if (4 > index) {
                      return SvgPicture.asset(
                        width: 29,
                        height: 29,
                        "assets/svg/star.svg",
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          AppColors.redPinkMain,
                          BlendMode.srcIn,
                        ),
                      );
                    } else {
                      return SvgPicture.asset(
                        width: 29,
                        height: 29,
                        "assets/svg/star_free.svg",
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          AppColors.redPinkMain,
                          BlendMode.srcIn,
                        ),
                      );
                    }
                  },
                ),
              ),
              Text(
                "Your overall rating",
                maxLines: 1,
                softWrap: true,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
            ],
          ),
          SizedBox(
            height: 50
          ),
          TextField(
            minLines: 3,
            maxLines: 10,
            style: TextStyle(
              color: AppColors.beigeColor,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              filled: true,
              fillColor: Color(0xffFFC6C9),
              hintText: "Leave us Review!",
              hintStyle: TextStyle(
                color: AppColors.beigeColor.withValues(alpha: 0.6),
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
              border: InputBorder.none,
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [IconButton(
              color:Colors.pink,
              iconSize: 28,
              style: ButtonStyle(),
              onPressed: (){}, 
              icon: Icon(
                Icons.add,
                color: AppColors.redPinkMain,
                size: 21,
              ),
            ),
            Text("Add Photo",style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),)
          ],),
          SizedBox(height: 10,),
          Text("Do you recommend this recipe?",style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),),
          SizedBox(height: 100,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 17,
            children: [
            RecipeElevatedButton(text: "Cancel", callback: (){}, size: Size(168.w,23.h),fontSize: 14,),
            RecipeElevatedButton(text: "Submit", callback: (){}, size: Size(168.w,23.h),fontSize: 15,foregroundColor: Colors.white,backgroundColor: AppColors.redPinkMain,),
          ],)
        ],
      ),
    );
  }
}
