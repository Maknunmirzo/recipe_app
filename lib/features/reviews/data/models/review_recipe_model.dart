import '../../../recipe_detail/data/models/user_small_model.dart';

class ReviewRecipeModel {
  final num rating, reviewsCount;
  final int id;
  final String title, image;

  final UserSmallModel user;

  ReviewRecipeModel({
    required this.rating,
    required this.reviewsCount,
    required this.id,
    required this.title,
    required this.image,
    required this.user,
  });

  factory ReviewRecipeModel.fromJson(Map<String, dynamic> json) {
    return ReviewRecipeModel(
      rating: json["rating"],
      reviewsCount: json["reviewsCount"],
      id: json["id"],
      title: json["title"],
      image: json["photo"],
      user: UserSmallModel.fromJson(json["user"]),
    );
  }
}
