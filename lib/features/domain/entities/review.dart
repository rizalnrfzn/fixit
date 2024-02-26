import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';

@freezed
class Review with _$Review {
  factory Review({
    String? clientUid,
    String? clientName,
    String? clientPicture,
    String? review,
    int? rating,
    DateTime? dateTime,
  }) = _Review;
}
