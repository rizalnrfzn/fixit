import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
class ReviewModel with _$ReviewModel {
  factory ReviewModel({
    String? clientUid,
    String? review,
    int? rating,
    @TimestampConverter() DateTime? dateTime,
    List<String>? images,
  }) = _ReviewModel;

  ReviewModel._();

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  factory ReviewModel.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? options) =>
      ReviewModel.fromJson(snapshot.data() as Map<String, dynamic>);

  static Map<String, dynamic> toFirestore(
          ReviewModel object, SetOptions? options) =>
      object.toJson();

  Review toEntity() => Review(
        clientUid: clientUid,
        review: review,
        rating: rating,
        dateTime: dateTime,
        images: images,
      );
}
