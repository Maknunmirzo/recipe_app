class CreateReviewModel {
  final int recipeId;
  final int rating;
  final String comment;
  final bool isReco;

  CreateReviewModel({
    required this.recipeId,
    required this.rating,
    required this.comment,
    required this.isReco,
  });

  Map<String,dynamic> toJson(){
    return {
      "RecipeId": recipeId,
      "Comment": comment,
      "Rating": rating,
      "Recommend": isReco
    };
  }

}
