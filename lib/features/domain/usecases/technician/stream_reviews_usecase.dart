import 'package:fixit/features/features.dart';

class StreamReviewsUsecase {
  final TechnicianRepository _repository;

  StreamReviewsUsecase(this._repository);

  Stream<List<Review>> call(String uid) => _repository.streamReviews(uid);
}
