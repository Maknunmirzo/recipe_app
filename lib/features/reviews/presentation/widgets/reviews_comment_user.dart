import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/core/utils/colors.dart';

class ReviewsCommentUser extends StatelessWidget {
  const ReviewsCommentUser({
    super.key,
    required this.image,
    required this.username,
    required this.created,
  });

  final String image, username, created;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
            height: 46.h,
            width: 46.w,
            progressIndicatorBuilder: (context, url, progress) {
              return Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                  strokeWidth: 2,
                ),
              );
            },
            errorWidget: (context, url, error) =>
                Icon(Icons.person, size: 46, color: Colors.grey),
          ),
        ),
        SizedBox(
          width: 6,
        ),
        SizedBox(
          width: 300.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                username,
                style: TextStyle(
                  color: AppColors.redPinkMain,
                  fontFamily: "Poppins",
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                softWrap: true,
                maxLines: 1,
              ),
              Text(
                created,
                style: TextStyle(
                  color: AppColors.pinkSub,
                  fontFamily: "Poppins",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                softWrap: true,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
