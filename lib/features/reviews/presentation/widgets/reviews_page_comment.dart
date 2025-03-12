import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews_comment_stars.dart';
import 'package:recipe_app/features/reviews/presentation/widgets/reviews_comment_user.dart';

class ReviewsPageComment extends StatelessWidget {
  const ReviewsPageComment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 11,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReviewsCommentUser(
          image: "https://s3-alpha-sig."
              "figma.com/img/4ca7/eb9f/51c9f8e99b20b"
              "d33ea8333bcf70a93a0?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFW"
              "CW27IBOMQ&Signature=OrE6zbJca1YnCoIrm~wFs"
              "9wkkclR8BzCxDpab8hhe2SyjuuNSr4995V5UNp5KrhTWsdlJs2sHyHVprBbLEBPyEd~E"
              "TOMhbj6OT1MVkWObGhAq-sRbExUi0-B4v9lydYJR0-vWx5gvRLCf~"
              "QBxJN3BoL14j2QGU8fsFyDzwfMh3Vt0TNhZtjTKRCZv"
              "Fnvkctovhgp5X2FX-plWnMXTl1JwrHRLCLZEhc0A5KNZx2FBxnCprP0CWCxtZ4G0X3ILd~nhmlEXSQMSWGkff66Rw7s"
              "F-TeHNeiesOJyVS4sYHGQahYMpDfHXEHIQWrTnctDYJlFsp5u14zLpnodbm3pFJcBQ__",
          username: "@r_joshua",
          created: "(15 Mins Ago)",
        ),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipisc"
          "ing elit. Praesent fringilla eleifend purus vel"
          " dignissim. Praesent urna ante, iaculis at lobortis eu.",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
          softWrap: true,
          maxLines: 3,
        ),
        ReviewsCommentStars(rating: 3),
        SizedBox(height: 3,),
        Divider(
          height: 1,
          color: AppColors.pinkSub,
        )
      ],
    );
  }
}
