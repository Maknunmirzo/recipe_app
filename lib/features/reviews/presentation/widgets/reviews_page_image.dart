import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsPageImage extends StatelessWidget {
  const ReviewsPageImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: CachedNetworkImage(
        imageUrl: "https://s3-alpha-sig.figm"
            "a.com/img/3c37/d039/ca4530995428edbfc2eb6145ff1580a6?Expire"
            "s=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Si"
            "gnature=YYXM04b1V1rQCAeo9lg5i"
            "IXfyyw9NX6NUeHgnqEMtB7iK~3HSofB0xb6Py1macRsHlS-Zb5A3YqpL6W2"
            "7KWoB-~5wtoY5XDcDBSV6hcN1FWlhOaXWimJqxdHiDvrgCtC5ItjVy2CTzI"
            "xgJeEXdds45qEHZ8JJHmgexC5OXb5xcxblcvfB23FnQGxzgocNj9cAqZRVw"
            "WCt2aiok56-Bf9IQuYqrzPVsmtFYieEAeA~d9gO~Gwqj"
            "Wagf4-lxvsA~sT2qqkGl1ZpaSep3Oo4iQFJwqAygWc2-UpPamYPd"
            "mHGnvQmxYfMDAlXERXPxj~XJ2s3jsX5WyA5NXtfyhJumX9GQ__",
        fit: BoxFit.cover,
        height: 163.h,
        width: 163.w,
        progressIndicatorBuilder: (context, url, progress) {
          return Center(
            child: CircularProgressIndicator(
              value: progress.progress,
              color: Colors.white,
            ),
          );
        },
        errorWidget: (context, url, error) =>
            Icon(Icons.error, color: Colors.red),
      ),
    );
  }
}
