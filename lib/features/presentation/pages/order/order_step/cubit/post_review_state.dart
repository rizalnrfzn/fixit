part of 'post_review_cubit.dart';

@freezed
class PostReviewState with _$PostReviewState {
  const factory PostReviewState.initial() = _Initial;
  const factory PostReviewState.files(List<File> files) = _Files;
}
