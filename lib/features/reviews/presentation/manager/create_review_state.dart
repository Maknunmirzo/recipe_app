import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

enum CreateReviewStatus { loading, idle, error }

@immutable
class CreateReviewState extends Equatable {
  @override
  List<Object?> get props => [recipeId, status, rating, comment, isReco];


  final int recipeId;
  final int? rating;
  final String? comment;
  final bool? isReco;
  final CreateReviewStatus status;

  const CreateReviewState({
    required this.recipeId,
    required this.rating,
    required this.comment,
    required this.isReco,
    required this.status,
  });

  static CreateReviewState initialize(int id) {
    return CreateReviewState(
      recipeId: id,
      rating: 0,
      comment: null,
      isReco: null,
      status: CreateReviewStatus.idle,
    );
  }

  CreateReviewState copyWith({
     int? recipeId,
    int? rating,
    String? comment,
    bool? isReco,
    CreateReviewStatus? status,
  }) {
    return CreateReviewState(
      recipeId: recipeId??this.recipeId,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      isReco: isReco ?? this.isReco,
      status: status ?? this.status,
    );
  }
}
