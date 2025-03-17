import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/reviews/data/repositories/review_repository.dart';
import 'package:recipe_app/features/reviews/presentation/manager/create_review_state.dart';

part 'create_review_events.dart';

class CreateReviewBloc extends Bloc<CreateReviewEvents, CreateReviewState> {
  final ReviewRepository _repo;

  CreateReviewBloc({
    required ReviewRepository repo,
    required int recipeId,
  })  : _repo = repo,
        super(CreateReviewState.initialize(recipeId)) {
    on<ResetReviewForm>(resetReviewForm);
    on<SetRecommend>(setRecommend);
    on<SetRating>(setRating);
    on<AddComment>(addComment);
    on<ReviewSubmit>(reviewSubmit);
  }

   resetReviewForm(ResetReviewForm event, Emitter emit)  {
    emit(CreateReviewState.initialize(state.recipeId));
  }

   setRating(SetRating event, Emitter emit)  {
    emit(state.copyWith(rating: event.rating));
  }

   setRecommend(SetRecommend event, Emitter emit)  {
    emit(state.copyWith(isReco: event.isReco));
  }

   addComment(AddComment event, Emitter emit)  {
    emit(state.copyWith(comment: event.comment));
  }

  Future reviewSubmit(ReviewSubmit event, Emitter emit) async {
    emit(state.copyWith(status: CreateReviewStatus.loading));
    bool result = await _repo.createReview(
      recipeId: state.recipeId,
      rating: state.rating!,
      comment: state.comment!,
      isReco: state.isReco!,
    );

    if(result) {
      emit(CreateReviewState.initialize(state.recipeId));
    }
    else{
      emit(state.copyWith(status: CreateReviewStatus.error));
    }
  }
}
